/**
 * A Runner is a highly performant and simple alternative to signals. Best used in situations
 * where events are dispatched to many objects at high frequency (say every frame!)
 *
 * Like a signal:
 *
 * ```js
 * import { Runner } from '@pixi/runner';
 *
 * const myObject = {
 *     loaded: new Runner('loaded'),
 * };
 *
 * const listener = {
 *     loaded: function() {
 *         // Do something when loaded
 *     }
 * };
 *
 * myObject.loaded.add(listener);
 *
 * myObject.loaded.emit();
 * ```
 *
 * Or for handling calling the same function on many items:
 *
 * ```js
 * import { Runner } from '@pixi/runner';
 *
 * const myGame = {
 *     update: new Runner('update'),
 * };
 *
 * const gameObject = {
 *     update: function(time) {
 *         // Update my gamey state
 *     },
 * };
 *
 * myGame.update.add(gameObject);
 *
 * myGame.update.emit(time);
 * ```
 * @memberof PIXI
 */
export declare class Runner {
    items: any[];
    private _name;
    private _aliasCount;
    /**
     * @param name - The function name that will be executed on the listeners added to this Runner.
     */
    constructor(name: string);
    /**
     * Dispatch/Broadcast Runner to all listeners added to the queue.
     * @param {...any} params - (optional) parameters to pass to each listener
     */
    emit(...args: any[]): this;
    private ensureNonAliasedItems;
    /**
     * Add a listener to the Runner
     *
     * Runners do not need to have scope or functions passed to them.
     * All that is required is to pass the listening object and ensure that it has contains a function that has the same name
     * as the name provided to the Runner when it was created.
     *
     * E.g. A listener passed to this Runner will require a 'complete' function.
     *
     * ```js
     * import { Runner } from '@pixi/runner';
     *
     * const complete = new Runner('complete');
     * ```
     *
     * The scope used will be the object itself.
     * @param {any} item - The object that will be listening.
     */
    add(item: unknown): this;
    /**
     * Remove a single listener from the dispatch queue.
     * @param {any} item - The listener that you would like to remove.
     */
    remove(item: unknown): this;
    /**
     * Check to see if the listener is already in the Runner
     * @param {any} item - The listener that you would like to check.
     */
    contains(item: unknown): boolean;
    /** Remove all listeners from the Runner */
    removeAll(): this;
    /** Remove all references, don't use after this. */
    destroy(): void;
    /**
     * `true` if there are no this Runner contains no listeners
     * @readonly
     */
    get empty(): boolean;
    /**
     * The name of the runner.
     * @readonly
     */
    get name(): string;
    /**
     * Alias for `emit`
     * @memberof PIXI.Runner#
     * @method dispatch
     * @see PIXI.Runner#emit
     */
    dispatch: (...args: any[]) => this;
    /**
     * Alias for `emit`
     * @memberof PIXI.Runner#
     * @method run
     * @see PIXI.Runner#emit
     */
    run: (...args: any[]) => this;
}
