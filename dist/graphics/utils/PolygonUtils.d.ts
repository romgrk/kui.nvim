/**
 * Utilities for polygon
 * @class
 * @private
 */
export declare class PolygonUtils {
    /**
     * Calculate points of an offset polygon
     * @see {@link http://csharphelper.com/blog/2016/01/enlarge-a-polygon-in-c/}
     * @private
     * @param {number[]} points - polygon coordinates
     * @param {number} offset
     * @returns {number[]} - offset points
     */
    static offsetPolygon(points: number[], offset: number): number[];
    /**
     * Determine the intersection point of two line segments
     * @see {@link here http://paulbourke.net/geometry/pointlineplane/}
     * @private
     * @param {number} x1 - x-coordinate of start point at first line
     * @param {number} y1 - y-coordinate of start point at first line
     * @param {number} x2 - x-coordinate of end point at first line
     * @param {number} y2 - y-coordinate of end point at first line
     * @param {number} x3 - x-coordinate of start point at second line
     * @param {number} y3 - y-coordinate of start point at second line
     * @param {number} x4 - x-coordinate of end point at second line
     * @param {number} y4 - y-coordinate of end point at second line
     * @returns [x, y] coordinates of intersection
     */
    static findIntersection(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number, x4: number, y4: number): [number, number] | null;
    /**
     * Determine polygon are clockwise or counterclockwise
     * @see {@link https://stackoverflow.com/questions/1165647}
     * @private
     * @param {number[]} polygon - polygon coordinates
     * @returns {boolean} - true if polygon is clockwise
     */
    static isPolygonClockwise(polygon: number[]): boolean;
}
