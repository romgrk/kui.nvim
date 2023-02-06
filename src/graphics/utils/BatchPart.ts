import type { FillStyle } from '../styles/FillStyle';
import type { LineStyle } from '../styles/LineStyle';

/**
 * A structure to hold interim batch objects for Graphics.
 * @memberof PIXI.graphicsUtils
 */
export class BatchPart
{
    public style: LineStyle | FillStyle | null;
    public start: number;
    public size: number;
    public attribStart: number;
    public attribSize: number;

    constructor()
    {
        this.style = null;
        this.size = 0;
        this.start = 0;
        this.attribStart = 0;
        this.attribSize = 0;
    }

    /**
     * Begin batch part.
     * @param style
     * @param startIndex
     * @param attribStart
     */
    public begin(style: LineStyle | FillStyle, startIndex: number, attribStart: number): void
    {
        this.reset();
        this.style = style;
        this.start = startIndex;
        this.attribStart = attribStart;
    }

    /**
     * End batch part.
     * @param endIndex
     * @param endAttrib
     */
    public end(endIndex: number, endAttrib: number): void
    {
        this.attribSize = endAttrib - this.attribStart;
        this.size = endIndex - this.start;
    }

    public reset(): void
    {
        this.style = null;
        this.size = 0;
        this.start = 0;
        this.attribStart = 0;
        this.attribSize = 0;
    }
}
