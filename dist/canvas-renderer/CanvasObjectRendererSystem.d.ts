import type { IRenderableObject, IRendererRenderOptions, ISystem } from 'src/core';
import type { CanvasRenderer } from './CanvasRenderer';
/**
 * system that provides a render function that focussing on rendering Pixi Scene Graph objects
 * to either the main view or to a renderTexture. Used for Canvas `2d` contexts
 * @memberof PIXI
 */
export declare class CanvasObjectRendererSystem implements ISystem {
    /** A reference to the current renderer */
    private renderer;
    renderingToScreen: boolean;
    lastObjectRendered: IRenderableObject;
    /** @param renderer - A reference to the current renderer */
    constructor(renderer: CanvasRenderer);
    /**
     * Renders the object to its Canvas view.
     * @param displayObject - The object to be rendered.
     * @param options - the options to be passed to the renderer
     */
    render(displayObject: IRenderableObject, options?: IRendererRenderOptions): void;
    destroy(): void;
}
