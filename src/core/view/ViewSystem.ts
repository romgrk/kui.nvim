import * as api from 'kui.legacy.api'
import { Image } from 'kui.legacy.image'
import * as systems from '../systems'
import { Rectangle } from 'src/math';
import { settings } from 'src/settings';

import type { ICanvas } from 'src/core';
import type { Renderer } from '../Renderer';
import type { ISystem } from '../system/ISystem';

api.setup()

/**
 * Options passed to the ViewSystem
 * @memberof PIXI
 */
export interface ViewOptions
{
    /** The buffer number to which we are attached */
    buffer?: number
    /** The x position of the screen. */
    col: number
    /** The y position of the screen. */
    row: number
    /** The width of the screen. */
    width: number
    /** The height of the screen. */
    height: number
    /** The canvas to use as a view, optional. */
    view?: ICanvas;
    /** Resizes renderer view in CSS pixels to allow for resolutions other than 1. */
    autoDensity?: boolean
    /** The resolution / device pixel ratio of the renderer. */
    resolution?: number
}

/**
 * The view system manages the main canvas that is attached to the DOM.
 * This main role is to deal with how the holding the view reference and dealing with how it is resized.
 * @memberof PIXI
 */
export class ViewSystem implements ISystem<ViewOptions, boolean>
{
    private renderer: Renderer;
    private _options: ViewOptions | null;
    private _image: Image | null;
    private _isTransmitting: boolean;

    /**
     * Measurements of the screen. (0, 0, screenWidth, screenHeight).
     *
     * Its safe to use as filterArea or hitArea for the whole stage.
     * @member {PIXI.Rectangle}
     */
    public screen: Rectangle;

    /**
     * The canvas element that everything is drawn to.
     * @member {PIXI.ICanvas}
     */
    public element: ICanvas;

    constructor(renderer: Renderer)
    {
        this.renderer = renderer;
        this.screen = null as any;
        this.element = null as any;
        this._options = null;
        this._image = null;
        this._isTransmitting = false;
    }

    /**
     * initiates the view system
     * @param {PIXI.ViewOptions} options - the options for the view
     */
    init(options: ViewOptions): void
    {
        this._options = options
        this.screen = new Rectangle(0, 0, options.width, options.height);
        this.element = options.view ??
            settings.ADAPTER.createCanvas(options.width, options.height) as ICanvas;

        this.renderer.on('postrender', this.onPostRender)
    }

    /** After rendering, transmit the image to the terminal */
    onPostRender = () => {
        if (this._isTransmitting)
            return
        const surface = this.renderer.canvasContext.rootContext.surface
        const image = Image.new(surface, {
            buffer: this._options!.buffer,
            row: this._options!.row,
            col: this._options!.col,
        })
        this._isTransmitting = true
        image.transmit(() => {
            this._image?.delete({ free: true })
            image.display()
            this._image = image
            this._isTransmitting = false
        })
    }

    /**
     * Resizes the screen and canvas to the specified dimensions.
     * @param desiredScreenWidth - The new width of the screen.
     * @param desiredScreenHeight - The new height of the screen.
     */
    resizeView(desiredScreenWidth: number, desiredScreenHeight: number): void
    {
        this.element.width = Math.round(desiredScreenWidth);
        this.element.height = Math.round(desiredScreenHeight);

        const screenWidth = this.element.width;
        const screenHeight = this.element.height;

        this.screen.width = screenWidth;
        this.screen.height = screenHeight;

        /**
         * Fired after view has been resized.
         * @event PIXI.Renderer#resize
         * @param {number} screenWidth - The new width of the screen.
         * @param {number} screenHeight - The new height of the screen.
         */
        this.renderer.emit('resize', screenWidth, screenHeight);
        this.renderer.runners.resize.emit(this.screen.width, this.screen.height);
    }

    /**
     * Destroys this System and removes the canvas from the dom.
     */
    destroy(): void
    {
        this._image?.delete({ free: true })
        this.renderer.off('postrender', this.onPostRender)
    }
}

systems.register('_view', ViewSystem)
