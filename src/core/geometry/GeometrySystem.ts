import * as systems from 'src/core/systems'

import type { Renderer } from '../Renderer';
import type { ISystem } from '../system/ISystem';
import type { Geometry } from './Geometry';

/**
 * System plugin to the renderer to manage geometry.
 * @memberof PIXI
 */
export class GeometrySystem implements ISystem
{
    static systemName = 'geometry'

    /**
     * `true` if we has `*_vertex_array_object` extension.
     * @readonly
     */
    public hasVao: boolean;

    /**
     * `true` if has `ANGLE_instanced_arrays` extension.
     * @readonly
     */
    public hasInstance: boolean;

    /**
     * `true` if support `gl.UNSIGNED_INT` in `gl.drawElements` or `gl.drawElementsInstanced`.
     * @readonly
     */
    public canUseUInt32ElementIndex: boolean;

    protected _activeGeometry: Geometry | null;

    /** Cache for all geometries by id, used in case renderer gets destroyed or for profiling. */
    readonly managedGeometries: {[key: number]: Geometry};

    /** Renderer that owns this {@link GeometrySystem}. */
    private renderer: Renderer;

    /** @param renderer - The renderer this System works for. */
    constructor(renderer: Renderer)
    {
        this.renderer = renderer;
        this._activeGeometry = null;

        this.hasVao = true;
        this.hasInstance = true;
        this.canUseUInt32ElementIndex = false;
        this.managedGeometries = {};
    }

    destroy(): void
    {
        this.renderer = null as any;
    }
}

systems.register(GeometrySystem.systemName, GeometrySystem)
