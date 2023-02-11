import { Resource } from './Resource';
import type { ImageSource } from '../BaseTexture';
/**
 * Base for all the image/canvas resources.
 * @memberof PIXI
 */
export declare class BaseImageResource extends Resource {
    /**
     * The source element.
     * @member {HTMLImageElement|HTMLVideoElement|ImageBitmap|PIXI.ICanvas}
     * @readonly
     */
    source: ImageSource;
    /**
     * If set to `true`, will force `texImage2D` over `texSubImage2D` for uploading.
     * Certain types of media (e.g. video) using `texImage2D` is more performant.
     * @default false
     * @private
     */
    noSubImage: boolean;
    /**
     * @param {HTMLImageElement|HTMLVideoElement|ImageBitmap|PIXI.ICanvas} source
     */
    constructor(source: ImageSource);
    /**
     * Checks if source width/height was changed, resize can cause extra baseTexture update.
     * Triggers one update in any case.
     */
    update(): void;
    /** Destroy this {@link BaseImageResource} */
    dispose(): void;
}
