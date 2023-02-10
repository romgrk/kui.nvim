import { BaseImageResource } from './BaseImageResource';

import { Canvas } from 'src/context2d';

/**
 * @interface OffscreenCanvas
 */

/**
 * Resource type for HTMLCanvasElement and OffscreenCanvas.
 * @memberof PIXI
 */
export class CanvasResource extends BaseImageResource
{
    /**
     * @param source - Canvas element to use
     */
    // eslint-disable-next-line @typescript-eslint/no-useless-constructor
    constructor(source: Canvas)
    {
        super(source);
    }

    /**
     * Used to auto-detect the type of resource.
     * @param {*} source - The source object
     * @returns {boolean} `true` if source is HTMLCanvasElement or OffscreenCanvas
     */
    static test(source: unknown): source is Canvas
    {
        // Check for browsers that don't yet support OffscreenCanvas
        if (source instanceof Canvas)
        {
            return true;
        }

        return false;
    }
}
