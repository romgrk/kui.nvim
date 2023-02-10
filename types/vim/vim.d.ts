/** @noSelfInFile */
declare namespace vim {
    type InspectOptionsProcessFunction = (item: object, path: any[]) => object;

    type InspectOptions = {
        depth?: number;
        newline?: string;
        indent?: string;
        process?: InspectOptionsProcessFunction;
    };

    /**
     * Return a human-readable representation of the given object.
     *
     * @param object object to inspect
     * @param {InspectOptions} [options] options to apply to the inspection
     */
    function inspect(object: any, options?: InspectOptions): string;

    /**
     * Apply a function to all values of a table.
     *
     * @param {Function} func function
     * @param {Object} t table
     */
    function tbl_map<T>(func: (tbl: object) => T, t: object): T[];

    function split(input: string, separator: string): string[];
}
