import { Color } from 'src/color';
import type { ColorSource } from 'src/color';
import type { ISystem } from '../system/ISystem';
export interface BackgroundOptions {
    /** the main canvas background alpha. From 0 (fully transparent) to 1 (fully opaque). */
    alpha: number;
    /** the main canvas background color. */
    color: ColorSource;
    /** sets if the renderer will clear the canvas or not before the new render pass. */
    clearBeforeRender: boolean;
}
/**
 * The background system manages the background color and alpha of the main view.
 * @memberof PIXI
 */
export declare class BackgroundSystem implements ISystem<BackgroundOptions> {
    /**
     * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
     * If the scene is NOT transparent PixiJS will use a canvas sized fillRect operation every
     * frame to set the canvas background color. If the scene is transparent PixiJS will use clearRect
     * to clear the canvas every frame. Disable this by setting this to false. For example, if
     * your game has a canvas filling background image you often don't need this set.
     * @member {boolean}
     * @default
     */
    clearBeforeRender: boolean;
    /** Reference to the internal color */
    private _backgroundColor;
    constructor();
    /**
     * initiates the background system
     * @param {BackgroundOptions} options - the options for the background colors
     */
    init(options: BackgroundOptions): void;
    /**
     * The background color to fill if not transparent.
     * @member {PIXI.ColorSource}
     */
    get color(): ColorSource;
    set color(value: ColorSource);
    /**
     * The background color alpha. Setting this to 0 will make the canvas transparent.
     * @member {number}
     */
    get alpha(): number;
    set alpha(value: number);
    /** The background color object. */
    get backgroundColor(): Color;
    destroy(): void;
}
