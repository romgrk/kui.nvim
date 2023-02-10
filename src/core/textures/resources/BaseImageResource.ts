import { Resource } from './Resource';

import type { ImageSource } from '../BaseTexture';

/**
 * Base for all the image/canvas resources.
 * @memberof PIXI
 */
export class BaseImageResource extends Resource
{
    /**
     * The source element.
     * @member {HTMLImageElement|HTMLVideoElement|ImageBitmap|PIXI.ICanvas}
     * @readonly
     */
    public source: ImageSource;

    /**
     * If set to `true`, will force `texImage2D` over `texSubImage2D` for uploading.
     * Certain types of media (e.g. video) using `texImage2D` is more performant.
     * @default false
     * @private
     */
    public noSubImage: boolean;

    /**
     * @param {HTMLImageElement|HTMLVideoElement|ImageBitmap|PIXI.ICanvas} source
     */
    constructor(source: ImageSource)
    {
        const sourceAny = source as any;
        const width = sourceAny.naturalWidth || sourceAny.videoWidth || sourceAny.width;
        const height = sourceAny.naturalHeight || sourceAny.videoHeight || sourceAny.height;

        super(width, height);

        this.source = source;
        this.noSubImage = false;
    }

    /**
     * Checks if source width/height was changed, resize can cause extra baseTexture update.
     * Triggers one update in any case.
     */
    override update(): void
    {
        if (this.destroyed)
        {
            return;
        }

        const source = this.source as any;

        const width = source.naturalWidth || source.videoWidth || source.width;
        const height = source.naturalHeight || source.videoHeight || source.height;

        this.resize(width, height);

        super.update();
    }

    /** Destroy this {@link BaseImageResource} */
    override dispose(): void
    {
        this.source = null as any;
    }
}
