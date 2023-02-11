import type { BackgroundOptions } from '../background/BackgroundSystem';
import type { IRenderer } from '../IRenderer';
import type { ISystem } from '../system/ISystem';
import type { ViewOptions } from '../view/ViewSystem';
export interface StartupOptions extends Record<string, unknown> {
    background: BackgroundOptions;
    _view: ViewOptions;
    context?: any;
}
/**
 * A simple system responsible for initiating the renderer.
 * @memberof PIXI
 */ export declare class StartupSystem implements ISystem {
    readonly renderer: IRenderer;
    constructor(renderer: IRenderer);
    /**
     * It all starts here! This initiates every system, passing in the options for any system by name.
     * @param options - the config for the renderer and all its systems
     */
    run(options: StartupOptions): void;
    destroy(): void;
}
