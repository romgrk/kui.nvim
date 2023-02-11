
export class Timer {
  start(delay: number, repeat: number, fn: Function): void;
  stop(): void;
  close(): void;
}

export interface Loop {
  /** High-resolution timer, in nano-seconds */
  hrtime(): number;

  new_timer(): Timer;
}
