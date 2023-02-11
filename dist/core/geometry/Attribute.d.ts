import { TYPES } from 'src/constants';
/**
 * Holds the information for a single attribute structure required to render geometry.
 *
 * This does not contain the actual data, but instead has a buffer id that maps to a {_link PIXI.Buffer}
 * This can include anything from positions, uvs, normals, colors etc.
 * @memberof PIXI
 */
export declare class Attribute {
    buffer: number;
    size: number;
    normalized: boolean;
    type: TYPES;
    stride: number;
    start: number;
    instance: boolean;
    divisor: number;
    /**
     * @param buffer - the id of the buffer that this attribute will look for
     * @param size - the size of the attribute. If you have 2 floats per vertex (eg position x and y) this would be 2.
     * @param normalized - should the data be normalized.
     * @param {PIXI.TYPES} [type=PIXI.TYPES.FLOAT] - what type of number is the attribute. Check {_link PIXI.TYPES} to see the ones available
     * @param [stride=0] - How far apart, in bytes, the start of each value is. (used for interleaving data)
     * @param [start=0] - How far into the array to start reading values (used for interleaving data)
     * @param [instance=false] - Whether the geometry is instanced.
     * @param [divisor=1] - Divisor to use when doing instanced rendering
     */
    constructor(buffer: number, size?: number, normalized?: boolean, type?: TYPES, stride?: number, start?: number, instance?: boolean, divisor?: number);
    /** Destroys the Attribute. */
    destroy(): void;
    /**
     * Helper function that creates an Attribute based on the information provided
     * @param buffer - the id of the buffer that this attribute will look for
     * @param [size=0] - the size of the attribute. If you have 2 floats per vertex (eg position x and y) this would be 2
     * @param [normalized=false] - should the data be normalized.
     * @param [type=PIXI.TYPES.FLOAT] - what type of number is the attribute. Check {_link PIXI.TYPES} to see the ones available
     * @param [stride=0] - How far apart, in bytes, the start of each value is. (used for interleaving data)
     * @returns - A new {_link PIXI.Attribute} based on the information provided
     */
    static from(buffer: number, size?: number, normalized?: boolean, type?: TYPES, stride?: number): Attribute;
}
