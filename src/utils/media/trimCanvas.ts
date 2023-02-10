import { getCanvasBoundingBox } from './getCanvasBoundingBox';

import type { Canvas, ImageData } from 'src/context2d';

/**
 * Trim transparent borders from a canvas.
 * @memberof PIXI.utils
 * @param {PIXI.Canvas} canvas - The canvas to trim.
 * @returns The trimmed canvas data.
 */
export function trimCanvas(canvas: Canvas): { width: number, height: number, data: ImageData | null }
{
    const boundingBox = getCanvasBoundingBox(canvas);
    const { width, height } = boundingBox;
    let data: ImageData | null = null;

    if (!boundingBox.isEmpty())
    {
        const context = canvas.getContext('2d');

        if (context === null)
        {
            throw new TypeError('Failed to get canvas 2D context');
        }

        data = context.getImageData(
            boundingBox.left,
            boundingBox.top,
            width,
            height
        );
    }

    return { width, height, data };
}
