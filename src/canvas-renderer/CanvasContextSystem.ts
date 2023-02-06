import * as systems from 'src/core/systems'
import { Matrix } from 'src/math';
import { BLEND_MODES } from 'src/constants';
import { Color, ColorSource } from 'src/color';
import { mapCanvasBlendModesToPixi } from './utils/mapCanvasBlendModesToPixi';
import { Context2D, CompositeOperation } from 'src/context2d'

import type { ISystem } from 'src/core';
import type { CanvasRenderer } from './CanvasRenderer';

const tempMatrix = new Matrix();

/**
 * Rendering context for all browsers. This includes platform-specific
 * properties that are not included in the spec for CanvasRenderingContext2D
 * @private
 */
export type CanvasRenderingContext2D = Context2D

/**
 * System that manages the canvas `2d` contexts
 * @memberof PIXI
 */
export class CanvasContextSystem implements ISystem
{
    /** A reference to the current renderer */
    private renderer: CanvasRenderer;

    /** The root canvas 2d context that everything is drawn with. */
    public rootContext: CanvasRenderingContext2D;
    /** The currently active canvas 2d context (could change with renderTextures) */
    public activeContext: CanvasRenderingContext2D;
    public activeResolution = 1;

    /** Tracks the blend modes useful for this renderer. */
    public readonly blendModes: CompositeOperation[] = mapCanvasBlendModesToPixi();

    /** Projection transform, passed in render() stored here */
    _projTransform: Matrix | null = null;

    /** @private */
    _outerBlend = false;

    /** @private */
    _activeBlendMode = BLEND_MODES.NORMAL;

    /** @param renderer - A reference to the current renderer */
    constructor(renderer: CanvasRenderer)
    {
        this.renderer = renderer;
        // FIXME: when is this initialized?
        this.rootContext = null as any;
        this.activeContext = null as any;
    }

    /** initiates the system */
    init(): void
    {
        // this.rootContext = this.renderer.view.getContext('2d', { alpha }) as CanvasRenderingContext2D;
        this.rootContext = new Context2D(this.renderer.view.width, this.renderer.view.height);
        if (this.renderer.background.alpha < 1)
            this.rootContext.globalAlpha = this.renderer.background.alpha;

        this.activeContext = this.rootContext;
    }

    /**
     * Sets matrix of context.
     * called only from render() methods
     * takes care about resolution
     * @param transform - world matrix of current element
     * @param roundPixels - whether to round (tx,ty) coords
     * @param localResolution - If specified, used instead of `renderer.resolution` for local scaling
     */
    setContextTransform(transform: Matrix, roundPixels?: boolean, localResolution?: number): void
    {
        let mat = transform;
        const proj = this._projTransform;
        const contextResolution = this.activeResolution;

        localResolution = localResolution || contextResolution;

        if (proj)
        {
            mat = tempMatrix;
            mat.copyFrom(transform);
            mat.prepend(proj);
        }

        if (roundPixels)
        {
            this.activeContext.setTransform(
                mat.a * localResolution,
                mat.b * localResolution,
                mat.c * localResolution,
                mat.d * localResolution,
                (mat.tx * contextResolution) | 0,
                (mat.ty * contextResolution) | 0
            );
        }
        else
        {
            this.activeContext.setTransform(
                mat.a * localResolution,
                mat.b * localResolution,
                mat.c * localResolution,
                mat.d * localResolution,
                mat.tx * contextResolution,
                mat.ty * contextResolution
            );
        }
    }

    /**
     * Clear the canvas of renderer.
     * @param {string} [clearColor] - Clear the canvas with this color, except the canvas is transparent.
     * @param {number} [alpha] - Alpha to apply to the background fill color.
     */
    public clear(clearColor?: ColorSource, alpha?: number): void
    {
        const { activeContext: context, renderer } = this;
        const fillColor = clearColor
            ? Color.shared.setValue(clearColor)
            : this.renderer.background.backgroundColor;

        context.clearRect(0, 0, renderer.width, renderer.height);

        if (clearColor)
        {
            context.globalAlpha = alpha ?? this.renderer.background.alpha;
            context.fillStyle = fillColor.toHex();
            context.fillRect(0, 0, renderer.width, renderer.height);
            context.globalAlpha = 1;
        }
    }

    /**
     * Sets the blend mode of the renderer.
     * @param {number} blendMode - See {@link PIXI.BLEND_MODES} for valid values.
     * @param {boolean} [readyForOuterBlend=false] - Some blendModes are dangerous, they affect outer space of sprite.
     * Pass `true` only if you are ready to use them.
     */
    setBlendMode(blendMode: BLEND_MODES, readyForOuterBlend?: boolean): void
    {
        const outerBlend = blendMode === BLEND_MODES.SRC_IN
                 || blendMode === BLEND_MODES.SRC_OUT
                 || blendMode === BLEND_MODES.DST_IN
                 || blendMode === BLEND_MODES.DST_ATOP;

        if (!readyForOuterBlend && outerBlend)
        {
            blendMode = BLEND_MODES.NORMAL;
        }

        if (this._activeBlendMode === blendMode)
        {
            return;
        }

        this._activeBlendMode = blendMode;
        this._outerBlend = outerBlend;
        this.activeContext.globalCompositeOperation = this.blendModes[blendMode];
    }

    resize(): void
    {
        // TODO: hanlde resize
    }

    /** Checks if blend mode has changed. */
    invalidateBlendMode(): void
    {
        this._activeBlendMode = this.blendModes.indexOf(this.activeContext.globalCompositeOperation);
    }

    public destroy(): void
    {
        const self = this as any;
        self.renderer = null;
        self.rootContext = null;
        self.activeContext = null;
    }
}

systems.register('canvasContext', CanvasContextSystem)
