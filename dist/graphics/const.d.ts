/**
 * Supported line joints in `PIXI.LineStyle` for graphics.
 * @see PIXI.Graphics#lineStyle
 * @see https://graphicdesign.stackexchange.com/questions/59018/what-is-a-bevel-join-of-two-lines-exactly-illustrator
 * @name LINE_JOIN
 * @memberof PIXI
 * @static
 * @enum {string}
 * @property {string} MITER - 'miter': make a sharp corner where outer part of lines meet
 * @property {string} BEVEL - 'bevel': add a square butt at each end of line segment and fill the triangle at turn
 * @property {string} ROUND - 'round': add an arc at the joint
 */
export declare enum LINE_JOIN {
    MITER = "miter",
    BEVEL = "bevel",
    ROUND = "round"
}
/**
 * Support line caps in `PIXI.LineStyle` for graphics.
 * @see PIXI.Graphics#lineStyle
 * @name LINE_CAP
 * @memberof PIXI
 * @static
 * @enum {string}
 * @property {string} BUTT - 'butt': don't add any cap at line ends (leaves orthogonal edges)
 * @property {string} ROUND - 'round': add semicircle at ends
 * @property {string} SQUARE - 'square': add square at end (like `BUTT` except more length at end)
 */
export declare enum LINE_CAP {
    BUTT = "butt",
    ROUND = "round",
    SQUARE = "square"
}
/** @deprecated */
export interface IGraphicsCurvesSettings {
    adaptive: boolean;
    maxLength: number;
    minSegments: number;
    maxSegments: number;
    epsilon: number;
    _segmentsCount(length: number, defaultSegments?: number): number;
}
/**
 * @private
 */
export declare const curves: {
    adaptive: boolean;
    maxLength: number;
    minSegments: number;
    maxSegments: number;
    epsilon: number;
    _segmentsCount(length: number, defaultSegments?: number): number;
};
/**
 * @static
 * @readonly
 * @memberof PIXI
 * @name GRAPHICS_CURVES
 * @type {object}
 * @deprecated since 7.1.0
 * @see PIXI.Graphics.curves
 */
export declare const GRAPHICS_CURVES: {
    adaptive: boolean;
    maxLength: number;
    minSegments: number;
    maxSegments: number;
    epsilon: number;
    _segmentsCount(length: number, defaultSegments?: number): number;
};
