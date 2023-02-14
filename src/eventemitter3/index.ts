/* see ./LICENSE */

export interface ListenerFn<Args extends any[] = any[]> {
  (...args: Args): void;
}

export interface EventEmitterStatic {
  new <
    EventTypes extends ValidEventTypes = string | symbol,
    Context = any
  >(): EventEmitter<EventTypes, Context>;
}

/**
  * `object` should be in either of the following forms:
  * ```
  * interface EventTypes {
  *   'event-with-parameters': any[]
  *   'event-with-example-handler': (...args: any[]) => void
  * }
  * ```
  */
export type ValidEventTypes = string | symbol | object;

export type EventNames<T extends ValidEventTypes> = T extends string | symbol
  ? T
  : keyof T;

export type ArgumentMap<T extends object> = {
  [K in keyof T]: T[K] extends (...args: any[]) => void
    ? Parameters<T[K]>
    : T[K] extends any[]
    ? T[K]
    : any[];
};

export type EventListener<
  T extends ValidEventTypes,
  K extends EventNames<T>
> = T extends string | symbol
  ? (...args: any[]) => void
  : (
      ...args: ArgumentMap<Exclude<T, string | symbol>>[Extract<K, keyof T>]
    ) => void;

export type EventArgs<
  T extends ValidEventTypes,
  K extends EventNames<T>
> = Parameters<EventListener<T, K>>;


/** Representation of a single event listener. */
class EE {
  fn: Function
  context: any
  once: boolean

  constructor(fn: Function, context: any, once?: boolean) {
    this.fn = fn;
    this.context = context;
    this.once = once || false;
  }
}

/**
 * Add a listener for a given event.
 */
function addListener(emitter: EventEmitter, event: string | symbol, fn: Function, context: any, once?: boolean) {
  if (typeof fn !== 'function') {
    throw new TypeError('The listener must be a function');
  }

  const listener = new EE(fn, context || emitter, once)

  if (!emitter._events[event]) {
    emitter._events[event] = [listener]
    emitter._eventsCount++;
  } else {
    emitter._events[event].push(listener);
  }

  return emitter;
}

/**
 * Clear event by name.
 */
function clearEvent(emitter: EventEmitter, event: string | symbol) {
  if (--emitter._eventsCount === 0) emitter._events = {};
  else delete emitter._events[event];
}


/**
 * Minimal `EventEmitter` interface that is molded against the Node.js
 * `EventEmitter` interface.
 *
 * @constructor
 * @public
 */
export class EventEmitter<
  EventTypes extends ValidEventTypes = string | symbol,
  Context extends any = any
> {
  _events: Record<EventNames<EventTypes>, EE[]>
  _eventsCount: number

  constructor() {
    this._events = {} as any
    this._eventsCount = 0;
  }

  /**
  * Return an array listing the events for which the emitter has registered
  * listeners.
  */
  eventNames(): Array<EventNames<EventTypes>> {
    if (this._eventsCount === 0)
      return []
    return Object.keys(this._events) as any
  }

  /**
  * Return the listeners registered for a given event.
  */
 listeners<T extends EventNames<EventTypes>>(
    event: T
  ): Array<EventListener<EventTypes, T>> {
    const handlers = this._events[event];

    if (!handlers) return [];

    let i = 0
    let l = handlers.length
    let ee = new Array(l)

    for (; i < l; i++) {
      ee[i] = handlers[i].fn;
    }

    return ee;
  }

  /**
  * Return the number of listeners listening to a given event.
  */
  listenerCount(event: EventNames<EventTypes>): number {
    const listeners = this._events[event];
    if (!listeners) return 0;
    return listeners.length;
  };

  /**
  * Calls each of the listeners registered for a given event.
  */
  emit<T extends EventNames<EventTypes>>(
    event: T,
    ...args: EventArgs<EventTypes, T>
  ): boolean {
    if (!this._events[event]) return false;

    const listeners = this._events[event] as EE[];

    for (let i = 0; i < listeners.length; i++) {
      if (listeners[i].once)
        this.removeListener(event, listeners[i].fn as any, undefined, true);

      listeners[i].fn.call(listeners[i].context, ...args)
    }

    return true;
  }

  /**
   * Add a listener for a given event.
   */
  on<T extends EventNames<EventTypes>>(
    event: T,
    fn: EventListener<EventTypes, T>,
    context?: Context
  ): this {
    return addListener(this as any, event, fn, context, false) as any;
  }

  /**
   * Add a one-time listener for a given event.
   */
  once<T extends EventNames<EventTypes>>(
    event: T,
    fn: EventListener<EventTypes, T>,
    context?: Context
  ): this {
    return addListener(this as any, event, fn, context, true) as any;
  }

  /**
   * Remove the listeners of a given event.
   */
  removeListener<T extends EventNames<EventTypes>>(
    event: T,
    fn?: EventListener<EventTypes, T>,
    context?: Context,
    once?: boolean
  ): this {
    if (!this._events[event]) return this;
    if (!fn) {
      clearEvent(this as any, event);
      return this;
    }

    const listeners = this._events[event];

    let i = 0
    const events = []
    const length = listeners.length ?? 0
    for (; i < length; i++) {
      if (
        listeners[i].fn !== fn ||
        (once && !listeners[i].once) ||
        (context && listeners[i].context !== context)
      ) {
        events.push(listeners[i]);
      }
    }

    // Reset the array, or remove it completely if we have no more listeners.
    if (events.length === 0)
      clearEvent(this as any, event)

    return this;
  };

  /**
  * Remove all listeners, or those of the specified event.
  */
  removeAllListeners(event?: EventNames<EventTypes>): this {
    if (event) {
      if (this._events[event])
        clearEvent(this as any, event);
    } else {
      this._events = {} as any;
      this._eventsCount = 0;
    }
    return this;
  }

  off = this.removeListener
  addListener = this.on
}

//
// Alias methods names because people roll like that.
//
EventEmitter.prototype.off = EventEmitter.prototype.removeListener;
EventEmitter.prototype.addListener = EventEmitter.prototype.on;

//
// Allow `EventEmitter` to be imported as module namespace.
//
(EventEmitter as any).EventEmitter = EventEmitter;

//
// Expose the module.
//
export default EventEmitter
