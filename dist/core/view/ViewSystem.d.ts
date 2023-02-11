import { Rectangle } from 'src/math';
import type { ICanvas } from 'src/core';
import type { Renderer } from '../Renderer';
import type { ISystem } from '../system/ISystem';
/**
 * Options passed to the ViewSystem
 * @memberof PIXI
 */
export interface ViewOptions {
    /** The buffer number to which we are attached */
    buffer?: number;
    /** The x position of the screen. */
    col: number;
    /** The y position of the screen. */
    row: number;
    /** The width of the screen. */
    width: number;
    /** The height of the screen. */
    height: number;
    /** The canvas to use as a view, optional. */
    view?: ICanvas;
    /** Resizes renderer view in CSS pixels to allow for resolutions other than 1. */
    autoDensity?: boolean;
    /** The resolution / device pixel ratio of the renderer. */
    resolution?: number;
}
/**
 * The view system manages the main canvas that is attached to the DOM.
 * This main role is to deal with how the holding the view reference and dealing with how it is resized.
 * @memberof PIXI
 */
export declare class ViewSystem implements ISystem<ViewOptions, boolean> {
    private renderer;
    private _options;
    private _image;
    private _isTransmitting;
    /**
     * Measurements of the screen. (0, 0, screenWidth, screenHeight).
     *
     * Its safe to use as filterArea or hitArea for the whole stage.
     * @member {PIXI.Rectangle}
     */
    screen: Rectangle;
    /**
     * The canvas element that everything is drawn to.
     * @member {PIXI.ICanvas}
     */
    element: ICanvas;
    constructor(renderer: Renderer);
    /**
     * initiates the view system
     * @param {PIXI.ViewOptions} options - the options for the view
     */
    init(options: ViewOptions): void;
    /** After rendering, transmit the image to the terminal */
    onPostRender: () => void;
    /**
     * Resizes the screen and canvas to the specified dimensions.
     * @param desiredScreenWidth - The new width of the screen.
     * @param desiredScreenHeight - The new height of the screen.
     */
    resizeView(desiredScreenWidth: number, desiredScreenHeight: number): void;
    /**
     * Destroys this System and optionally removes the canvas from the dom.
     * @param {boolean} [removeView=false] - Whether to remove the canvas from the DOM.
     */
    destroy(removeView: boolean): void;
}
