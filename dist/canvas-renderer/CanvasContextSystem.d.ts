import { Matrix } from 'src/math';
import { BLEND_MODES } from 'src/constants';
import { ColorSource } from 'src/color';
import { Context2D, CompositeOperation } from 'src/context2d';
import type { ISystem } from 'src/core';
import type { CanvasRenderer } from './CanvasRenderer';
/**
 * Rendering context for all browsers. This includes platform-specific
 * properties that are not included in the spec for CanvasRenderingContext2D
 * @private
 */
export type CanvasRenderingContext2D = Context2D;
/**
 * System that manages the canvas `2d` contexts
 * @memberof PIXI
 */
export declare class CanvasContextSystem implements ISystem {
    /** A reference to the current renderer */
    private renderer;
    /** The root canvas 2d context that everything is drawn with. */
    rootContext: CanvasRenderingContext2D;
    /** The currently active canvas 2d context (could change with renderTextures) */
    activeContext: CanvasRenderingContext2D;
    activeResolution: number;
    /** Tracks the blend modes useful for this renderer. */
    readonly blendModes: CompositeOperation[];
    /** Projection transform, passed in render() stored here */
    _projTransform: Matrix | null;
    /** @private */
    _outerBlend: boolean;
    /** @private */
    _activeBlendMode: BLEND_MODES;
    /** @param renderer - A reference to the current renderer */
    constructor(renderer: CanvasRenderer);
    /** initiates the system */
    init(): void;
    /**
     * Sets matrix of context.
     * called only from render() methods
     * takes care about resolution
     * @param transform - world matrix of current element
     * @param roundPixels - whether to round (tx,ty) coords
     * @param localResolution - If specified, used instead of `renderer.resolution` for local scaling
     */
    setContextTransform(transform: Matrix, roundPixels?: boolean, localResolution?: number): void;
    /**
     * Clear the canvas of renderer.
     * @param {string} [clearColor] - Clear the canvas with this color, except the canvas is transparent.
     * @param {number} [alpha] - Alpha to apply to the background fill color.
     */
    clear(clearColor?: ColorSource, alpha?: number): void;
    /**
     * Sets the blend mode of the renderer.
     * @param {number} blendMode - See {@link PIXI.BLEND_MODES} for valid values.
     * @param {boolean} [readyForOuterBlend=false] - Some blendModes are dangerous, they affect outer space of sprite.
     * Pass `true` only if you are ready to use them.
     */
    setBlendMode(blendMode: BLEND_MODES, readyForOuterBlend?: boolean): void;
    resize(): void;
    /** Checks if blend mode has changed. */
    invalidateBlendMode(): void;
    destroy(): void;
}
