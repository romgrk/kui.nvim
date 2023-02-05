import * as systems from 'src/core/systems'
import { Matrix } from 'src/math';
import { BLEND_MODES } from 'src/constants';
import { mapCanvasBlendModesToPixi } from './utils/mapCanvasBlendModesToPixi';
import { Context2D } from 'src/context2d'

import type { ISystem } from 'src/core';
import type { CanvasRenderer } from './CanvasRenderer';

/**
 * Rendering context for all browsers. This includes platform-specific
 * properties that are not included in the spec for CanvasRenderingContext2D
 * @private
 */
export type CanvasRenderingContext2D = Context2D

/**
 * System that manages the canvas `2d` contexts
 * @memberof PIXI
 */
export class CanvasContextSystem implements ISystem
{
    /** A reference to the current renderer */
    private renderer: CanvasRenderer;

    /** The root canvas 2d context that everything is drawn with. */
    public rootContext: CanvasRenderingContext2D;
    /** The currently active canvas 2d context (could change with renderTextures) */
    public activeContext: CanvasRenderingContext2D;
    public activeResolution = 1;

    /** Tracks the blend modes useful for this renderer. */
    public readonly blendModes: string[] = mapCanvasBlendModesToPixi();

    /** Projection transform, passed in render() stored here */
    _projTransform: Matrix | null = null;

    /** @private */
    _outerBlend = false;

    /** @private */
    _activeBlendMode = BLEND_MODES.NORMAL;

    /** @param renderer - A reference to the current renderer */
    constructor(renderer: CanvasRenderer)
    {
        this.renderer = renderer;
        // FIXME: when is this initialized?
        this.rootContext = null as any;
        this.activeContext = null as any;
    }

    /** initiates the system */
    init(): void
    {
        // this.rootContext = this.renderer.view.getContext('2d', { alpha }) as CanvasRenderingContext2D;
        this.rootContext = new Context2D(this.renderer.view.width, this.renderer.view.height);
        if (this.renderer.background.alpha < 1)
            this.rootContext.globalAlpha = this.renderer.background.alpha;

        this.activeContext = this.rootContext;
    }

    public destroy(): void
    {
        const self = this as any;
        self.renderer = null;
        self.rootContext = null;
        self.activeContext = null;
    }
}

systems.register('canvasContext', CanvasContextSystem)
