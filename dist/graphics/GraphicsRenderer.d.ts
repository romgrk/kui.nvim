import type { CanvasRenderer } from 'src/canvas-renderer';
import type { Graphics } from 'src/graphics';
import type { ISystem } from 'src/core';
/**
 * Renderer dedicated to drawing and batching graphics objects.
 * @class
 * @protected
 * @memberof PIXI
 */
export declare class CanvasGraphicsRenderer implements ISystem {
    static systemName: string;
    /** A reference to the current renderer */
    renderer: CanvasRenderer;
    private _tempMatrix;
    /**
     * @param renderer - A reference to the current renderer.
     */
    constructor(renderer: CanvasRenderer);
    /**
     * calculates fill/stroke style for canvas
     * @private
     * @param style - A graphics {@link PIXI.FILL_STYLE} where if `texture` is specified then a tinted CanvasPattern
     * will be used for the fill.stroke
     * @param tint - color to set the fill/stroke too.
     */
    private _calcCanvasStyle;
    /**
     * Renders a Graphics object to a canvas.
     * @param graphics - the actual graphics object to render
     */
    render(graphics: Graphics): void;
    /**
     * Paint stroke for polygon and holes
     * @private
     * @param shape - Shape to be drawn
     * @param lineStyle - Line style for the shape
     * @param contextStrokeStyle - The strokeStyle for the canvas context
     * @param holes - Holes to be added to the shape
     * @param holesDirection -
     * @param worldAlpha - The multiplied alpha of the displayObject
     * @param context - The canvas context
     */
    private paintPolygonStroke;
    /**
     * Paint Ellipse
     * @private
     * @param shape - Shape to be drawn
     * @param fillStyle - Fill for the shape
     * @param lineStyle - Line style for the shape
     * @param contextFillStyle - The canvas context fill style
     * @param worldAlpha - The multiplied alpha of the displayObject
     * @param context - The canvas context
     */
    private paintEllipse;
    /**
     * Paint Rounded Rectangle
     * @private
     * @param shape - Shape to be drawn
     * @param fillStyle - Fill for the shape
     * @param lineStyle - Line style for the shape
     * @param contextFillStyle - The canvas context fill style
     * @param worldAlpha - The multiplied alpha of the displayObject
     * @param context - The canvas context
     */
    private paintRoundedRectangle;
    /** destroy graphics object */
    destroy(): void;
}
