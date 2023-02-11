import type { Canvas, ImageData } from 'src/context2d';
/**
 * Trim transparent borders from a canvas.
 * @memberof PIXI.utils
 * @param {PIXI.Canvas} canvas - The canvas to trim.
 * @returns The trimmed canvas data.
 */
export declare function trimCanvas(canvas: Canvas): {
    width: number;
    height: number;
    data: ImageData | null;
};
