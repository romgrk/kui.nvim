import settings from 'src/settings'
import {
    Point,
    Rectangle,
} from 'src/core';
import { editor } from 'src/editor';
import { Disposer } from 'src/dispose';
import { Container } from 'src/display';
import { GraphicsGeometry } from 'src/graphics/GraphicsGeometry';
import { FillStyle } from 'src/graphics/styles/FillStyle';

import type { ColorSource, IPointData, Renderer } from 'src/core';
import type { IDestroyOptions } from 'src/display';

export interface Input extends Container {}

type Dimensions =
    | { /** Input width in pixels. Will be rounded to fall on a cell boundary. */
        width: number }
    | { /** Input width in cells. */
        cols: number }

export type InputOptions = Dimensions & {
    color?: number,
    backgroundColor?: number,
    borderColor?: number,
    borderWidth?: number,
    borderRadius?: number,
    group?: string,
    padding?: number,
    paddingX?: number,
    paddingY?: number,
}

/**
 * The Input interface represents a text input, including the associated neovim buffer
 * and window required to display it.
 */
export class Input extends Container
{

    /**
     * Temporary point to use for containsPoint.
     * @private
     */
    static _TEMP_POINT = new Point();

    private _dispose: Disposer

    /** Represents the input geometry */
    private _geometry: GraphicsGeometry;

    private _dirtyWindow: boolean
    private _bufferId: number
    private _windowId: number

    private _group: string | null
    private _color: number
    private _backgroundColor: number
    private _borderColor: number
    private _borderWidth: number
    private _borderRadius: number
    private _paddingX: number
    private _paddingY: number

    private _computedGroup: string

    constructor(options: InputOptions)
    {
        super()
        this._dispose = new Disposer()

        this._geometry = new GraphicsGeometry()
        this._geometry.refCount++
        this._dirtyWindow = true
        this._bufferId = -1
        this._windowId = -1

        this._group = options.group ?? null
        this._color = options.color!
        this._backgroundColor = options.backgroundColor!
        this._computedGroup = 'NormalFloat'
        this._recomputeColors()
        this._borderColor = options.borderColor ?? 0
        this._borderWidth = options.borderWidth ?? 0
        this._borderRadius = options.borderRadius ?? 0

        this._paddingX = options.paddingX ?? options.padding ?? 0
        this._paddingY = options.paddingY ?? options.padding ?? 0

        this.width = 'width' in options ?
            options.width : options.cols * settings.DIMENSIONS.cell_pixels.width
        this.height = settings.DIMENSIONS.cell_pixels.height

        this._updateGeometry()
        this._calculateBounds()

        this._dispose.add(editor.onColorSchemeChange(this._recomputeColors))
    }

    public clone(): Input
    {
        throw new Error('Input.clone: not supported')
    }

    _recomputeColors = () => {
        if (this._group) {
            const colors = vim.api.nvim_get_hl_by_name(this._group, true)
            this._color = colors.foreground ?? 0xffffff
            this._backgroundColor = colors.background ?? 0x000000
        } else {
            const colors = vim.api.nvim_get_hl_by_name('NormalFloat', true)
            this._color = this._color ?? colors.foreground ?? 0xffffff
            this._backgroundColor = this._backgroundColor ?? colors.background ?? 0x000000
        }
        this._computedGroup = getGroupForColors(this._color, this._backgroundColor)
    }

    /** The position of the Input */
    get x(): number { return this.transform.position.x }
    set x(value: number)
    {
        this.transform.position.x = value - this._paddingX;
    }

    /** The position of the Input */
    get y(): number { return this.position.y; }
    set y(value: number)
    {
        this.transform.position.y = value - this._paddingY;
    }

    /** The width of the Text, setting this will actually modify the scale to achieve the value set. */
    get width(): number
    {
        return this._width;
    }
    set width(value: number)
    {
        const width = Math.ceil(value / settings.DIMENSIONS.cell_pixels.width) * settings.DIMENSIONS.cell_pixels.width
        this._width = width + 2 * this._paddingX
        this._dirtyWindow = true
    }

