/// <reference types="./types/cairo" />
import * as cairo from 'kui.cairo.cairo';
import { ColorSource } from 'src/color';
import { LineCap, LineJoin } from 'kui.cairo.cairo';
export { LineCap, LineJoin } from 'kui.cairo.cairo';
export type DOMMatrix = {
    a: number;
    b: number;
    c: number;
    d: number;
    e: number;
    f: number;
};
export type CompositeOperation = 'source-over' | 'source-in' | 'source-out' | 'source-atop' | 'destination-over' | 'destination-in' | 'destination-out' | 'destination-atop' | 'xor' | 'color' | 'color-burn' | 'color-dodge' | 'darken' | 'difference' | 'exclusion' | 'hard-light' | 'hue' | 'lighten' | 'lighter' | 'luminosity' | 'multiply' | 'overlay' | 'saturation' | 'screen' | 'soft-light';
type TextMetrics = {
    width: number;
    height: number;
};
export declare class Context2D {
    surface: cairo.Surface;
    context: cairo.Context;
    private _width;
    private _height;
    private _globalCompositeOperation;
    private _globalAlpha;
    private _fillColor;
    private _strokeColor;
    private _font;
    constructor(width: number, height: number);
    get width(): number;
    set width(width: number);
    get height(): number;
    set height(height: number);
    setDimensions(width: number, height: number): void;
    get globalCompositeOperation(): CompositeOperation;
    set globalCompositeOperation(value: CompositeOperation);
    get globalAlpha(): number;
    set globalAlpha(value: number);
    get fillStyle(): string;
    set fillStyle(color: ColorSource);
    private _fill;
    get strokeStyle(): ColorSource;
    set strokeStyle(color: ColorSource);
    private _stroke;
    get font(): string;
    set font(value: string);
    get lineCap(): LineCap;
    set lineCap(value: LineCap);
    get lineJoin(): LineJoin;
    set lineJoin(value: LineJoin);
    get lineWidth(): number;
    set lineWidth(value: number);
    get miterLimit(): number;
    set miterLimit(value: number);
    get letterSpacing(): string;
    set letterSpacing(value: string);
    arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void;
    beginPath(): void;
    bezierCurveTo(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number): void;
    clip(): void;
    closePath(): void;
    drawImage(image: Canvas, sx: number, sy: number, sWidth: number, sHeight: number, dx: number, dy: number, dWidth: number, dHeight: number): void;
    ellipse(x: number, y: number, radiusX: number, radiusY: number, rotation: number, startAngle: number, endAngle: number, counterclockwise?: boolean): void;
    fill(): void;
    fillText(text: string, x: number, y: number): void;
    getImageData(x: number, y: number, width: number, height: number): ImageData;
    putImageData(image: ImageData, dx: number, dy: number): void;
    lineTo(x: number, y: number): void;
    measureText(text: string): TextMetrics;
    moveTo(x: number, y: number): void;
    quadraticCurveTo(x1: number, y1: number, x2: number, y2: number): void;
    roundRect(x: number, y: number, width: number, height: number, radius: number): void;
    stroke(): void;
    strokeText(text: string, x: number, y: number): void;
    save(): void;
    restore(): void;
    rect(x: number, y: number, width: number, height: number): void;
    clearRect(x: number, y: number, width: number, height: number): void;
    fillRect(x: number, y: number, width: number, height: number): void;
    strokeRect(x: number, y: number, width: number, height: number): void;
    scale(x: number, y: number): void;
    translate(x: number, y: number): void;
    rotate(rads: number): void;
    transform(a: number, b: number, c: number, d: number, e: number, f: number): void;
    setTransform(a: number, b: number, c: number, d: number, e: number, f: number): void;
    getTransform(): DOMMatrix;
    getFontExtents(): cairo.FontExtents;
}
export declare class Canvas {
    context: Context2D;
    constructor(width: number, height: number);
    get width(): number;
    set width(value: number);
    get height(): number;
    set height(value: number);
    /** Non-standard method to resize in one step */
    setDimensions(width: number, height: number): void;
    getContext(_name: '2d'): Context2D;
}
export declare class ImageData {
    readonly width: number;
    readonly height: number;
    data: number[];
    private _refs?;
    constructor(width: number, height: number, data: number[], refs?: any[]);
}
export declare function setDefaultFontName(n: string): void;
