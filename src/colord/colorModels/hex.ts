import { RgbaColor } from "../types";
import { round } from "../helpers";
import { roundRgba } from "./rgb";

/** Parses any valid Hex3, Hex4, Hex6 or Hex8 string and converts it to an RGBA object */
export const parseHex = (input: string): RgbaColor | null => {
  const digits = input.slice(1);

  if (digits.length <= 4) {
    return {
      r: parseInt(digits[0] + digits[0], 16),
      g: parseInt(digits[1] + digits[1], 16),
      b: parseInt(digits[2] + digits[2], 16),
      a: digits.length === 4 ? round(parseInt(digits[3] + digits[3], 16) / 255, 2) : 1,
    };
  }

  if (digits.length === 6 || digits.length === 8) {
    return {
      r: parseInt(digits.slice(0, 2), 16),
      g: parseInt(digits.slice(2, 4), 16),
      b: parseInt(digits.slice(4, 6), 16),
      a: digits.length === 8 ? round(parseInt(digits.slice(6, 8), 16) / 255, 2) : 1,
    };
  }

  return null;
};

/** Formats any decimal number (e.g. 128) as a hexadecimal string (e.g. "08") */
const format = (number: number): string => {
  const digits = number.toString(16);
  return digits.length < 2 ? "0" + digits : digits;
};

/** Converts RGBA object to Hex6 or (if it has alpha channel) Hex8 string */
export const rgbaToHex = (rgba: RgbaColor): string => {
  const { r, g, b, a } = roundRgba(rgba);
  const alphaHex = a < 1 ? format(round(a * 255)) : "";
  return "#" + format(r) + format(g) + format(b) + alphaHex;
};