    /** The height of the Text, setting this will actually modify the scale to achieve the value set. */
    get height(): number
    {
        return this._height;
    }
    set height(value: number)
    {
        const height = Math.ceil(value / settings.DIMENSIONS.cell_pixels.height) * settings.DIMENSIONS.cell_pixels.height
        this._height = height + 2 * this._paddingY
        this._dirtyWindow = true
    }

    /** Renders the object using the Canvas renderer */
    _renderCanvas(renderer: Renderer): void
    {
        if (this._dirtyWindow)
            this._updateWindow(renderer)

        const context = renderer.canvasContext.activeContext;
        context.fillStyle = this._backgroundColor
        context.roundRect(this.x, this.y, this.width, this.height, this._borderRadius)
        context.fill()
        context.clearRoundRect(
            this.x + this._paddingX,
            this.y + this._paddingY,
            this.width  - 2 * this._paddingX,
            this.height - 2 * this._paddingY,
            this._paddingY > 0 || this._paddingX > 0 ? 0 : this._borderRadius,
        )
        if (this._borderWidth > 0) {
            context.strokeStyle = this._borderColor
            context.lineWidth = this._borderWidth
            context.roundRect(this.x, this.y, this.width, this.height, this._borderRadius)
            context.stroke()
        }
    }

    _updateWindow(renderer: Renderer) {
        this._dirtyWindow = false

        const bounds = this.getBounds()
        const config = {
            relative: 'editor' as const,
            style: 'minimal' as const,
            col: renderer.options.col + Math.round((bounds.x + this._paddingX) / settings.DIMENSIONS.cell_pixels.width),
            row: renderer.options.row + Math.round((bounds.y + this._paddingY) / settings.DIMENSIONS.cell_pixels.height),
            width:  (this.width  - 2 * this._paddingX) / settings.DIMENSIONS.cell_pixels.width,
            height: (this.height - 2 * this._paddingY) / settings.DIMENSIONS.cell_pixels.height,
        }

        if (this._windowId === -1 || !vim.api.nvim_win_is_valid(this._windowId)) {
            this._windowId = vim.api.nvim_open_win(this._getBufferId(), true, config)
        }
        else {
            vim.api.nvim_win_set_config(this._windowId, config)
        }
        vim.api.nvim_win_set_option(this._windowId, 'sidescrolloff', 0)
        vim.api.nvim_win_set_option(this._windowId, 'winhl', `NormalFloat:${this._computedGroup}`)
    }

    _getBufferId() {
        if (this._bufferId === -1 || !vim.api.nvim_buf_is_valid(this._bufferId))
            this._bufferId = vim.api.nvim_create_buf(false, true)
        return this._bufferId
    }

    _updateGeometry()
    {
        this._geometry.clear()
        this._geometry.drawShape(
            new Rectangle(this.x, this.y, this.width, this.height),
            FillStyle.WHITE,
            null,
            null
        )
    }


    /** Retrieves the bounds of the graphic shape as a rectangle object. */
    protected _calculateBounds(): void
    {
        const geometry = this._geometry;

        // skipping when graphics is empty, like a container
        if (!geometry.graphicsData.length)
        {
            return;
        }

        const { minX, minY, maxX, maxY } = geometry.bounds;

        this._bounds.addFrame(this.transform, minX, minY, maxX, maxY);
        this._bounds.addFrame
    }

    /** Tests if a point is inside this graphics object */
    public containsPoint(point: IPointData): boolean
    {
        this.worldTransform.applyInverse(point, Input._TEMP_POINT);

        return this._geometry.containsPoint(Input._TEMP_POINT);
    }

    /** Destroys the Input object. */
    public destroy(options?: IDestroyOptions | boolean): void
    {
        super.destroy(options)
        this._dispose.destroy()
        if (this._windowId !== -1 && vim.api.nvim_win_is_valid(this._windowId)) {
            vim.api.nvim_win_close(this._windowId, true)
        }
    }
}

function getGroupForColors(foreground: number, background: number) {
    const fg = foreground.toString(16).padStart(6, '0')
    const bg = background.toString(16).padStart(6, '0')
    const name = `kui_${fg}_${bg}`
    if (vim.fn.hlexists(name) === 0)
        vim.cmd(`hi ${name} guifg=#${fg} guibg=#${bg}`)
    return name
}
