import type { IShape, Matrix, SHAPES } from 'src/core';
import type { FillStyle } from './styles/FillStyle';
import type { LineStyle } from './styles/LineStyle';
/**
 * A class to contain data useful for Graphics objects
 * @memberof PIXI
 */
export declare class GraphicsData {
    /**
     * The shape object to draw.
     * @member {PIXI.Circle|PIXI.Ellipse|PIXI.Polygon|PIXI.Rectangle|PIXI.RoundedRectangle}
     */
    shape: IShape;
    /** The style of the line. */
    lineStyle: LineStyle | null;
    /** The style of the fill. */
    fillStyle: FillStyle | null;
    /** The transform matrix. */
    matrix: Matrix | null;
    /** The type of the shape, see the Const.Shapes file for all the existing types, */
    type: SHAPES;
    /** The collection of points. */
    points: number[];
    /** The collection of holes. */
    holes: Array<GraphicsData>;
    /**
     * @param {PIXI.Circle|PIXI.Ellipse|PIXI.Polygon|PIXI.Rectangle|PIXI.RoundedRectangle} shape - The shape object to draw.
     * @param fillStyle - the width of the line to draw
     * @param lineStyle - the color of the line to draw
     * @param matrix - Transform matrix
     */
    constructor(shape: IShape, fillStyle?: FillStyle | null, lineStyle?: LineStyle | null, matrix?: Matrix | null);
    /**
     * Creates a new GraphicsData object with the same values as this one.
     * @returns - Cloned GraphicsData object
     */
    clone(): GraphicsData;
    /** Destroys the Graphics data. */
    destroy(): void;
}
