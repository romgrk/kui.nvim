import type { HslaColor, HslColor, HsvaColor, HsvColor, RgbaColor, RgbColor } from 'src/colord/types';
/** Possible value types for Color class */
export type ColorSource = string | number | number[] | Float32Array | Uint8Array | Uint8ClampedArray | HslColor | HslaColor | HsvColor | HsvaColor | RgbColor | RgbaColor | Color;
/**
 * Color utility class
 * @example
 * import { Color } from 'pixi.js';
 * new Color('red').toArray(); // [1, 0, 0, 1]
 * new Color(0xff0000).toArray(); // [1, 0, 0, 1]
 * new Color('ff0000').toArray(); // [1, 0, 0, 1]
 * new Color('#f00').toArray(); // [1, 0, 0, 1]
 * new Color([1, 0, 0, 0.5]).toArray(); // [1, 0, 0, 0.5]
 * new Color([1, 1, 1]).toArray(); // [1, 1, 1, 1]
 * new Color('rgb(255, 0, 0, 0.5)').toArray(); // [1, 0, 0, 0.5]
 * new Color({h: 0, s: 100, l: 50, a: 0.5}).toArray(); // [1, 0, 0, 0.5]
 * new Color({h: 0, s: 100, v: 100, a: 0.5}).toArray(); // [1, 0, 0, 0.5]
 * @memberof PIXI
 */
export declare class Color {
    /**
     * Default Color object for static uses
     * @example
     * import { Color } from 'pixi.js';
     * Color.shared.setValue(0xffffff).toHex(); // '#ffffff'
     */
    static readonly shared: Color;
    /**
     * Temporary Color object for static uses internally.
     * As to not conflict with Color.shared.
     * @ignore
     */
    private static readonly temp;
    /** Internal color source, from constructor or set value */
    private _value;
    /** Normalized rgba component, floats from 0-1 */
    private _components;
    /** Cache color as number */
    private _int;
    /**
     * @param {PIXI.ColorSource} value - Optional value to use, if not provided, white is used.
     */
    constructor(value?: ColorSource);
    /** Get red component (0 - 1) */
    get red(): number;
    /** Get green component (0 - 1) */
    get green(): number;
    /** Get blue component (0 - 1) */
    get blue(): number;
    /** Get alpha component (0 - 1) */
    get alpha(): number;
    /**
     * Set the value, suitable for chaining
     * @param value
     */
    setValue(value: ColorSource): this;
    /**
     * Set the current color source
     * @type {PIXI.ColorSource}
     */
    set value(value: ColorSource);
    get value(): Exclude<ColorSource, Color>;
    /**
     * Convert to a RGBA color object.
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toRgb(); // returns { r: 1, g: 1, b: 1, a: 1 }
     */
    toRgba(): RgbaColor;
    /**
     * Convert to a RGB color object.
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toRgb(); // returns { r: 1, g: 1, b: 1 }
     */
    toRgb(): RgbColor;
    /** Convert to a CSS-style rgba string: `rgba(255,255,255,1.0)`. */
    toRgbaString(): string;
    /**
     * Convert to an [R, G, B] array of clamped uint8 values (0 to 255).
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toUint8RgbArray(); // returns [255, 255, 255]
     * @param {number[]|Uint8Array|Uint8ClampedArray} [out] - Output array
     */
    toUint8RgbArray<T extends (number[] | Uint8Array | Uint8ClampedArray) = number[]>(out?: T): T;
    /**
     * Convert to an [R, G, B] array of normalized floats (numbers from 0.0 to 1.0).
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toRgbArray(); // returns [1, 1, 1]
     * @param {number[]|Float32Array} [out] - Output array
     */
    toRgbArray<T extends (number[] | Float32Array) = number[]>(out?: T): T;
    /**
     * Convert to a hexadecimal number.
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toNumber(); // returns 16777215
     */
    toNumber(): number;
    /**
     * Convert to a hexadecimal number in little endian format (e.g., BBGGRR).
     * @example
     * import { Color } from 'pixi.js';
     * new Color(0xffcc99).toLittleEndianNumber(); // returns 0x99ccff
     * @returns {number} - The color as a number in little endian format.
     */
    toLittleEndianNumber(): number;
    /**
     * Multiply with another color
     * @param {PIXI.ColorSource} value - The color to multiply by.
     */
    multiply(value: ColorSource): this;
    /**
     * Convert to a hexidecimal string.
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toHex(); // returns "#ffffff"
     */
    toHex(): string;
    /**
     * Convert to a hexidecimal string with alpha.
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toHexa(); // returns "#ffffffff"
     */
    toHexa(): string;
    /**
     * Set alpha, suitable for chaining.
     * @param alpha
     */
    setAlpha(alpha: number): this;
    /**
     * Rounds the specified color according to the step.
     * @param step - Number of steps which will be used as a cap when rounding colors
     */
    round(step: number): this;
    /**
     * Convert to an [R, G, B, A] array of normalized floats (numbers from 0.0 to 1.0).
     * @example
     * import { Color } from 'pixi.js';
     * new Color('white').toArray(); // returns [1, 1, 1, 1]
     * @param {number[]|Float32Array} [out] - Output array
     */
    toArray<T extends (number[] | Float32Array) = number[]>(out?: T): T;
    /**
     * Normalize the input value into rgba
     * @param value - Input value
     */
    private normalize;
}
