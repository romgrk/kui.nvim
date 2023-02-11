import { BoundingBox } from './BoundingBox';
import type { Canvas } from 'src/context2d';
/**
 * Measuring the bounds of a canvas' visible (non-transparent) pixels.
 * @memberof PIXI.utils
 * @param {PIXI.Canvas} canvas - The canvas to measure.
 * @returns {PIXI.utils.BoundingBox} The bounding box of the canvas' visible pixels.
 * @since 7.1.0
 */
export declare function getCanvasBoundingBox(canvas: Canvas): BoundingBox;
