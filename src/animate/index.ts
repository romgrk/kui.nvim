//- The amount of time between rendering the next part of the animation.
const ANIMATION_FREQUENCY = 30

/** The current time in milliseconds */
export function currentTime(start?: number) {
  let t = vim.loop.hrtime() / 1e6
  if (start !== undefined) {
    t = t - start
  }
  return t
}

export function lerp(ratio: number, initial: number, final: number) {
  return (1 - ratio) * initial + (ratio * final)
}

function tick(animation: Animation) {
  const duration = animation.duration
  const elapsed = currentTime(animation.start)
  const ratio = elapsed / duration
  const fn = animation.fn

  if (ratio < 1) {
    // We're still good here
    const current =
      duration !== Infinity ?
        lerp(ratio, animation.initial, animation.final) :
        elapsed
    fn(current, false, animation)
  }
  else {
    // Went overtime, stop the animation!
    fn(animation.final, true, animation)
    animation.stop()
  }
}

export class Animation {
  fn: Function
  duration: number
  initial: number
  final: number
  start: number
  timer: vim.Timer | null

  constructor(
    fn: Function,
    duration: number,
    initial: number,
    final: number,
  ) {
    this.fn = fn
    this.duration = duration
    this.initial = initial
    this.final = final
    this.start = currentTime()
    this.timer = vim.loop.new_timer()

    this.timer.start(0, ANIMATION_FREQUENCY, vim.schedule_wrap(() => tick(this)))
  }

  stop() {
    if (this.timer !== null) {
      this.timer.stop()
      this.timer.close()
      this.timer = null
    }
  }
}

export function animate(duration: number, initial: number, final: number, callback: (value: number, done: boolean, animation: Animation) => void) {
  return new Animation(callback, duration, initial, final)
}

export function ticker(callback: (value: number, done: boolean, animation: Animation) => void) {
  return new Animation(callback, Infinity, 0, 0)
}

export class Timer {
  fn: Function
  duration: number
  timer: vim.Timer | null

  static wait(duration: number): Promise<void> {
    return new Promise((resolve) => {
      new Timer(duration, resolve)
    })
  }

  constructor(
    duration: number,
    fn: Function,
  ) {
    this.fn = fn
    this.duration = duration
    this.timer = vim.loop.new_timer()

    this.timer.start(duration, 0, vim.schedule_wrap(fn))
  }

  stop() {
    if (this.timer !== null) {
      this.timer.stop()
      this.timer.close()
      this.timer = null
    }
  }
}
