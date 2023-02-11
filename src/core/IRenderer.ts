import type { ColorSource } from 'src/color';
import type { RENDERER_TYPE } from 'src/constants';
import type { DisplayObject } from 'src/display';
import type { Matrix, Rectangle, Transform } from 'src/math';
// import type { IGenerateTextureOptions } from './renderTexture/GenerateTextureSystem';
// import type { RenderTexture } from './renderTexture/RenderTexture';
import type { SystemManager } from './system/SystemManager';
import type { ICanvas } from './ICanvas';

/**
 * Interface for DisplayObject to interface with Renderer.
 * The minimum APIs needed to implement a renderable object.
 * @memberof PIXI
 */
export type IRenderableObject = DisplayObject
// export interface IRenderableObject
// {
//     /** Object must have a parent container */
//     parent: IRenderableContainer;
//     /** Object must have a transform */
//     transform: Transform;
//     /** Before method for transform updates */
//     enableTempParent(): IRenderableContainer;
//     /** Update the transforms */
//     updateTransform(): void;
//     /** After method for transform updates */
//     disableTempParent(parent: IRenderableContainer): void;
//     /** Render object directly */
//     render(renderer: IRenderer<any>): void;
//     /** Render object directly */
//     renderCanvas(renderer: IRenderer<any>): void;
// }

/**
 * Interface for Container to interface with Renderer.
 * @memberof PIXI
 */
export interface IRenderableContainer extends IRenderableObject
{
    /** Get Local bounds for container */
    getLocalBounds(rect?: Rectangle, skipChildrenUpdate?: boolean): Rectangle;
}

/**
 * Renderer options supplied to constructor.
 * @memberof PIXI
 * @see PIXI.settings.RENDER_OPTIONS
 */
export interface IRendererOptions
{
    /** The canvas to use as the view. If omitted, a new canvas will be created. */
    view?: any;

    /** The buffer number of the renderer's view. */
    buffer?: number;

    /** The x of the renderer's view. */
    col: number;
    /** The y of the renderer's view. */
    row: number;
    /** The width of the renderer's view. */
    width: number;
    /** The height of the renderer's view. */
    height: number;

    /**
     * The background color used to clear the canvas. It accepts hex numbers (e.g. `0xff0000`),
     * hex strings (e.g. `'#f00'` or `'#ff0000'`) or color names (e.g. `'red'`).
     * @default 0x000000
     */
    backgroundColor?: ColorSource;
    /** Alias for `backgroundColor`. */
    background?: ColorSource;
    /**
     * Transparency of the background color, value from `0` (fully transparent) to `1` (fully opaque).
     * @default 1
     */
    backgroundAlpha?: number;
    /**
     * Whether to clear the canvas before new render passes.
     * @default true
     */
    clearBeforeRender?: boolean;
}

export interface IRendererRenderOptions
{
    // renderTexture?: RenderTexture;
    blit?: boolean
    clear?: boolean;
    transform?: Matrix;
    skipUpdateTransform?: boolean;
}

/**
 * Starard Interface for a Pixi renderer.
 * @memberof PIXI
 */
export interface IRenderer<VIEW extends ICanvas = ICanvas> extends SystemManager
{
    resize(width: number, height: number): void;
    render(displayObject: IRenderableObject, options?: IRendererRenderOptions): void;
    // generateTexture(displayObject: IRenderableObject, options?: IGenerateTextureOptions): RenderTexture;
    destroy(removeView?: boolean): void;
    clear(): void;
    reset(): void;

    /**
     * The type of the renderer.
     * @see PIXI.RENDERER_TYPE
     */
    readonly type: RENDERER_TYPE

    /**
     * The options passed in to create a new instance of the renderer.
     * @type {PIXI.IRendererOptions}
     */
    readonly options: IRendererOptions

    /** When logging Pixi to the console, this is the name we will show */
    readonly rendererLogId: string

    /** The canvas element that everything is drawn to.*/
    readonly view: VIEW
    /** Flag if we are rendering to the screen vs renderTexture */
    readonly renderingToScreen: boolean
    /** the width of the screen */
    readonly width: number
    /** the height of the screen */
    readonly height: number
    /**
     * Measurements of the screen. (0, 0, screenWidth, screenHeight).
     * Its safe to use as filterArea or hitArea for the whole stage.
     */
    readonly screen: Rectangle
    /** the last object rendered by the renderer. Useful for other plugins like interaction managers */
    readonly lastObjectRendered: IRenderableObject
}
