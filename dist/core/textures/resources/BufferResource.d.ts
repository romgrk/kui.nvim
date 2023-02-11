import { Resource } from './Resource';
import type { ISize } from 'src/math';
/**
 * @interface SharedArrayBuffer
 */
/**
 * Buffer resource with data of typed array.
 * @memberof PIXI
 */
export declare class BufferResource extends Resource {
    /** Source array Cannot be {@code ClampedUint8Array} because it cant be uploaded to WebGL */
    data: Float32Array | Uint8Array | Uint16Array | Int32Array | Uint32Array;
    /**
     * @param source - Source buffer
     * @param options - Options
     * @param {number} options.width - Width of the texture
     * @param {number} options.height - Height of the texture
     */
    constructor(source: Float32Array | Uint8Array | Uint16Array | Int32Array | Uint32Array, options: ISize);
    /** Destroy and don't use after this. */
    dispose(): void;
    /**
     * Used to auto-detect the type of resource.
     * @param {*} source - The source object
     * @returns {boolean} `true` if <canvas>
     */
    static test(source: unknown): source is Float32Array | Uint8Array | Uint32Array;
}
