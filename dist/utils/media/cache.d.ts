import type { BaseTexture, Texture } from 'src/core';
/**
 * @todo Describe property usage
 * @static
 * @name TextureCache
 * @memberof PIXI.utils
 * @type {object}
 */
export declare const TextureCache: {
    [key: string]: Texture;
};
/**
 * @todo Describe property usage
 * @static
 * @name BaseTextureCache
 * @memberof PIXI.utils
 * @type {object}
 */
export declare const BaseTextureCache: {
    [key: string]: BaseTexture;
};
/**
 * Destroys all texture in the cache
 * @memberof PIXI.utils
 * @function destroyTextureCache
 */
export declare function destroyTextureCache(): void;
/**
 * Removes all textures from cache, but does not destroy them
 * @memberof PIXI.utils
 * @function clearTextureCache
 */
export declare function clearTextureCache(): void;
