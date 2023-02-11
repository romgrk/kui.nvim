import type { Renderer } from '../Renderer';
import type { ISystem } from '../system/ISystem';
import type { Geometry } from './Geometry';
/**
 * System plugin to the renderer to manage geometry.
 * @memberof PIXI
 */
export declare class GeometrySystem implements ISystem {
    static systemName: string;
    /**
     * `true` if we has `*_vertex_array_object` extension.
     * @readonly
     */
    hasVao: boolean;
    /**
     * `true` if has `ANGLE_instanced_arrays` extension.
     * @readonly
     */
    hasInstance: boolean;
    /**
     * `true` if support `gl.UNSIGNED_INT` in `gl.drawElements` or `gl.drawElementsInstanced`.
     * @readonly
     */
    canUseUInt32ElementIndex: boolean;
    protected _activeGeometry: Geometry | null;
    /** Cache for all geometries by id, used in case renderer gets destroyed or for profiling. */
    readonly managedGeometries: {
        [key: number]: Geometry;
    };
    /** Renderer that owns this {@link GeometrySystem}. */
    private renderer;
    /** @param renderer - The renderer this System works for. */
    constructor(renderer: Renderer);
    destroy(): void;
}
