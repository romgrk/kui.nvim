import * as systems from '../systems'
import type { BackgroundOptions } from '../background/BackgroundSystem';
import type { IRenderer } from '../IRenderer';
import type { ISystem } from '../system/ISystem';
import type { ViewOptions } from '../view/ViewSystem';

// TODO this can be infered by good use of generics in the future..
export interface StartupOptions extends Record<string, unknown>
{
    background: BackgroundOptions,
    _view: ViewOptions,
    context?: any, // ContextOptions
}

/**
 * A simple system responsible for initiating the renderer.
 * @memberof PIXI
 */export class StartupSystem implements ISystem
{
    readonly renderer: IRenderer;

    constructor(renderer: IRenderer)
    {
        this.renderer = renderer;
    }

    /**
     * It all starts here! This initiates every system, passing in the options for any system by name.
     * @param options - the config for the renderer and all its systems
     */
    run(options: StartupOptions): void
    {
        const renderer = this.renderer;

        renderer.emitWithCustomOptions(renderer.runners.init, options);

        renderer.resize(this.renderer.screen.width, this.renderer.screen.height);
    }

    destroy(): void
    {
        // ka pow!
    }
}

systems.register('startup', StartupSystem)
