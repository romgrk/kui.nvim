/**
 * Two Pi.
 * @static
 * @member {number}
 * @memberof PIXI
 */
export declare const TAU: number;
export declare const PI_2: number;
/**
 * Conversion factor for converting radians to degrees.
 * @static
 * @member {number} RAD_TO_DEG
 * @memberof PIXI
 */
export declare const RAD_TO_DEG: number;
/**
 * Conversion factor for converting degrees to radians.
 * @static
 * @member {number}
 * @memberof PIXI
 */
export declare const DEG_TO_RAD: number;
/**
 * Constants that identify shapes, mainly to prevent `instanceof` calls.
 * @static
 * @memberof PIXI
 * @enum {number}
 * @property {number} POLY Polygon
 * @property {number} RECT Rectangle
 * @property {number} CIRC Circle
 * @property {number} ELIP Ellipse
 * @property {number} RREC Rounded Rectangle
 */
export declare enum SHAPES {
    POLY = 0,
    RECT = 1,
    CIRC = 2,
    ELIP = 3,
    RREC = 4
}
