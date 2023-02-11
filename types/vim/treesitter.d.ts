/** This is automatically generated file. Do not modify this file manually. */
/** @noResolution */
/** @noSelfInFile */
import type { INvimFloatWinConfig } from "./utils";
/** @noSelf */
export interface Treesitter {
    /**
     * Adds a new directive to be used in queries
     * @param name the name of the directive, without leading #
     * @param handler the handler function to be used signature will
     *                be (match, pattern, bufnr, predicate)
     * @signature `add_directive({name}, {handler}, {force})`
     */
    add_directive: (name: unknown, handler: unknown, force: unknown) => unknown;
    /**
     * Adds a new predicate to be used in queries
     * @param name the name of the predicate, without leading #
     * @param handler the handler function to be used signature will
     *                be (match, pattern, bufnr, predicate)
     * @signature `add_predicate({name}, {handler}, {force})`
     */
    add_predicate: (name: unknown, handler: unknown, force: unknown) => unknown;
    /**
     * Gets the text corresponding to a given node
     * @param node the node
     * @param source The buffer or string from which the node is
     *               extracted
     * @signature `get_node_text({node}, {source})`
     */
    get_node_text: (node: unknown, source: unknown) => unknown;
    /**
     * Gets the parser for this bufnr / ft combination.
     * If needed this will create the parser. Unconditionally attach
     * the provided callback
     * @param bufnr The buffer the parser should be tied to
     * @param lang The filetype of this parser
     * @param opts Options object to pass to the created language
     *              tree
     * @returns The parser
     * @signature `get_parser({bufnr}, {lang}, {opts})`
     */
    get_parser: (bufnr: unknown, lang: unknown, opts: unknown) => unknown;
    /**
     * Returns the runtime query {query_name} for {lang}.
     * @param lang The language to use for the query
     * @param query_name The name of the query (i.e. "highlights")
     * @returns The corresponding query, parsed.
     * @signature `get_query({lang}, {query_name})`
     */
    get_query: (lang: unknown, query_name: unknown) => unknown;
    /**
     * Gets the list of files used to make up a query
     * @param lang The language
     * @param query_name The name of the query to load
     * @param is_included Internal parameter, most of the time left
     *                    as `nil`
     * @signature `get_query_files({lang}, {query_name}, {is_included})`
     */
    get_query_files: (lang: unknown, query_name: unknown, is_included: unknown) => unknown;
    /**
     * Gets a string parser
     * @param str The string to parse
     * @param lang The language of this string
     * @param opts Options to pass to the created language tree
     * @signature `get_string_parser({str}, {lang}, {opts})`
     */
    get_string_parser: (str: unknown, lang: unknown, opts: unknown) => unknown;
    /**
     * Inspects the provided language.
     * Inspecting provides some useful information on the language
     * like node names, ...
     * @param lang The language.
     * @signature `inspect_language({lang})`
     */
    inspect_language: (lang: unknown) => unknown;
    /**
     * @returns The list of supported directives.
     * @signature `list_directives()`
     */
    list_directives: () => unknown;
    /**
     * @returns The list of supported predicates.
     * @signature `list_predicates()`
     */
    list_predicates: () => unknown;
    /**
     * Represents a single treesitter parser for a language. The
     * language can contain child languages with in its range, hence
     * the tree.
     * @param source Can be a bufnr or a string of text to
     *                        parse
     * @param lang The language this tree represents
     * @param opts Options table
     * @param opts.injections A table of language to injection query
     *                        strings. This is useful for overriding
     *                        the built-in runtime file searching for
     *                        the injection language query per
     *                        language.
     * @signature `new({source}, {lang}, {opts})`
     */
    new: (source: unknown, lang: unknown, opts: unknown) => unknown;
    /**
     * Parse {query} as a string. (If the query is in a file, the
     * caller should read the contents into a string before calling).
     * Returns a `Query` (see |lua-treesitter-query|) object which
     * can be used to search nodes in the syntax tree for the
     * patterns defined in {query} using `iter_*` methods below.
     * Exposes `info` and `captures` with additional context about {query}.
     * • `captures` contains the list of unique capture names defined
     *   in {query}. -`info.captures` also points to `captures`.
     * • `info.patterns` contains information about predicates.
     *
     * @param lang string The language
     * @param query string A string containing the query (s-expr
     *              syntax)
     * @returns The query
     * @signature `parse_query({lang}, {query})`
     */
    parse_query: (lang: unknown, query: unknown) => unknown;
    /**
     * Asserts that the provided language is installed, and
     * optionally provide a path for the parser
     * Parsers are searched in the `parser` runtime directory.
     * @param lang The language the parser should parse
     * @param path Optional path the parser is located at
     * @param silent Don't throw an error if language not found
     * @signature `require_language({lang}, {path}, {silent})`
     */
    require_language: (lang: unknown, path: unknown, silent: unknown) => unknown;
    /**
     * The explicitly set queries from
     * |vim.treesitter.query.set_query()|.
     * Sets the runtime query {query_name} for {lang}
     * This allows users to override any runtime files and/or
     * configuration set by plugins.
     * @param lang string: The language to use for the query
     * @param query_name string: The name of the query (i.e.
     *                   "highlights")
     * @param text string: The query text (unparsed).
     * @signature `set_query({lang}, {query_name}, {text})`
     */
    set_query: (lang: unknown, query_name: unknown, text: unknown) => unknown;
    LanguageTree: {
        /**
         * Adds a child language to this tree.
         * If the language already exists as a child, it will first be
         * removed.
         * @param lang The language to add.
         * @param self
         * @signature `LanguageTree:add_child({self}, {lang})`
         */
        add_child: (this: any, lang: unknown) => unknown;
        /**
         * Returns a map of language to child tree.
         * @param self
         * @signature `LanguageTree:children({self})`
         */
        children: (this: any) => unknown;
        /**
         * Determines whether {range} is contained in this language tree
         * This goes down the tree to recursively check children.
         * @param range A range, that is a `{ start_line, start_col,
         *              end_line, end_col }` table.
         * @param self
         * @signature `LanguageTree:contains({self}, {range})`
         */
        contains: (this: any, range: unknown) => unknown;
        /**
         * Destroys this language tree and all its children.
         * Any cleanup logic should be performed here.
         * Note: This DOES NOT remove this tree from a parent. Instead, `remove_child` must be called on the parent to remove it.
         * @param self
         * @signature `LanguageTree:destroy({self})`
         */
        destroy: (this: any) => unknown;
        /**
         * Invokes the callback for each LanguageTree and it's children
         * recursively
         * @param fn The function to invoke. This is invoked
         *                     with arguments (tree: LanguageTree, lang:
         *                     string)
         * @param include_self Whether to include the invoking tree in
         *                     the results.
         * @param self
         * @signature `LanguageTree:for_each_child({self}, {fn}, {include_self})`
         */
        for_each_child: (this: any, fn: unknown, include_self: unknown) => unknown;
        /**
         * Invokes the callback for each treesitter trees recursively.
         * Note, this includes the invoking language tree's trees as
         * well.
         * @param fn The callback to invoke. The callback is invoked
         *             with arguments (tree: TSTree, languageTree:
         *             LanguageTree)
         * @param self
         * @signature `LanguageTree:for_each_tree({self}, {fn})`
         */
        for_each_tree: (this: any, fn: unknown) => unknown;
        /**
         * Gets the set of included regions
         * @param self
         * @signature `LanguageTree:included_regions({self})`
         */
        included_regions: (this: any) => unknown;
        /**
         * Invalidates this parser and all its children
         * @param self
         * @signature `LanguageTree:invalidate({self}, {reload})`
         */
        invalidate: (this: any, reload: unknown) => unknown;
        /**
         * Determines whether this tree is valid. If the tree is invalid,
         * call `parse()` . This will return the updated tree.
         * @param self
         * @signature `LanguageTree:is_valid({self})`
         */
        is_valid: (this: any) => unknown;
        /**
         * Gets the language of this tree node.
         * @param self
         * @signature `LanguageTree:lang({self})`
         */
        lang: (this: any) => unknown;
        /**
         * Gets the appropriate language that contains {range}
         * @param range A text range, see |LanguageTree:contains|
         * @param self
         * @signature `LanguageTree:language_for_range({self}, {range})`
         */
        language_for_range: (this: any, range: unknown) => unknown;
        /**
         * Parses all defined regions using a treesitter parser for the
         * language this tree represents. This will run the injection
         * query for this language to determine if any child languages
         * should be created.
         * @param self
         * @signature `LanguageTree:parse({self})`
         */
        parse: (this: any) => unknown;
        /**
         * Registers callbacks for the parser.
         * @param cbs table An |nvim_buf_attach()|-like table argument
         *             with the following keys :
         *             • `on_bytes` : see |nvim_buf_attach()|, but this will be
         *               called after the parsers callback.
         *             • `on_changedtree` : a callback that will be
         *               called every time the tree has syntactical
         *               changes. It will only be passed one argument,
         *               which is a table of the ranges (as node ranges)
         *               that changed.
         *             • `on_child_added` : emitted when a child is added
         *               to the tree.
         *             • `on_child_removed` : emitted when a child is
         *               removed from the tree.
         * @param self
         * @signature `LanguageTree:register_cbs({self}, {cbs})`
         */
        register_cbs: (this: any, cbs: unknown) => unknown;
        /**
         * Removes a child language from this tree.
         * @param lang The language to remove.
         * @param self
         * @signature `LanguageTree:remove_child({self}, {lang})`
         */
        remove_child: (this: any, lang: unknown) => unknown;
        /**
         * Sets the included regions that should be parsed by this
         * parser. A region is a set of nodes and/or ranges that will be
         * parsed in the same context.
         * For example, `{ { node1 }, { node2} }` is two separate
         * regions. This will be parsed by the parser in two different
         * contexts... thus resulting in two separate trees.
         * `{ { node1, node2 } }` is a single region consisting of two
         * nodes. This will be parsed by the parser in a single
         * context... thus resulting in a single tree.
         * This allows for embedded languages to be parsed together
         * across different nodes, which is useful for templating
         * languages like ERB and EJS.
         * Note, this call invalidates the tree and requires it to be
         * parsed again.
         * @param regions A list of regions this tree should manage and
         *                parse.
         * @param self
         * @signature `LanguageTree:set_included_regions({self}, {regions})`
         */
        set_included_regions: (this: any, regions: unknown) => unknown;
        /**
         * Returns the source content of the language tree (bufnr or
         * string).
         * @param self
         * @signature `LanguageTree:source({self})`
         */
        source: (this: any) => unknown;
        /**
         * Returns all trees this language tree contains. Does not
         * include child languages.
         * @param self
         * @signature `LanguageTree:trees({self})`
         */
        trees: (this: any) => unknown;
    };
    Query: {
        /**
         * Iterate over all captures from all matches inside {node}
         * {source} is needed if the query contains predicates, then the
         * caller must ensure to use a freshly parsed tree consistent
         * with the current text of the buffer (if relevant). {start_row}
         * and {end_row} can be used to limit matches inside a row range
         * (this is typically used with root node as the node, i e to get
         * syntax highlight matches in the current viewport). When
         * omitted the start and end row values are used from the given
         * node.
         * The iterator returns three values, a numeric id identifying
         * the capture, the captured node, and metadata from any
         * directives processing the match. The following example shows
         * how to get captures by name:
         * >
         *
         *  for id, node, metadata in query:iter_captures(tree:root(), bufnr, first, last) do
         *    local name = query.captures[id] -- name of the capture in the query
         *    -- typically useful info about the node:
         *    local type = node:type() -- type of the captured node
         *    local row1, col1, row2, col2 = node:range() -- range of the capture
         *    ... use the info here ...
         *  end
         *
         * <
         * @param node The node under which the search will occur
         * @param source The source buffer or string to extract text from
         * @param start The starting line of the search
         * @param stop The stopping line of the search (end-exclusive)
         * @param self
         * @returns The matching capture id
         * The captured node
         * @signature `Query:iter_captures({self}, {node}, {source}, {start}, {stop})`
         */
        iter_captures: (this: any, node: unknown, source: unknown, start: unknown, stop: unknown) => unknown;
        /**
         * Iterates the matches of self on a given range.
         * Iterate over all matches within a node. The arguments are the
         * same as for |query:iter_captures()| but the iterated values
         * are different: an (1-based) index of the pattern in the query,
         * a table mapping capture indices to nodes, and metadata from
         * any directives processing the match. If the query has more
         * than one pattern the capture table might be sparse, and e.g.
         * `pairs()` method should be used over `ipairs`. Here an example
         * iterating over all captures in every match:
         * >
         *
         *  for pattern, match, metadata in cquery:iter_matches(tree:root(), bufnr, first, last) do
         *    for id, node in pairs(match) do
         *      local name = query.captures[id]
         *      -- `node` was captured by the `name` capture in the match
         *
         *      local node_data = metadata[id] -- Node level metadata
         *
         *      ... use the info here ...
         *    end
         *  end
         *
         * <
         * @param node The node under which the search will occur
         * @param source The source buffer or string to search
         * @param start The starting line of the search
         * @param stop The stopping line of the search (end-exclusive)
         * @param self
         * @returns The matching pattern id
         * The matching match
         * @signature `Query:iter_matches({self}, {node}, {source}, {start}, {stop})`
         */
        iter_matches: (this: any, node: unknown, source: unknown, start: unknown, stop: unknown) => unknown;
    };
    TSHighlighter: {
        /**
         * Removes all internal references to the highlighter
         * @param self
         * @signature `TSHighlighter:destroy({self})`
         */
        destroy: (this: any) => unknown;
        /**
         * Gets the query used for
         * @param lang A language used by the highlighter.
         * @param self
         * @signature `TSHighlighter:get_query({self}, {lang})`
         */
        get_query: (this: any, lang: unknown) => unknown;
    };
}