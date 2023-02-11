import type { ISize } from 'src/math';
import type { Resource } from './Resource';
export type IResourcePluginOptions = {
    [key: string]: any;
};
export type IAutoDetectOptions = ISize | IResourcePluginOptions;
/**
 * Shape of supported resource plugins
 * @memberof PIXI
 */
export interface IResourcePlugin<R, RO> {
    test(source: unknown): boolean;
    new (source: any, options?: RO): R;
}
/**
 * Collection of installed resource types, class must extend {_link PIXI.Resource}.
 * @example
 * class CustomResource extends PIXI.Resource {
 *     // MUST have source, options constructor signature
 *     // for auto-detected resources to be created.
 *     constructor(source, options) {
 *         super();
 *     }
 *     upload(renderer, baseTexture, glTexture) {
 *         // Upload with GL
 *         return true;
 *     }
 *     // Used to auto-detect resource
 *     static test(source, extension) {
 *         return extension === 'xyz' || source instanceof SomeClass;
 *     }
 * }
 * // Install the new resource type
 * PIXI.INSTALLED.push(CustomResource);
 * @memberof PIXI
 * @type {Array<PIXI.IResourcePlugin>}
 * @static
 * @readonly
 */
export declare const INSTALLED: Array<IResourcePlugin<any, any>>;
/**
 * Create a resource element from a single source element. This
 * auto-detects which type of resource to create. All resources that
 * are auto-detectable must have a static `test` method and a constructor
 * with the arguments `(source, options?)`. Currently, the supported
 * resources for auto-detection include:
 *  - {_link PIXI.ImageResource}
 *  - {_link PIXI.CanvasResource}
 *  - {_link PIXI.VideoResource}
 *  - {_link PIXI.SVGResource}
 *  - {_link PIXI.BufferResource}
 * @static
 * @memberof PIXI
 * @function autoDetectResource
 * @param {string|*} source - Resource source, this can be the URL to the resource,
 *        a typed-array (for BufferResource), HTMLVideoElement, SVG data-uri
 *        or any other resource that can be auto-detected. If not resource is
 *        detected, it's assumed to be an ImageResource.
 * @param {object} [options] - Pass-through options to use for Resource
 * @param {number} [options.width] - Width of BufferResource or SVG rasterization
 * @param {number} [options.height] - Height of BufferResource or SVG rasterization
 * @param {boolean} [options.autoLoad=true] - Image, SVG and Video flag to start loading
 * @param {number} [options.scale=1] - SVG source scale. Overridden by width, height
 * @param {boolean} [options.createBitmap=PIXI.settings.CREATE_IMAGE_BITMAP] - Image option to create Bitmap object
 * @param {boolean} [options.crossorigin=true] - Image and Video option to set crossOrigin
 * @param {boolean} [options.autoPlay=true] - Video option to start playing video immediately
 * @param {number} [options.updateFPS=0] - Video option to update how many times a second the
 *        texture should be updated from the video. Leave at 0 to update at every render
 * @returns {PIXI.Resource} The created resource.
 */
export declare function autoDetectResource<R extends Resource, RO>(source: unknown, options?: RO): R;
