import type { Timer } from 'types/vim/loop';
/** The current time in milliseconds */
export declare function currentTime(start?: number): number;
export declare function lerp(ratio: number, initial: number, final: number): number;
export declare class Animation {
    fn: Function;
    duration: number;
    initial: number;
    final: number;
    start: number;
    timer: Timer | null;
    constructor(fn: Function, duration: number, initial: number, final: number);
    stop(): void;
}
export declare function animate(duration: number, initial: number, final: number, callback: (value: number, done: boolean, animation: Animation) => void): Animation;
export declare function ticker(callback: (value: number, done: boolean, animation: Animation) => void): Animation;
