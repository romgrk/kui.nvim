import type { CompositeOperation } from 'src/context2d';
/**
 * Maps blend combinations to Canvas.
 * @memberof PIXI
 * @function mapCanvasBlendModesToPixi
 * @private
 * @param {string[]} [array=[]] - The array to output into.
 * @returns {string[]} Mapped modes.
 */
export declare function mapCanvasBlendModesToPixi(array?: CompositeOperation[]): CompositeOperation[];
