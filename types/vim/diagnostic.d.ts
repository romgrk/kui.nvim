/** This is automatically generated file. Do not modify this file manually. */
/** @noResolution */
/** @noSelfInFile */
import type { INvimFloatWinConfig } from "./utils";
/** @noSelf */
export interface Diagnostic {
    /**
     * Configure diagnostic options globally or for a specific
     * diagnostic namespace.
     * Configuration can be specified globally, per-namespace, or
     * ephemerally (i.e. only for a single call to
     * |vim.diagnostic.set()| or |vim.diagnostic.show()|). Ephemeral
     * configuration has highest priority, followed by namespace
     * configuration, and finally global configuration.
     * For example, if a user enables virtual text globally with >
     *
     *    vim.diagnostic.config({virtual_text = true})
     *
     * <
     * and a diagnostic producer sets diagnostics with >
     *
     *    vim.diagnostic.set(ns, 0, diagnostics, {virtual_text = false})
     *
     * <
     * then virtual text will not be enabled for those diagnostics.
     *
     * Note:
     *     Each of the configuration options below accepts one of the
     *     following:
     *     • `false`: Disable this feature
     *     • `true`: Enable this feature, use default settings.
     *     • `table`: Enable this feature with overrides. Use an
     *       empty table to use default values.
     *     • `function`: Function with signature (namespace, bufnr)
     *       that returns any of the above.
     *
     *
     * @param opts table|nil When omitted or "nil", retrieve the
     *                  current configuration. Otherwise, a
     *                  configuration table with the following keys:
     *                  • underline: (default true) Use underline for
     *                    diagnostics. Options:
     *                    • severity: Only underline diagnostics
     *                      matching the given severity
     *                      |diagnostic-severity|
     *
     *                  • virtual_text: (default true) Use virtual
     *                    text for diagnostics. If multiple
     *                    diagnostics are set for a namespace, one
     *                    prefix per diagnostic + the last diagnostic
     *                    message are shown. Options:
     *                    • severity: Only show virtual text for
     *                      diagnostics matching the given severity
     *                      |diagnostic-severity|
     *                    • source: (boolean or string) Include the
     *                      diagnostic source in virtual text. Use
     *                      "if_many" to only show sources if there
     *                      is more than one diagnostic source in the
     *                      buffer. Otherwise, any truthy value means
     *                      to always show the diagnostic source.
     *                    • spacing: (number) Amount of empty spaces
     *                      inserted at the beginning of the virtual
     *                      text.
     *                    • prefix: (string) Prepend diagnostic
     *                      message with prefix.
     *                    • format: (function) A function that takes
     *                      a diagnostic as input and returns a
     *                      string. The return value is the text used
     *                      to display the diagnostic. Example: >
     *
     *                        function(diagnostic)
     *                          if diagnostic.severity == vim.diagnostic.severity.ERROR then
     *                            return string.format("E: %s", diagnostic.message)
     *                          end
     *                          return diagnostic.message
     *                        end
     *
     * <
     *
     *                  • signs: (default true) Use signs for
     *                    diagnostics. Options:
     *                    • severity: Only show signs for diagnostics
     *                      matching the given severity
     *                      |diagnostic-severity|
     *                    • priority: (number, default 10) Base
     *                      priority to use for signs. When
     *                      {severity_sort} is used, the priority of
     *                      a sign is adjusted based on its severity.
     *                      Otherwise, all signs use the same
     *                      priority.
     *
     *                  • float: Options for floating windows. See
     *                    |vim.diagnostic.open_float()|.
     *                  • update_in_insert: (default false) Update
     *                    diagnostics in Insert mode (if false,
     *                    diagnostics are updated on InsertLeave)
     *                  • severity_sort: (default false) Sort
     *                    diagnostics by severity. This affects the
     *                    order in which signs and virtual text are
     *                    displayed. When true, higher severities are
     *                    displayed before lower severities (e.g.
     *                    ERROR is displayed before WARN). Options:
     *                    • reverse: (boolean) Reverse sort order
     * @param namespace number|nil Update the options for the given
     *                  namespace. When omitted, update the global
     *                  diagnostic options.
     * @signature `config({opts}, {namespace})`
     */
    config: (opts: unknown, namespace: unknown) => unknown;
    /**
     * Disable diagnostics in the given buffer.
     * @param bufnr number|nil Buffer number, or 0 for current
     *                  buffer. When omitted, disable diagnostics in
     *                  all buffers.
     * @param namespace number|nil Only disable diagnostics for the
     *                  given namespace.
     * @signature `disable({bufnr}, {namespace})`
     */
    disable: (bufnr: unknown, namespace: unknown) => unknown;
    /**
     * Enable diagnostics in the given buffer.
     * @param bufnr number|nil Buffer number, or 0 for current
     *                  buffer. When omitted, enable diagnostics in
     *                  all buffers.
     * @param namespace number|nil Only enable diagnostics for the
     *                  given namespace.
     * @signature `enable({bufnr}, {namespace})`
     */
    enable: (bufnr: unknown, namespace: unknown) => unknown;
    /**
     * Convert a list of quickfix items to a list of diagnostics.
     * @param list table A list of quickfix items from |getqflist()|
     *             or |getloclist()|.
     * @returns array of diagnostics |diagnostic-structure|
     * @signature `fromqflist({list})`
     */
    fromqflist: (list: unknown) => unknown;
    /**
     * Get current diagnostics.
     * @param bufnr number|nil Buffer number to get diagnostics from.
     *              Use 0 for current buffer or nil for all buffers.
     * @param opts table|nil A table with the following keys:
     *              • namespace: (number) Limit diagnostics to the
     *                given namespace.
     *              • lnum: (number) Limit diagnostics to the given
     *                line number.
     *              • severity: See |diagnostic-severity|.
     * @returns table A list of diagnostic items |diagnostic-structure|.
     * @signature `get({bufnr}, {opts})`
     */
    get: (bufnr: unknown, opts: unknown) => unknown;
    /**
     * Get namespace metadata.
     * @param namespace number Diagnostic namespace
     * @returns table Namespace metadata
     * @signature `get_namespace({namespace})`
     */
    get_namespace: (namespace: unknown) => unknown;
    /**
     * Get current diagnostic namespaces.
     * @returns table A list of active diagnostic namespaces
     *     |vim.diagnostic|.
     * @signature `get_namespaces()`
     */
    get_namespaces: () => unknown;
    /**
     * Get the next diagnostic closest to the cursor position.
     * @param opts table See |vim.diagnostic.goto_next()|
     * @returns table Next diagnostic
     * @signature `get_next({opts})`
     */
    get_next: (opts: unknown) => unknown;
    /**
     * Return the position of the next diagnostic in the current
     * buffer.
     * @param opts table See |vim.diagnostic.goto_next()|
     * @returns table Next diagnostic position as a (row, col) tuple.
     * @signature `get_next_pos({opts})`
     */
    get_next_pos: (opts: unknown) => unknown;
    /**
     * Get the previous diagnostic closest to the cursor position.
     * @param opts table See |vim.diagnostic.goto_next()|
     * @returns table Previous diagnostic
     * @signature `get_prev({opts})`
     */
    get_prev: (opts: unknown) => unknown;
    /**
     * Return the position of the previous diagnostic in the current
     * buffer.
     * @param opts table See |vim.diagnostic.goto_next()|
     * @returns table Previous diagnostic position as a (row, col) tuple.
     * @signature `get_prev_pos({opts})`
     */
    get_prev_pos: (opts: unknown) => unknown;
    /**
     * Move to the next diagnostic.
     * @param opts table|nil Configuration table with the following
     *             keys:
     *             • namespace: (number) Only consider diagnostics
     *               from the given namespace.
     *             • cursor_position: (cursor position) Cursor
     *               position as a (row, col) tuple. See
     *               |nvim_win_get_cursor()|. Defaults to the current
     *               cursor position.
     *             • wrap: (boolean, default true) Whether to loop
     *               around file or not. Similar to 'wrapscan'.
     *             • severity: See |diagnostic-severity|.
     *             • float: (boolean or table, default true) If
     *               "true", call |vim.diagnostic.open_float()| after
     *               moving. If a table, pass the table as the {opts}
     *               parameter to |vim.diagnostic.open_float()|.
     *               Unless overridden, the float will show
     *               diagnostics at the new cursor position (as if
     *               "cursor" were passed to the "scope" option).
     *             • win_id: (number, default 0) Window ID
     * @signature `goto_next({opts})`
     */
    goto_next: (opts: unknown) => unknown;
    /**
     * Move to the previous diagnostic in the current buffer.
     * @param opts table See |vim.diagnostic.goto_next()|
     * @signature `goto_prev({opts})`
     */
    goto_prev: (opts: unknown) => unknown;
    /**
     * Hide currently displayed diagnostics.
     * This only clears the decorations displayed in the buffer.
     * Diagnostics can be redisplayed with |vim.diagnostic.show()|.
     * To completely remove diagnostics, use
     * |vim.diagnostic.reset()|.
     * To hide diagnostics and prevent them from re-displaying, use
     * |vim.diagnostic.disable()|.
     * @param namespace number|nil Diagnostic namespace. When
     *                  omitted, hide diagnostics from all
     *                  namespaces.
     * @param bufnr number|nil Buffer number, or 0 for current
     *                  buffer. When omitted, hide diagnostics in all
     *                  buffers.
     * @signature `hide({namespace}, {bufnr})`
     */
    hide: (namespace: unknown, bufnr: unknown) => unknown;
    /**
     * Parse a diagnostic from a string.
     * For example, consider a line of output from a linter: >
     *
     *  WARNING filename:27:3: Variable 'foo' does not exist
     *
     * <
     * This can be parsed into a diagnostic |diagnostic-structure|
     * with: >
     *
     *  local s = "WARNING filename:27:3: Variable 'foo' does not exist"
     *  local pattern = "^(%w+) %w+:(%d+):(%d+): (.+)$"
     *  local groups = {"severity", "lnum", "col", "message"}
     *  vim.diagnostic.match(s, pattern, groups, {WARNING = vim.diagnostic.WARN})
     *
     * <
     * @param str string String to parse diagnostics from.
     * @param pat string Lua pattern with capture groups.
     * @param groups table List of fields in a
     *                     |diagnostic-structure| to associate with
     *                     captures from {pat}.
     * @param severity_map table A table mapping the severity field
     *                     from {groups} with an item from
     *                     |vim.diagnostic.severity|.
     * @param defaults table|nil Table of default values for any
     *                     fields not listed in {groups}. When
     *                     omitted, numeric values default to 0 and
     *                     "severity" defaults to ERROR.
     * @returns diagnostic |diagnostic-structure| or `nil` if {pat} fails
     *     to match {str}.
     * @signature `match({str}, {pat}, {groups}, {severity_map}, {defaults})`
     */
    match: (str: unknown, pat: unknown, groups: unknown, severity_map: unknown, defaults: unknown) => unknown;
    /**
     * Show diagnostics in a floating window.
     * @param opts table|nil Configuration table with the same keys
     *             as |vim.lsp.util.open_floating_preview()| in
     *             addition to the following:
     *             • bufnr: (number) Buffer number to show
     *               diagnostics from. Defaults to the current
     *               buffer.
     *             • namespace: (number) Limit diagnostics to the
     *               given namespace
     *             • scope: (string, default "line") Show diagnostics
     *               from the whole buffer ("buffer"), the current
     *               cursor line ("line"), or the current cursor
     *               position ("cursor"). Shorthand versions are also
     *               accepted ("c" for "cursor", "l" for "line", "b"
     *               for "buffer").
     *             • pos: (number or table) If {scope} is "line" or
     *               "cursor", use this position rather than the
     *               cursor position. If a number, interpreted as a
     *               line number; otherwise, a (row, col) tuple.
     *             • severity_sort: (default false) Sort diagnostics
     *               by severity. Overrides the setting from
     *               |vim.diagnostic.config()|.
     *             • severity: See |diagnostic-severity|. Overrides
     *               the setting from |vim.diagnostic.config()|.
     *             • header: (string or table) String to use as the
     *               header for the floating window. If a table, it
     *               is interpreted as a [text, hl_group] tuple.
     *               Overrides the setting from
     *               |vim.diagnostic.config()|.
     *             • source: (boolean or string) Include the
     *               diagnostic source in the message. Use "if_many"
     *               to only show sources if there is more than one
     *               source of diagnostics in the buffer. Otherwise,
     *               any truthy value means to always show the
     *               diagnostic source. Overrides the setting from
     *               |vim.diagnostic.config()|.
     *             • format: (function) A function that takes a
     *               diagnostic as input and returns a string. The
     *               return value is the text used to display the
     *               diagnostic. Overrides the setting from
     *               |vim.diagnostic.config()|.
     *             • prefix: (function, string, or table) Prefix each
     *               diagnostic in the floating window. If a
     *               function, it must have the signature
     *               (diagnostic, i, total) -> (string, string),
     *               where {i} is the index of the diagnostic being
     *               evaluated and {total} is the total number of
     *               diagnostics displayed in the window. The
     *               function should return a string which is
     *               prepended to each diagnostic in the window as
     *               well as an (optional) highlight group which will
     *               be used to highlight the prefix. If {prefix} is
     *               a table, it is interpreted as a [text, hl_group]
     *               tuple as in |nvim_echo()|; otherwise, if
     *               {prefix} is a string, it is prepended to each
     *               diagnostic in the window with no highlight.
     *               Overrides the setting from
     *               |vim.diagnostic.config()|.
     * @returns tuple ({float_bufnr}, {win_id})
     * @signature `open_float({opts}, {...})`
     */
    open_float: (opts: unknown, args: unknown[]) => unknown;
    /**
     * Remove all diagnostics from the given namespace.
     * Unlike |vim.diagnostic.hide()|, this function removes all
     * saved diagnostics. They cannot be redisplayed using
     * |vim.diagnostic.show()|. To simply remove diagnostic
     * decorations in a way that they can be re-displayed, use
     * |vim.diagnostic.hide()|.
     * @param namespace number|nil Diagnostic namespace. When
     *                  omitted, remove diagnostics from all
     *                  namespaces.
     * @param bufnr number|nil Remove diagnostics for the given
     *                  buffer. When omitted, diagnostics are removed
     *                  for all buffers.
     * @signature `reset({namespace}, {bufnr})`
     */
    reset: (namespace: unknown, bufnr: unknown) => unknown;
    /**
     * Set diagnostics for the given namespace and buffer.
     * @param namespace number The diagnostic namespace
     * @param bufnr number Buffer number
     * @param diagnostics table A list of diagnostic items
     *                    |diagnostic-structure|
     * @param opts table|nil Display options to pass to
     *                    |vim.diagnostic.show()|
     * @signature `set({namespace}, {bufnr}, {diagnostics}, {opts})`
     */
    set: (namespace: unknown, bufnr: unknown, diagnostics: unknown, opts: unknown) => unknown;
    /**
     * Add buffer diagnostics to the location list.
     * @param opts table|nil Configuration table with the following
     *             keys:
     *             • namespace: (number) Only add diagnostics from
     *               the given namespace.
     *             • winnr: (number, default 0) Window number to set
     *               location list for.
     *             • open: (boolean, default true) Open the location
     *               list after setting.
     *             • title: (string) Title of the location list.
     *               Defaults to "Diagnostics".
     *             • severity: See |diagnostic-severity|.
     * @signature `setloclist({opts})`
     */
    setloclist: (opts: unknown) => unknown;
    /**
     * Add all diagnostics to the quickfix list.
     * @param opts table|nil Configuration table with the following
     *             keys:
     *             • namespace: (number) Only add diagnostics from
     *               the given namespace.
     *             • open: (boolean, default true) Open quickfix list
     *               after setting.
     *             • title: (string) Title of quickfix list. Defaults
     *               to "Diagnostics".
     *             • severity: See |diagnostic-severity|.
     * @signature `setqflist({opts})`
     */
    setqflist: (opts: unknown) => unknown;
    /**
     * Display diagnostics for the given namespace and buffer.
     * @param namespace number|nil Diagnostic namespace. When
     *                    omitted, show diagnostics from all
     *                    namespaces.
     * @param bufnr number|nil Buffer number, or 0 for current
     *                    buffer. When omitted, show diagnostics in
     *                    all buffers.
     * @param diagnostics table|nil The diagnostics to display. When
     *                    omitted, use the saved diagnostics for the
     *                    given namespace and buffer. This can be
     *                    used to display a list of diagnostics
     *                    without saving them or to display only a
     *                    subset of diagnostics. May not be used when
     *                    {namespace} or {bufnr} is nil.
     * @param opts table|nil Display options. See
     *                    |vim.diagnostic.config()|.
     * @signature `show({namespace}, {bufnr}, {diagnostics}, {opts})`
     */
    show: (namespace: unknown, bufnr: unknown, diagnostics: unknown, opts: unknown) => unknown;
    /**
     * Convert a list of diagnostics to a list of quickfix items that
     * can be passed to |setqflist()| or |setloclist()|.
     * @param diagnostics table List of diagnostics
     *                    |diagnostic-structure|.
     * @returns array of quickfix list items |setqflist-what|
     * @signature `toqflist({diagnostics})`
     */
    toqflist: (diagnostics: unknown) => unknown;
}