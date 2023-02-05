import { RgbaColor } from "../types";
import { roundRgba, clampRgba } from "./rgb";

/**
 * Parses a valid RGB[A] CSS color function/string
 * https://www.w3.org/TR/css-color-4/#rgb-functions
 */
export const parseRgbaString = (input: string): RgbaColor | null => {
  const parts =
    input.trim()
      .replace('rgba(', '')
      .replace('rgb(', '')
      .replace(')', '')
      .split(',')
      .map(p => p.trim())

  return clampRgba({
    r: Number(parts[1]),
    g: Number(parts[2]),
    b: Number(parts[3]),
    a: parts[4] === undefined ? 1 : Number(parts[4]),
  });
};

export const rgbaToRgbaString = (rgba: RgbaColor): string => {
  const { r, g, b, a } = roundRgba(rgba);
  return a < 1 ? `rgba(${r}, ${g}, ${b}, ${a})` : `rgb(${r}, ${g}, ${b})`;
};
