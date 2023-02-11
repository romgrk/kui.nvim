import { Colord } from "./colord";
import { Parsers } from "./types";
export type Plugin = (ColordClass: typeof Colord, parsers: Parsers) => void;
export declare const extend: (plugins: Plugin[]) => void;
