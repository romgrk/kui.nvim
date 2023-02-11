export default earcut;
export declare function earcut(data: number[], holeIndices?: number[] | null, dim?: number): number[];
export declare namespace earcut {
    var deviation: (data: any, holeIndices: any, dim: any, triangles: any) => number;
    var flatten: (data: any) => {
        vertices: any[];
        holes: any[];
        dimensions: any;
    };
}
