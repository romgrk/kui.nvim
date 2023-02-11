import { BaseImageResource } from './BaseImageResource';
import { Canvas } from 'src/context2d';
/**
 * @interface OffscreenCanvas
 */
/**
 * Resource type for HTMLCanvasElement and OffscreenCanvas.
 * @memberof PIXI
 */
export declare class CanvasResource extends BaseImageResource {
    /**
     * @param source - Canvas element to use
     */
    constructor(source: Canvas);
    /**
     * Used to auto-detect the type of resource.
     * @param {*} source - The source object
     * @returns {boolean} `true` if source is HTMLCanvasElement or OffscreenCanvas
     */
    static test(source: unknown): source is Canvas;
}
