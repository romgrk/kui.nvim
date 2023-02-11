/** This is automatically generated file. Do not modify this file manually. */
/** @noResolution */
/** @noSelfInFile */
import type { INvimFloatWinConfig } from "./utils";
/** @noSelf */
export interface Api {
    /**
     * @signature `nvim__buf_redraw_range({buffer}, {first}, {last}, {err})`
     */
    nvim__buf_redraw_range: (buffer: number, first: number, last: number, err?: unknown) => unknown;
    /**
     * @signature `nvim__buf_stats({buffer}, {err})`
     */
    nvim__buf_stats: (buffer: number, err?: unknown) => unknown;
    /**
     * @signature `nvim__get_hl_defs({ns_id}, {err})`
     */
    nvim__get_hl_defs: (ns_id: number, err?: unknown) => unknown;
    /**
     * @signature `nvim__get_lib_dir()`
     */
    nvim__get_lib_dir: () => unknown;
    /**
     * Find files in runtime directories
     * @param pat pattern of files to search for
     * @param all whether to return all matches or only the first
     * @param options is_lua: only search lua subdirs
     * @returns list of absolute paths to the found files
     * @signature `nvim__get_runtime({pat}, {all}, {opts}, {err})`
     * @annotations {fast}
     */
    nvim__get_runtime: (pat: unknown[], all: boolean, opts?: unknown, err?: unknown) => unknown;
    /**
     * Returns object given as argument.
     * This API function is used for testing. One should not rely on
     * its presence in plugins.
     * @param obj Object to return.
     * @returns its argument.
     * @signature `nvim__id({obj})`
     */
    nvim__id: (obj: Record<string, unknown>) => unknown;
    /**
     * Returns array given as argument.
     * This API function is used for testing. One should not rely on
     * its presence in plugins.
     * @param arr Array to return.
     * @returns its argument.
     * @signature `nvim__id_array({arr})`
     */
    nvim__id_array: (arr: unknown[]) => unknown;
    /**
     * Returns dictionary given as argument.
     * This API function is used for testing. One should not rely on
     * its presence in plugins.
     * @param dct Dictionary to return.
     * @returns its argument.
     * @signature `nvim__id_dictionary({dct})`
     */
    nvim__id_dictionary: (dct: Record<string, unknown>) => unknown;
    /**
     * Returns floating-point value given as argument.
     * This API function is used for testing. One should not rely on
     * its presence in plugins.
     * @param flt Value to return.
     * @returns its argument.
     * @signature `nvim__id_float({flt})`
     */
    nvim__id_float: (flt: number) => unknown;
    /**
     * NB: if your UI doesn't use hlstate, this will not return
     * hlstate first time.
     * @signature `nvim__inspect_cell({grid}, {row}, {col}, {err})`
     */
    nvim__inspect_cell: (grid: number, row: number, col: number, err?: unknown) => unknown;
    /**
     * @signature `nvim__runtime_inspect()`
     */
    nvim__runtime_inspect: () => unknown;
    /**
     * @signature `nvim__screenshot({path})`
     * @annotations {fast}
     */
    nvim__screenshot: (path: string) => unknown;
    /**
     * Set active namespace for highlights.
     * NB: this function can be called from async contexts, but the
     * semantics are not yet well-defined. To start with
     * |nvim_set_decoration_provider| on_win and on_line callbacks
     * are explicitly allowed to change the namespace during a redraw
     * cycle.
     * @param ns_id the namespace to activate
     * @signature `nvim__set_hl_ns({ns_id}, {err})`
     * @annotations {fast}
     */
    nvim__set_hl_ns: (ns_id: number, err?: unknown) => unknown;
    /**
     * Gets internal stats.
     * @returns Map of various internal stats.
     * @signature `nvim__stats()`
     */
    nvim__stats: () => unknown;
    /**
     * Adds a highlight to buffer.
     * Useful for plugins that dynamically generate highlights to a
     * buffer (like a semantic highlighter or linter). The function
     * adds a single highlight to a buffer. Unlike |matchaddpos()|
     * highlights follow changes to line numbering (as lines are
     * inserted/removed above the highlighted line), like signs and
     * marks do.
     * Namespaces are used for batch deletion/updating of a set of
     * highlights. To create a namespace, use
     * |nvim_create_namespace()| which returns a namespace id. Pass
     * it in to this function as `ns_id` to add highlights to the
     * namespace. All highlights in the same namespace can then be
     * cleared with single call to |nvim_buf_clear_namespace()|. If
     * the highlight never will be deleted by an API call, pass
     * `ns_id = -1`.
     * As a shorthand, `ns_id = 0` can be used to create a new
     * namespace for the highlight, the allocated id is then
     * returned. If `hl_group` is the empty string no highlight is
     * added, but a new `ns_id` is still returned. This is supported
     * for backwards compatibility, new code should use
     * |nvim_create_namespace()| to create a new empty namespace.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param ns_id namespace to use or -1 for ungrouped
     *                  highlight
     * @param hl_group Name of the highlight group to use
     * @param line Line to highlight (zero-indexed)
     * @param col_start Start of (byte-indexed) column range to
     *                  highlight
     * @param col_end End of (byte-indexed) column range to
     *                  highlight, or -1 to highlight to end of line
     * @returns The ns_id that was used
     * @signature `nvim_buf_add_highlight({buffer}, {ns_id}, {hl_group}, {line}, {col_start}, {col_end}, {err})`
     */
    nvim_buf_add_highlight: (buffer: number, ns_id: number, hl_group: string, line: number, col_start: number, col_end: number, err?: unknown) => number;
    /**
     * Activates buffer-update events on a channel, or as Lua
     * callbacks.
     * Example (Lua): capture buffer updates in a global `events` variable (use "print(vim.inspect(events))" to see its
     * contents): >
     *   events = {}
     *   vim.api.nvim_buf_attach(0, false, {
     *     on_lines=function(...) table.insert(events, {...}) end})
     *
     * <
     * @param buffer Buffer handle, or 0 for current buffer
     * @param send_buffer True if the initial notification should
     *                    contain the whole buffer: first
     *                    notification will be
     *                    `nvim_buf_lines_event`. Else the first
     *                    notification will be
     *                    `nvim_buf_changedtick_event`. Not for Lua
     *                    callbacks.
     * @param opts Optional parameters.
     *                    • on_lines: Lua callback invoked on change.
     *                      Return `true` to detach. Args:
     *                      • the string "lines"
     *                      • buffer handle
     *                      • b:changedtick
     *                      • first line that changed (zero-indexed)
     *                      • last line that was changed
     *                      • last line in the updated range
     *                      • byte count of previous contents
     *                      • deleted_codepoints (if `utf_sizes` is
     *                        true)
     *                      • deleted_codeunits (if `utf_sizes` is
     *                        true)
     *
     *                    • on_bytes: lua callback invoked on change.
     *                      This callback receives more granular
     *                      information about the change compared to
     *                      on_lines. Return `true` to detach. Args:
     *                      • the string "bytes"
     *                      • buffer handle
     *                      • b:changedtick
     *                      • start row of the changed text
     *                        (zero-indexed)
     *                      • start column of the changed text
     *                      • byte offset of the changed text (from
     *                        the start of the buffer)
     *                      • old end row of the changed text
     *                      • old end column of the changed text
     *                      • old end byte length of the changed text
     *                      • new end row of the changed text
     *                      • new end column of the changed text
     *                      • new end byte length of the changed text
     *
     *                    • on_changedtick: Lua callback invoked on
     *                      changedtick increment without text
     *                      change. Args:
     *                      • the string "changedtick"
     *                      • buffer handle
     *                      • b:changedtick
     *
     *                    • on_detach: Lua callback invoked on
     *                      detach. Args:
     *                      • the string "detach"
     *                      • buffer handle
     *
     *                    • on_reload: Lua callback invoked on
     *                      reload. The entire buffer content should
     *                      be considered changed. Args:
     *                      • the string "reload"
     *                      • buffer handle
     *
     *                    • utf_sizes: include UTF-32 and UTF-16 size
     *                      of the replaced region, as args to
     *                      `on_lines`.
     *                    • preview: also attach to command preview
     *                      (i.e. 'inccommand') events.
     * @returns False if attach failed (invalid parameter, or buffer isn't
     *     loaded); otherwise True. TODO: LUA_API_NO_EVAL
     * @signature `nvim_buf_attach({buffer}, {send_buffer}, {opts}, {err})`
     * @reference |nvim_buf_detach()|
     * |api-buffer-updates-lua|
     */
    nvim_buf_attach: (buffer: number, send_buffer: boolean, opts: Record<string, unknown>, err?: unknown) => boolean;
    /**
     * call a function with buffer as temporary current buffer
     * This temporarily switches current buffer to "buffer". If the
     * current window already shows "buffer", the window is not
     * switched If a window inside the current tabpage (including a
     * float) already shows the buffer One of these windows will be
     * set as current window temporarily. Otherwise a temporary
     * scratch window (called the "autocmd window" for historical
     * reasons) will be used.
     * This is useful e.g. to call vimL functions that only work with
     * the current buffer/window currently, like |termopen()|.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param fun Function to call inside the buffer (currently
     *               lua callable only)
     * @returns Return value of function. NB: will deepcopy lua values
     *     currently, use upvalues to send lua references in and out.
     * @signature `nvim_buf_call({buffer}, {fun}, {err})`
     */
    nvim_buf_call: (buffer: number, fun: unknown, err?: unknown) => Record<string, unknown>;
    /**
     * Clears namespaced objects (highlights, extmarks, virtual text)
     * from a region.
     * Lines are 0-indexed. |api-indexing| To clear the namespace in
     * the entire buffer, specify line_start=0 and line_end=-1.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param ns_id Namespace to clear, or -1 to clear all
     *                   namespaces.
     * @param line_start Start of range of lines to clear
     * @param line_end End of range of lines to clear (exclusive)
     *                   or -1 to clear to end of buffer.
     * @signature `nvim_buf_clear_namespace({buffer}, {ns_id}, {line_start}, {line_end}, {err})`
     */
    nvim_buf_clear_namespace: (buffer: number, ns_id: number, line_start: number, line_end: number, err?: unknown) => void;
    /**
     * Create a new user command |user-commands| in the given buffer.
     * @param buffer Buffer handle, or 0 for current buffer.
     * @signature `nvim_buf_create_user_command({buffer}, {name}, {command}, {opts}, {err})`
     * @reference nvim_create_user_command
     */
    nvim_buf_create_user_command: (buffer: number, name: string, command: Record<string, unknown>, opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Removes an extmark.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param ns_id Namespace id from |nvim_create_namespace()|
     * @param id Extmark id
     * @returns true if the extmark was found, else false
     * @signature `nvim_buf_del_extmark({buffer}, {ns_id}, {id}, {err})`
     */
    nvim_buf_del_extmark: (buffer: number, ns_id: number, id: number, err?: unknown) => boolean;
    /**
     * Unmaps a buffer-local |mapping| for the given mode.
     * @param buffer Buffer handle, or 0 for current buffer
     * @signature `nvim_buf_del_keymap({buffer}, {mode}, {lhs}, {err})`
     * @reference |nvim_del_keymap()|
     */
    nvim_buf_del_keymap: (buffer: number, mode: string, lhs: string, err?: unknown) => void;
    /**
     * Deletes a named mark in the buffer. See |mark-motions|.
     *
     * Note:
     *     only deletes marks set in the buffer, if the mark is not
     *     set in the buffer it will return false.
     *
     * @param buffer Buffer to set the mark on
     * @param name Mark name
     * @returns true if the mark was deleted, else false.
     * @signature `nvim_buf_del_mark({buffer}, {name}, {err})`
     * @reference |nvim_buf_set_mark()|
     * |nvim_del_mark()|
     */
    nvim_buf_del_mark: (buffer: number, name: string, err?: unknown) => boolean;
    /**
     * Delete a buffer-local user-defined command.
     * Only commands created with |:command-buffer| or
     * |nvim_buf_create_user_command()| can be deleted with this
     * function.
     * @param buffer Buffer handle, or 0 for current buffer.
     * @param name Name of the command to delete.
     * @signature `nvim_buf_del_user_command({buffer}, {name}, {err})`
     */
    nvim_buf_del_user_command: (buffer: number, name: string, err?: unknown) => void;
    /**
     * Removes a buffer-scoped (b:) variable
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Variable name
     * @signature `nvim_buf_del_var({buffer}, {name}, {err})`
     */
    nvim_buf_del_var: (buffer: number, name: string, err?: unknown) => void;
    /**
     * Deletes the buffer. See |:bwipeout|
     * @param buffer Buffer handle, or 0 for current buffer
     * @param opts Optional parameters. Keys:
     *               • force: Force deletion and ignore unsaved
     *                 changes.
     *               • unload: Unloaded only, do not delete. See
     *                 |:bunload|
     * @signature `nvim_buf_delete({buffer}, {opts}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_buf_delete: (buffer: number, opts: Record<string, unknown>, err?: unknown) => void;
    /**
     * Deactivates buffer-update events on the channel.
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns False if detach failed (because the buffer isn't loaded);
     *     otherwise True.
     * @signature `nvim_buf_detach({buffer}, {err})`
     * @reference |nvim_buf_attach()|
     * |api-lua-detach| for detaching Lua callbacks
     */
    nvim_buf_detach: (buffer: number, err?: unknown) => boolean;
    /**
     * Gets a changed tick of a buffer
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns `b:changedtick` value.
     * @signature `nvim_buf_get_changedtick({buffer}, {err})`
     */
    nvim_buf_get_changedtick: (buffer: number, err?: unknown) => number;
    /**
     * Gets a map of buffer-local |user-commands|.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param opts Optional parameters. Currently not used.
     * @returns Map of maps describing commands.
     * @signature `nvim_buf_get_commands({buffer}, {opts}, {err})`
     */
    nvim_buf_get_commands: (buffer: number, opts?: Record<string, unknown>, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the position (0-indexed) of an extmark.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param ns_id Namespace id from |nvim_create_namespace()|
     * @param id Extmark id
     * @param opts Optional parameters. Keys:
     *               • details: Whether to include the details dict
     * @returns 0-indexed (row, col) tuple or empty list () if extmark id
     *     was absent
     * @signature `nvim_buf_get_extmark_by_id({buffer}, {ns_id}, {id}, {opts}, {err})`
     */
    nvim_buf_get_extmark_by_id: (buffer: number, ns_id: number, id: number, opts: Record<string, unknown>, err?: unknown) => number[];
    /**
     * Gets extmarks in "traversal order" from a |charwise| region
     * defined by buffer positions (inclusive, 0-indexed
     * |api-indexing|).
     * Region can be given as (row,col) tuples, or valid extmark ids
     * (whose positions define the bounds). 0 and -1 are understood
     * as (0,0) and (-1,-1) respectively, thus the following are
     * equivalent:
     * >
     *   nvim_buf_get_extmarks(0, my_ns, 0, -1, {})
     *   nvim_buf_get_extmarks(0, my_ns, [0,0], [-1,-1], {})
     *
     * <
     * If `end` is less than `start`, traversal works backwards.
     * (Useful with `limit`, to get the first marks prior to a given
     * position.)
     * Example:
     * >
     *   local a   = vim.api
     *   local pos = a.nvim_win_get_cursor(0)
     *   local ns  = a.nvim_create_namespace('my-plugin')
     *   -- Create new extmark at line 1, column 1.
     *   local m1  = a.nvim_buf_set_extmark(0, ns, 0, 0, {})
     *   -- Create new extmark at line 3, column 1.
     *   local m2  = a.nvim_buf_set_extmark(0, ns, 0, 2, {})
     *   -- Get extmarks only from line 3.
     *   local ms  = a.nvim_buf_get_extmarks(0, ns, {2,0}, {2,0}, {})
     *   -- Get all marks in this buffer + namespace.
     *   local all = a.nvim_buf_get_extmarks(0, ns, 0, -1, {})
     *   print(vim.inspect(ms))
     *
     * <
     * @param buffer Buffer handle, or 0 for current buffer
     * @param ns_id Namespace id from |nvim_create_namespace()|
     * @param start Start of range: a 0-indexed (row, col) or valid
     *               extmark id (whose position defines the bound).
     *               |api-indexing|
     * @param end End of range (inclusive): a 0-indexed (row, col)
     *               or valid extmark id (whose position defines the
     *               bound). |api-indexing|
     * @param opts Optional parameters. Keys:
     *               • limit: Maximum number of marks to return
     *               • details Whether to include the details dict
     * @returns List of [extmark_id, row, col] tuples in "traversal
     *     order".
     * @signature `nvim_buf_get_extmarks({buffer}, {ns_id}, {start}, {end}, {opts}, {err})`
     */
    nvim_buf_get_extmarks: (buffer: number, ns_id: number, start: Record<string, unknown>, end: Record<string, unknown>, opts: Record<string, unknown>, err?: unknown) => unknown[];
    /**
     * Gets a list of buffer-local |mapping| definitions.
     * @param mode Mode short-name ("n", "i", "v", ...)
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns Array of maparg()-like dictionaries describing mappings.
     *     The "buffer" key holds the associated buffer handle.
     * @signature `nvim_buf_get_keymap({buffer}, {mode}, {err})`
     */
    nvim_buf_get_keymap: (buffer: number, mode: string, err?: unknown) => Record<string, unknown>[];
    /**
     * Gets a line-range from the buffer.
     * Indexing is zero-based, end-exclusive. Negative indices are
     * interpreted as length+1+index: -1 refers to the index past the
     * end. So to get the last element use start=-2 and end=-1.
     * Out-of-bounds indices are clamped to the nearest valid value,
     * unless `strict_indexing` is set.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param start First line index
     * @param end Last line index (exclusive)
     * @param strict_indexing Whether out-of-bounds should be an
     *                        error.
     * @returns Array of lines, or empty array for unloaded buffer.
     * @signature `nvim_buf_get_lines({buffer}, {start}, {end}, {strict_indexing}, {err})`
     */
    nvim_buf_get_lines: (buffer: number, start: number, end: number, strict_indexing: boolean, err?: unknown) => string[];
    /**
     * Returns a tuple (row,col) representing the position of the
     * named mark. See |mark-motions|.
     * Marks are (1,0)-indexed. |api-indexing|
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Mark name
     * @returns (row, col) tuple, (0, 0) if the mark is not set, or is an
     *     uppercase/file mark set in another buffer.
     * @signature `nvim_buf_get_mark({buffer}, {name}, {err})`
     * @reference |nvim_buf_set_mark()|
     * |nvim_buf_del_mark()|
     */
    nvim_buf_get_mark: (buffer: number, name: string, err?: unknown) => [
        number,
        number
    ];
    /**
     * Gets the full file name for the buffer
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns Buffer name
     * @signature `nvim_buf_get_name({buffer}, {err})`
     */
    nvim_buf_get_name: (buffer: number, err?: unknown) => string;
    /**
     * Returns the byte offset of a line (0-indexed). |api-indexing|
     * Line 1 (index=0) has offset 0. UTF-8 bytes are counted. EOL is
     * one byte. 'fileformat' and 'fileencoding' are ignored. The
     * line index just after the last line gives the total byte-count
     * of the buffer. A final EOL byte is counted if it would be
     * written, see 'eol'.
     * Unlike |line2byte()|, throws error for out-of-bounds indexing.
     * Returns -1 for unloaded buffer.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param index Line index
     * @returns Integer byte offset, or -1 for unloaded buffer.
     * @signature `nvim_buf_get_offset({buffer}, {index}, {err})`
     */
    nvim_buf_get_offset: (buffer: number, index: number, err?: unknown) => number;
    /**
     * Gets a buffer option value
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Option name
     * @returns Option value
     * @signature `nvim_buf_get_option({buffer}, {name}, {err})`
     */
    nvim_buf_get_option: (buffer: number, name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets a range from the buffer.
     * This differs from |nvim_buf_get_lines()| in that it allows
     * retrieving only portions of a line.
     * Indexing is zero-based. Column indices are end-exclusive.
     * Prefer |nvim_buf_get_lines()| when retrieving entire lines.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param start_row First line index
     * @param start_col Starting byte offset of first line
     * @param end_row Last line index
     * @param end_col Ending byte offset of last line (exclusive)
     * @param opts Optional parameters. Currently unused.
     * @returns Array of lines, or empty array for unloaded buffer.
     * @signature `nvim_buf_get_text({buffer}, {start_row}, {start_col}, {end_row}, {end_col}, {opts}, {err})`
     */
    nvim_buf_get_text: (buffer: number, start_row: number, start_col: number, end_row: number, end_col: number, opts: Record<string, unknown>, err?: unknown) => string[];
    /**
     * Gets a buffer-scoped (b:) variable.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Variable name
     * @returns Variable value
     * @signature `nvim_buf_get_var({buffer}, {name}, {err})`
     */
    nvim_buf_get_var: (buffer: number, name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Checks if a buffer is valid and loaded. See |api-buffer| for
     * more info about unloaded buffers.
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns true if the buffer is valid and loaded, false otherwise.
     * @signature `nvim_buf_is_loaded({buffer})`
     */
    nvim_buf_is_loaded: (buffer: number) => boolean;
    /**
     * Checks if a buffer is valid.
     *
     * Note:
     *     Even if a buffer is valid it may have been unloaded. See
     *     |api-buffer| for more info about unloaded buffers.
     *
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns true if the buffer is valid, false otherwise.
     * @signature `nvim_buf_is_valid({buffer})`
     */
    nvim_buf_is_valid: (buffer: number) => boolean;
    /**
     * Returns the number of lines in the given buffer.
     * @param buffer Buffer handle, or 0 for current buffer
     * @returns Line count, or 0 for unloaded buffer. |api-buffer|
     * @signature `nvim_buf_line_count({buffer}, {err})`
     */
    nvim_buf_line_count: (buffer: number, err?: unknown) => number;
    /**
     * Creates or updates an extmark.
     * To create a new extmark, pass id=0. The extmark id will be
     * returned. To move an existing mark, pass its id.
     * It is also allowed to create a new mark by passing in a
     * previously unused id, but the caller must then keep track of
     * existing and unused ids itself. (Useful over RPC, to avoid
     * waiting for the return value.)
     * Using the optional arguments, it is possible to use this to
     * highlight a range of text, and also to associate virtual text
     * to the mark.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param ns_id Namespace id from |nvim_create_namespace()|
     * @param line Line where to place the mark, 0-based.
     *               |api-indexing|
     * @param col Column where to place the mark, 0-based.
     *               |api-indexing|
     * @param opts Optional parameters.
     *               • id : id of the extmark to edit.
     *               • end_row : ending line of the mark, 0-based
     *                 inclusive.
     *               • end_col : ending col of the mark, 0-based
     *                 exclusive.
     *               • hl_group : name of the highlight group used to
     *                 highlight this mark.
     *               • hl_eol : when true, for a multiline highlight
     *                 covering the EOL of a line, continue the
     *                 highlight for the rest of the screen line
     *                 (just like for diff and cursorline highlight).
     *               • virt_text : virtual text to link to this mark.
     *                 A list of [text, highlight] tuples, each
     *                 representing a text chunk with specified
     *                 highlight. `highlight` element can either be a
     *                 a single highlight group, or an array of
     *                 multiple highlight groups that will be stacked
     *                 (highest priority last). A highlight group can
     *                 be supplied either as a string or as an
     *                 integer, the latter which can be obtained
     *                 using |nvim_get_hl_id_by_name|.
     *               • virt_text_pos : position of virtual text.
     *                 Possible values:
     *                 • "eol": right after eol character (default)
     *                 • "overlay": display over the specified
     *                   column, without shifting the underlying
     *                   text.
     *                 • "right_align": display right aligned in the
     *                   window.
     *
     *               • virt_text_win_col : position the virtual text
     *                 at a fixed window column (starting from the
     *                 first text column)
     *               • virt_text_hide : hide the virtual text when
     *                 the background text is selected or hidden due
     *                 to horizontal scroll 'nowrap'
     *               • hl_mode : control how highlights are combined
     *                 with the highlights of the text. Currently
     *                 only affects virt_text highlights, but might
     *                 affect `hl_group` in later versions.
     *                 • "replace": only show the virt_text color.
     *                   This is the default
     *                 • "combine": combine with background text
     *                   color
     *                 • "blend": blend with background text color.
     *
     *               • virt_lines : virtual lines to add next to this
     *                 mark This should be an array over lines, where
     *                 each line in turn is an array over [text,
     *                 highlight] tuples. In general, buffer and
     *                 window options do not affect the display of
     *                 the text. In particular 'wrap' and 'linebreak'
     *                 options do not take effect, so the number of
     *                 extra screen lines will always match the size
     *                 of the array. However the 'tabstop' buffer
     *                 option is still used for hard tabs. By default
     *                 lines are placed below the buffer line
     *                 containing the mark.
     *               • virt_lines_above: place virtual lines above
     *                 instead.
     *               • virt_lines_leftcol: Place extmarks in the
     *                 leftmost column of the window, bypassing sign
     *                 and number columns.
     *               • ephemeral : for use with
     *                 |nvim_set_decoration_provider| callbacks. The
     *                 mark will only be used for the current redraw
     *                 cycle, and not be permantently stored in the
     *                 buffer.
     *               • right_gravity : boolean that indicates the
     *                 direction the extmark will be shifted in when
     *                 new text is inserted (true for right, false
     *                 for left). defaults to true.
     *               • end_right_gravity : boolean that indicates the
     *                 direction the extmark end position (if it
     *                 exists) will be shifted in when new text is
     *                 inserted (true for right, false for left).
     *                 Defaults to false.
     *               • priority: a priority value for the highlight
     *                 group. For example treesitter highlighting
     *                 uses a value of 100.
     *               • strict: boolean that indicates extmark should
     *                 not be placed if the line or column value is
     *                 past the end of the buffer or end of the line
     *                 respectively. Defaults to true.
     *               • sign_text: string of length 1-2 used to
     *                 display in the sign column. Note: ranges are
     *                 unsupported and decorations are only applied
     *                 to start_row
     *               • sign_hl_group: name of the highlight group
     *                 used to highlight the sign column text. Note:
     *                 ranges are unsupported and decorations are
     *                 only applied to start_row
     *               • number_hl_group: name of the highlight group
     *                 used to highlight the number column. Note:
     *                 ranges are unsupported and decorations are
     *                 only applied to start_row
     *               • line_hl_group: name of the highlight group
     *                 used to highlight the whole line. Note: ranges
     *                 are unsupported and decorations are only
     *                 applied to start_row
     *               • cursorline_hl_group: name of the highlight
     *                 group used to highlight the line when the
     *                 cursor is on the same line as the mark and
     *                 'cursorline' is enabled. Note: ranges are
     *                 unsupported and decorations are only applied
     *                 to start_row
     *               • conceal: string which should be either empty
     *                 or a single character. Enable concealing
     *                 similar to |:syn-conceal|. When a character is
     *                 supplied it is used as |:syn-cchar|.
     *                 "hl_group" is used as highlight for the cchar
     *                 if provided, otherwise it defaults to
     *                 |hl-Conceal|.
     * @returns Id of the created/updated extmark
     * @signature `nvim_buf_set_extmark({buffer}, {ns_id}, {line}, {col}, {opts}, {err})`
     */
    nvim_buf_set_extmark: (buffer: number, ns_id: number, line: number, col: number, opts?: Record<string, unknown>, err?: unknown) => number;
    /**
     * Sets a buffer-local |mapping| for the given mode.
     * @param buffer Buffer handle, or 0 for current buffer
     * @signature `nvim_buf_set_keymap({buffer}, {mode}, {lhs}, {rhs}, {opts}, {err})`
     * @reference |nvim_set_keymap()|
     */
    nvim_buf_set_keymap: (buffer: number, mode: string, lhs: string, rhs: string, opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets (replaces) a line-range in the buffer.
     * Indexing is zero-based, end-exclusive. Negative indices are
     * interpreted as length+1+index: -1 refers to the index past the
     * end. So to change or delete the last element use start=-2 and
     * end=-1.
     * To insert lines at a given index, set `start` and `end` to the
     * same index. To delete a range of lines, set `replacement` to
     * an empty array.
     * Out-of-bounds indices are clamped to the nearest valid value,
     * unless `strict_indexing` is set.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param start First line index
     * @param end Last line index (exclusive)
     * @param strict_indexing Whether out-of-bounds should be an
     *                        error.
     * @param replacement Array of lines to use as replacement
     * @signature `nvim_buf_set_lines({buffer}, {start}, {end}, {strict_indexing}, {replacement}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_buf_set_lines: (buffer: number, start: number, end: number, strict_indexing: boolean, replacement: string[], err?: unknown) => void;
    /**
     * Sets a named mark in the given buffer, all marks are allowed
     * file/uppercase, visual, last change, etc. See |mark-motions|.
     * Marks are (1,0)-indexed. |api-indexing|
     *
     * Note:
     *     Passing 0 as line deletes the mark
     *
     * @param buffer Buffer to set the mark on
     * @param name Mark name
     * @param line Line number
     * @param col Column/row number
     * @param opts Optional parameters. Reserved for future use.
     * @returns true if the mark was set, else false.
     * @signature `nvim_buf_set_mark({buffer}, {name}, {line}, {col}, {opts}, {err})`
     * @reference |nvim_buf_del_mark()|
     * |nvim_buf_get_mark()|
     */
    nvim_buf_set_mark: (buffer: number, name: string, line: number, col: number, opts: Record<string, unknown>, err?: unknown) => boolean;
    /**
     * Sets the full file name for a buffer
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Buffer name
     * @signature `nvim_buf_set_name({buffer}, {name}, {err})`
     */
    nvim_buf_set_name: (buffer: number, name: string, err?: unknown) => void;
    /**
     * Sets a buffer option value. Passing 'nil' as value deletes the
     * option (only works if there's a global fallback)
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Option name
     * @param value Option value
     * @signature `nvim_buf_set_option({buffer}, {name}, {value}, {err})`
     */
    nvim_buf_set_option: (buffer: number, name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets (replaces) a range in the buffer
     * This is recommended over nvim_buf_set_lines when only
     * modifying parts of a line, as extmarks will be preserved on
     * non-modified parts of the touched lines.
     * Indexing is zero-based and end-exclusive.
     * To insert text at a given index, set `start` and `end` ranges
     * to the same index. To delete a range, set `replacement` to an
     * array containing an empty string, or simply an empty array.
     * Prefer nvim_buf_set_lines when adding or deleting entire lines
     * only.
     * @param buffer Buffer handle, or 0 for current buffer
     * @param start_row First line index
     * @param start_column First column
     * @param end_row Last line index
     * @param end_column Last column
     * @param replacement Array of lines to use as replacement
     * @signature `nvim_buf_set_text({buffer}, {start_row}, {start_col}, {end_row}, {end_col}, {replacement}, {err})`
     */
    nvim_buf_set_text: (buffer: number, start_row: number, start_col: number, end_row: number, end_col: number, replacement: string[], err?: unknown) => void;
    /**
     * Sets a buffer-scoped (b:) variable
     * @param buffer Buffer handle, or 0 for current buffer
     * @param name Variable name
     * @param value Variable value
     * @signature `nvim_buf_set_var({buffer}, {name}, {value}, {err})`
     */
    nvim_buf_set_var: (buffer: number, name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Calls many API methods atomically.
     * This has two main usages:
     * 1. To perform several requests from an async context
     *    atomically, i.e. without interleaving redraws, RPC requests
     *    from other clients, or user interactions (however API
     *    methods may trigger autocommands or event processing which
     *    have such side effects, e.g. |:sleep| may wake timers).
     * 2. To minimize RPC overhead (roundtrips) of a sequence of many
     *    requests.
     *
     * @param calls an array of calls, where each call is described
     *              by an array with two elements: the request name,
     *              and an array of arguments.
     * @returns Array of two elements. The first is an array of return
     *     values. The second is NIL if all calls succeeded. If a
     *     call resulted in an error, it is a three-element array
     *     with the zero-based index of the call which resulted in an
     *     error, the error type and the error message. If an error
     *     occurred, the values from all preceding calls will still
     *     be returned.
     * @signature `nvim_call_atomic({calls}, {err})`
     */
    nvim_call_atomic: (calls: unknown[], err?: unknown) => unknown[];
    /**
     * Calls a VimL |Dictionary-function| with the given arguments.
     * On execution error: fails with VimL error, does not update
     * v:errmsg.
     * @param dict Dictionary, or String evaluating to a VimL |self|
     *             dict
     * @param fn Name of the function defined on the VimL dict
     * @param args Function arguments packed in an Array
     * @returns Result of the function call
     * @signature `nvim_call_dict_function({dict}, {fn}, {args}, {err})`
     */
    nvim_call_dict_function: (dict: Record<string, unknown>, fn: string, args: unknown[], err?: unknown) => Record<string, unknown>;
    /**
     * Calls a VimL function with the given arguments.
     * On execution error: fails with VimL error, does not update
     * v:errmsg.
     * @param fn Function to call
     * @param args Function arguments packed in an Array
     * @returns Result of the function call
     * @signature `nvim_call_function({fn}, {args}, {err})`
     */
    nvim_call_function: (fn: string, args: unknown[], err?: unknown) => Record<string, unknown>;
    /**
     * Send data to channel `id`. For a job, it writes it to the
     * stdin of the process. For the stdio channel |channel-stdio|,
     * it writes to Nvim's stdout. For an internal terminal instance
     * (|nvim_open_term()|) it writes directly to terminal output.
     * See |channel-bytes| for more information.
     * This function writes raw data, not RPC messages. If the
     * channel was created with `rpc=true` then the channel expects
     * RPC messages, use |vim.rpcnotify()| and |vim.rpcrequest()|
     * instead.
     * @param chan id of the channel
     * @param data data to write. 8-bit clean: can contain NUL bytes.
     * @signature `nvim_chan_send({chan}, {data}, {err})`
     */
    nvim_chan_send: (chan: number, data: string, err?: unknown) => void;
    /**
     * Clear all autocommands that match the corresponding {opts}. To
     * delete a particular autocmd, see |nvim_del_autocmd|.
     * @param opts Parameters
     *             • event: (string|table) Examples:
     *               • event: "pat1"
     *               • event: { "pat1" }
     *               • event: { "pat1", "pat2", "pat3" }
     *
     *             • pattern: (string|table)
     *               • pattern or patterns to match exactly.
     *                 • For example, if you have `*.py` as that
     *                   pattern for the autocmd, you must pass
     *                   `*.py` exactly to clear it. `test.py` will
     *                   not match the pattern.
     *
     *               • defaults to clearing all patterns.
     *               • NOTE: Cannot be used with {buffer}
     *
     *             • buffer: (bufnr)
     *               • clear only |autocmd-buflocal| autocommands.
     *               • NOTE: Cannot be used with {pattern}
     *
     *             • group: (string|int) The augroup name or id.
     *               • NOTE: If not passed, will only delete autocmds not in any group.
     * @signature `nvim_clear_autocmds({opts}, {err})`
     */
    nvim_clear_autocmds: (opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Executes an ex-command.
     * On execution error: fails with VimL error, does not update
     * v:errmsg.
     * @param command Ex-command string
     * @signature `nvim_command({command}, {err})`
     * @reference |nvim_exec()|
     */
    nvim_command: (command: string, err?: unknown) => void;
    /**
     * Create or get an autocommand group |autocmd-groups|.
     * To get an existing group id, do: >
     *     local id = vim.api.nvim_create_augroup("MyGroup", {
     *         clear = false
     *     })
     *
     * <
     * @param name String: The name of the group
     * @param opts Dictionary Parameters
     *             • clear (bool) optional: defaults to true. Clear
     *               existing commands if the group already exists
     *               |autocmd-groups|.
     * @returns Integer id of the created group.
     * @signature `nvim_create_augroup({name}, {opts}, {err})`
     * @reference |autocmd-groups|
     */
    nvim_create_augroup: (name: string, opts?: Record<string, unknown>, err?: unknown) => number;
    /**
     * Create an |autocommand|
     * The API allows for two (mutually exclusive) types of actions
     * to be executed when the autocommand triggers: a callback
     * function (Lua or Vimscript), or a command (like regular
     * autocommands).
     * Example using callback: >
     *     -- Lua function
     *     local myluafun = function() print("This buffer enters") end
     *
     *     -- Vimscript function name (as a string)
     *     local myvimfun = "g:MyVimFunction"
     *
     *     vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
     *       pattern = {"*.c", "*.h"},
     *       callback = myluafun,  -- Or myvimfun
     *     })
     *
     * <
     * Example using command: >
     *     vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
     *       pattern = {"*.c", "*.h"},
     *       command = "echo 'Entering a C or C++ file'",
     *     })
     *
     * <
     * Example values for pattern: >
     *   pattern = "*.py"
     *   pattern = { "*.py", "*.pyi" }
     *
     * <
     * Example values for event: >
     *   "BufWritePre"
     *   {"CursorHold", "BufWritePre", "BufWritePost"}
     *
     * <
     * @param event (string|array) The event or events to register
     *              this autocommand
     * @param opts Dictionary of autocommand options:
     *              • group (string|integer) optional: the
     *                autocommand group name or id to match against.
     *              • pattern (string|array) optional: pattern or
     *                patterns to match against |autocmd-pattern|.
     *              • buffer (integer) optional: buffer number for
     *                buffer local autocommands |autocmd-buflocal|.
     *                Cannot be used with {pattern}.
     *              • desc (string) optional: description of the
     *                autocommand.
     *              • callback (function|string) optional: if a
     *                string, the name of a Vimscript function to
     *                call when this autocommand is triggered.
     *                Otherwise, a Lua function which is called when
     *                this autocommand is triggered. Cannot be used
     *                with {command}. Lua callbacks can return true
     *                to delete the autocommand; in addition, they
     *                accept a single table argument with the
     *                following keys:
     *                • id: (number) the autocommand id
     *                • event: (string) the name of the event that
     *                  triggered the autocommand |autocmd-events|
     *                • group: (number|nil) the autocommand group id,
     *                  if it exists
     *                • match: (string) the expanded value of
     *                  |<amatch>|
     *                • buf: (number) the expanded value of |<abuf>|
     *                • file: (string) the expanded value of
     *                  |<afile>|
     *
     *              • command (string) optional: Vim command to
     *                execute on event. Cannot be used with
     *                {callback}
     *              • once (boolean) optional: defaults to false. Run
     *                the autocommand only once |autocmd-once|.
     *              • nested (boolean) optional: defaults to false.
     *                Run nested autocommands |autocmd-nested|.
     * @returns Integer id of the created autocommand.
     * @signature `nvim_create_autocmd({event}, {opts}, {err})`
     * @reference |autocommand|
     * |nvim_del_autocmd()|
     */
    nvim_create_autocmd: (event: Record<string, unknown>, opts?: Record<string, unknown>, err?: unknown) => number;
    /**
     * Creates a new, empty, unnamed buffer.
     * @param listed Sets 'buflisted'
     * @param scratch Creates a "throwaway" |scratch-buffer| for
     *                temporary work (always 'nomodified'). Also sets
     *                'nomodeline' on the buffer.
     * @returns Buffer handle, or 0 on error
     * @signature `nvim_create_buf({listed}, {scratch}, {err})`
     * @reference buf_open_scratch
     */
    nvim_create_buf: (listed: boolean, scratch: boolean, err?: unknown) => number;
    /**
     * Creates a new *namespace* or gets an existing one.
     * Namespaces are used for buffer highlights and virtual text,
     * see |nvim_buf_add_highlight()| and |nvim_buf_set_extmark()|.
     * Namespaces can be named or anonymous. If `name` matches an
     * existing namespace, the associated id is returned. If `name`
     * is an empty string a new, anonymous namespace is created.
     * @param name Namespace name or empty string
     * @returns Namespace id
     * @signature `nvim_create_namespace({name})`
     */
    nvim_create_namespace: (name: string) => number;
    /**
     * Create a new user command |user-commands|
     * {name} is the name of the new command. The name must begin
     * with an uppercase letter.
     * {command} is the replacement text or Lua function to execute.
     * Example: >
     *    :call nvim_create_user_command('SayHello', 'echo "Hello world!"', {})
     *    :SayHello
     *    Hello world!
     *
     * <
     * @param name Name of the new user command. Must begin with
     *                an uppercase letter.
     * @param command Replacement command to execute when this user
     *                command is executed. When called from Lua, the
     *                command can also be a Lua function. The
     *                function is called with a single table argument
     *                that contains the following keys:
     *                • args: (string) The args passed to the
     *                  command, if any |<args>|
     *                • fargs: (table) The args split by unescaped
     *                  whitespace (when more than one argument is
     *                  allowed), if any |<f-args>|
     *                • bang: (boolean) "true" if the command was
     *                  executed with a ! modifier |<bang>|
     *                • line1: (number) The starting line of the
     *                  command range |<line1>|
     *                • line2: (number) The final line of the command
     *                  range |<line2>|
     *                • range: (number) The number of items in the
     *                  command range: 0, 1, or 2 |<range>|
     *                • count: (number) Any count supplied |<count>|
     *                • reg: (string) The optional register, if
     *                  specified |<reg>|
     *                • mods: (string) Command modifiers, if any
     *                  |<mods>|
     * @param opts Optional command attributes. See
     *                |command-attributes| for more details. To use
     *                boolean attributes (such as |:command-bang| or
     *                |:command-bar|) set the value to "true". In
     *                addition to the string options listed in
     *                |:command-complete|, the "complete" key also
     *                accepts a Lua function which works like the
     *                "customlist" completion mode
     *                |:command-completion-customlist|. Additional
     *                parameters:
     *                • desc: (string) Used for listing the command
     *                  when a Lua function is used for {command}.
     *                • force: (boolean, default true) Override any
     *                  previous definition.
     * @signature `nvim_create_user_command({name}, {command}, {opts}, {err})`
     */
    nvim_create_user_command: (name: string, command: Record<string, unknown>, opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Delete an autocommand group by id.
     * To get a group id one can use |nvim_get_autocmds()|.
     * NOTE: behavior differs from |augroup-delete|. When deleting a
     * group, autocommands contained in this group will also be
     * deleted and cleared. This group will no longer exist.
     * @param id Integer The id of the group.
     * @signature `nvim_del_augroup_by_id({id}, {err})`
     * @reference |nvim_del_augroup_by_name()|
     * |nvim_create_augroup()|
     */
    nvim_del_augroup_by_id: (id: number, err?: unknown) => void;
    /**
     * Delete an autocommand group by name.
     * NOTE: behavior differs from |augroup-delete|. When deleting a
     * group, autocommands contained in this group will also be
     * deleted and cleared. This group will no longer exist.
     * @param name String The name of the group.
     * @signature `nvim_del_augroup_by_name({name}, {err})`
     * @reference |autocommand-groups|
     */
    nvim_del_augroup_by_name: (name: string, err?: unknown) => void;
    /**
     * Delete an autocommand by id.
     * NOTE: Only autocommands created via the API have an id.
     * @param id Integer The id returned by nvim_create_autocmd
     * @signature `nvim_del_autocmd({id}, {err})`
     * @reference |nvim_create_autocmd()|
     */
    nvim_del_autocmd: (id: number, err?: unknown) => void;
    /**
     * Deletes the current line.
     * @signature `nvim_del_current_line({err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_del_current_line: (err?: unknown) => void;
    /**
     * Unmaps a global |mapping| for the given mode.
     * To unmap a buffer-local mapping, use |nvim_buf_del_keymap()|.
     * @signature `nvim_del_keymap({mode}, {lhs}, {err})`
     * @reference |nvim_set_keymap()|
     */
    nvim_del_keymap: (mode: string, lhs: string, err?: unknown) => void;
    /**
     * Deletes an uppercase/file named mark. See |mark-motions|.
     *
     * Note:
     *     fails with error if a lowercase or buffer local named mark
     *     is used.
     *
     * @param name Mark name
     * @returns true if the mark was deleted, else false.
     * @signature `nvim_del_mark({name}, {err})`
     * @reference |nvim_buf_del_mark()|
     * |nvim_get_mark()|
     */
    nvim_del_mark: (name: string, err?: unknown) => boolean;
    /**
     * Delete a user-defined command.
     * @param name Name of the command to delete.
     * @signature `nvim_del_user_command({name}, {err})`
     */
    nvim_del_user_command: (name: string, err?: unknown) => void;
    /**
     * Removes a global (g:) variable.
     * @param name Variable name
     * @signature `nvim_del_var({name}, {err})`
     */
    nvim_del_var: (name: string, err?: unknown) => void;
    /**
     * Echo a message.
     * @param chunks A list of [text, hl_group] arrays, each
     *                representing a text chunk with specified
     *                highlight. `hl_group` element can be omitted
     *                for no highlight.
     * @param history if true, add to |message-history|.
     * @param opts Optional parameters. Reserved for future use.
     * @signature `nvim_echo({chunks}, {history}, {opts}, {err})`
     */
    nvim_echo: (chunks: unknown[], history: boolean, opts: Record<string, unknown>, err?: unknown) => void;
    /**
     * Writes a message to the Vim error buffer. Does not append
     * "\n", the message is buffered (won't display) until a linefeed
     * is written.
     * @param str Message
     * @signature `nvim_err_write({str})`
     */
    nvim_err_write: (str: string) => void;
    /**
     * Writes a message to the Vim error buffer. Appends "\n", so the
     * buffer is flushed (and displayed).
     * @param str Message
     * @signature `nvim_err_writeln({str})`
     * @reference nvim_err_write()
     */
    nvim_err_writeln: (str: string) => void;
    /**
     * Evaluates a VimL |expression|. Dictionaries and Lists are
     * recursively expanded.
     * On execution error: fails with VimL error, does not update
     * v:errmsg.
     * @param expr VimL expression string
     * @returns Evaluation result or expanded object
     * @signature `nvim_eval({expr}, {err})`
     */
    nvim_eval: (expr: string, err?: unknown) => Record<string, unknown>;
    /**
     * Evaluates statusline string.
     * @param str Statusline string (see 'statusline').
     * @param opts Optional parameters.
     *             • winid: (number) |window-ID| of the window to use
     *               as context for statusline.
     *             • maxwidth: (number) Maximum width of statusline.
     *             • fillchar: (string) Character to fill blank
     *               spaces in the statusline (see 'fillchars').
     *               Treated as single-width even if it isn't.
     *             • highlights: (boolean) Return highlight
     *               information.
     *             • use_tabline: (boolean) Evaluate tabline instead
     *               of statusline. When |TRUE|, {winid} is ignored.
     * @returns Dictionary containing statusline information, with these
     *     keys:
     *     • str: (string) Characters that will be displayed on the
     *       statusline.
     *     • width: (number) Display width of the statusline.
     *     • highlights: Array containing highlight information of
     *       the statusline. Only included when the "highlights" key
     *       in {opts} is |TRUE|. Each element of the array is a
     *       |Dictionary| with these keys:
     *       • start: (number) Byte index (0-based) of first
     *         character that uses the highlight.
     *       • group: (string) Name of highlight group.
     *
     *
     * @signature `nvim_eval_statusline({str}, {opts}, {err})`
     * @annotations {fast}
     */
    nvim_eval_statusline: (str: string, opts?: Record<string, unknown>, err?: unknown) => Record<string, unknown>;
    /**
     * Executes Vimscript (multiline block of Ex-commands), like
     * anonymous |:source|.
     * Unlike |nvim_command()| this function supports heredocs,
     * script-scope (s:), etc.
     * On execution error: fails with VimL error, does not update
     * v:errmsg.
     * @param src Vimscript code
     * @param output Capture and return all (non-error, non-shell
     *               |:!|) output
     * @returns Output (non-error, non-shell |:!|) if `output` is true,
     *     else empty string.
     * @signature `nvim_exec({src}, {output}, {err})`
     * @reference |execute()|
     * |nvim_command()|
     */
    nvim_exec: (src: string, output: boolean, err?: unknown) => string;
    /**
     * Execute all autocommands for {event} that match the
     * corresponding {opts} |autocmd-execute|.
     * @param event (String|Array) The event or events to execute
     * @param opts Dictionary of autocommand options:
     *              • group (string|integer) optional: the
     *                autocommand group name or id to match against.
     *                |autocmd-groups|.
     *              • pattern (string|array) optional: defaults to
     *                "*" |autocmd-pattern|. Cannot be used with
     *                {buffer}.
     *              • buffer (integer) optional: buffer number
     *                |autocmd-buflocal|. Cannot be used with
     *                {pattern}.
     *              • modeline (bool) optional: defaults to true.
     *                Process the modeline after the autocommands
     *                |<nomodeline>|.
     * @signature `nvim_exec_autocmds({event}, {opts}, {err})`
     * @reference |:doautocmd|
     */
    nvim_exec_autocmds: (event: Record<string, unknown>, opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Execute Lua code. Parameters (if any) are available as `...`
     * inside the chunk. The chunk can return a value.
     * Only statements are executed. To evaluate an expression,
     * prefix it with `return`: return my_function(...)
     * @param code Lua code to execute
     * @param args Arguments to the code
     * @returns Return value of Lua code if present or NIL.
     * @signature `nvim_exec_lua({code}, {args}, {err})`
     */
    nvim_exec_lua: (code: string, args: unknown[], err?: unknown) => Record<string, unknown>;
    /**
     * Sends input-keys to Nvim, subject to various quirks controlled
     * by `mode` flags. This is a blocking call, unlike
     * |nvim_input()|.
     * On execution error: does not fail, but updates v:errmsg.
     * To input sequences like <C-o> use |nvim_replace_termcodes()|
     * (typically with escape_ks=false) to replace |keycodes|, then
     * pass the result to nvim_feedkeys().
     * Example: >
     *     :let key = nvim_replace_termcodes("<C-o>", v:true, v:false, v:true)
     *     :call nvim_feedkeys(key, 'n', v:false)
     *
     * <
     * @param keys to be typed
     * @param mode behavior flags, see |feedkeys()|
     * @param escape_ks If true, escape K_SPECIAL bytes in `keys`
     *                  This should be false if you already used
     *                  |nvim_replace_termcodes()|, and true
     *                  otherwise.
     * @signature `nvim_feedkeys({keys}, {mode}, {escape_ks})`
     * @reference feedkeys()
     * vim_strsave_escape_ks
     */
    nvim_feedkeys: (keys: string, mode: string, escape_ks: boolean) => void;
    /**
     * Gets the option information for all options.
     * The dictionary has the full option names as keys and option
     * metadata dictionaries as detailed at |nvim_get_option_info|.
     * @returns dictionary of all options
     * @signature `nvim_get_all_options_info({err})`
     */
    nvim_get_all_options_info: (err?: unknown) => Record<string, unknown>;
    /**
     * Returns a 2-tuple (Array), where item 0 is the current channel
     * id and item 1 is the |api-metadata| map (Dictionary).
     * @returns 2-tuple [{channel-id}, {api-metadata}]
     * @signature `nvim_get_api_info()`
     * @annotations {fast}
     */
    nvim_get_api_info: () => unknown[];
    /**
     * Get all autocommands that match the corresponding {opts}.
     * These examples will get autocommands matching ALL the given
     * criteria: >
     *   -- Matches all criteria
     *   autocommands = vim.api.nvim_get_autocmds({
     *     group = "MyGroup",
     *     event = {"BufEnter", "BufWinEnter"},
     *     pattern = {"*.c", "*.h"}
     *   })
     *
     *   -- All commands from one group
     *   autocommands = vim.api.nvim_get_autocmds({
     *     group = "MyGroup",
     *   })
     *
     * <
     * NOTE: When multiple patterns or events are provided, it will
     * find all the autocommands that match any combination of them.
     * @param opts Dictionary with at least one of the following:
     *             • group (string|integer): the autocommand group
     *               name or id to match against.
     *             • event (string|array): event or events to match
     *               against |autocmd-events|.
     *             • pattern (string|array): pattern or patterns to
     *               match against |autocmd-pattern|.
     * @returns Array of autocommands matching the criteria, with each
     *     item containing the following fields:
     *     • id (number): the autocommand id (only when defined with
     *       the API).
     *     • group (integer): the autocommand group id.
     *     • group_name (string): the autocommand group name.
     *     • desc (string): the autocommand description.
     *     • event (string): the autocommand event.
     *     • command (string): the autocommand command.
     *     • once (boolean): whether the autocommand is only run
     *       once.
     *     • pattern (string): the autocommand pattern. If the
     *       autocommand is buffer local |autocmd-buffer-local|:
     *     • buflocal (boolean): true if the autocommand is buffer
     *       local.
     *     • buffer (number): the buffer number.
     *
     * @signature `nvim_get_autocmds({opts}, {err})`
     */
    nvim_get_autocmds: (opts?: Record<string, unknown>, err?: unknown) => unknown[];
    /**
     * Gets information about a channel.
     * @returns Dictionary describing a channel, with these keys:
     *     • "id" Channel id.
     *     • "argv" (optional) Job arguments list.
     *     • "stream" Stream underlying the channel.
     *       • "stdio" stdin and stdout of this Nvim instance
     *       • "stderr" stderr of this Nvim instance
     *       • "socket" TCP/IP socket or named pipe
     *       • "job" Job with communication over its stdio.
     *
     *     • "mode" How data received on the channel is interpreted.
     *       • "bytes" Send and receive raw bytes.
     *       • "terminal" |terminal| instance interprets ASCII
     *         sequences.
     *       • "rpc" |RPC| communication on the channel is active.
     *
     *     • "pty" (optional) Name of pseudoterminal. On a POSIX
     *       system this is a device path like "/dev/pts/1". If the
     *       name is unknown, the key will still be present if a pty
     *       is used (e.g. for winpty on Windows).
     *     • "buffer" (optional) Buffer with connected |terminal|
     *       instance.
     *     • "client" (optional) Info about the peer (client on the
     *       other end of the RPC channel), if provided by it via
     *       |nvim_set_client_info()|.
     *
     * @signature `nvim_get_chan_info({chan}, {err})`
     */
    nvim_get_chan_info: (chan: number, err?: unknown) => Record<string, unknown>;
    /**
     * Returns the 24-bit RGB value of a |nvim_get_color_map()| color
     * name or "#rrggbb" hexadecimal string.
     * Example: >
     *     :echo nvim_get_color_by_name("Pink")
     *     :echo nvim_get_color_by_name("#cbcbcb")
     *
     * <
     * @param name Color name or "#rrggbb" string
     * @returns 24-bit RGB value, or -1 for invalid argument.
     * @signature `nvim_get_color_by_name({name})`
     */
    nvim_get_color_by_name: (name: string) => number;
    /**
     * Returns a map of color names and RGB values.
     * Keys are color names (e.g. "Aqua") and values are 24-bit RGB
     * color values (e.g. 65535).
     * @returns Map of color names and RGB values.
     * @signature `nvim_get_color_map()`
     */
    nvim_get_color_map: () => Record<string, unknown>;
    /**
     * Gets a map of global (non-buffer-local) Ex commands.
     * Currently only |user-commands| are supported, not builtin Ex
     * commands.
     * @param opts Optional parameters. Currently only supports
     *             {"builtin":false}
     * @returns Map of maps describing commands.
     * @signature `nvim_get_commands({opts}, {err})`
     */
    nvim_get_commands: (opts?: Record<string, unknown>, err?: unknown) => Record<string, unknown>;
    /**
     * Gets a map of the current editor state.
     * @param opts Optional parameters.
     *             • types: List of |context-types| ("regs", "jumps",
     *               "bufs", "gvars", …) to gather, or empty for
     *               "all".
     * @returns map of global |context|.
     * @signature `nvim_get_context({opts}, {err})`
     */
    nvim_get_context: (opts?: Record<string, unknown>, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the current buffer.
     * @returns Buffer handle
     * @signature `nvim_get_current_buf()`
     */
    nvim_get_current_buf: () => number;
    /**
     * Gets the current line.
     * @returns Current line string
     * @signature `nvim_get_current_line({err})`
     */
    nvim_get_current_line: (err?: unknown) => string;
    /**
     * Gets the current tabpage.
     * @returns Tabpage handle
     * @signature `nvim_get_current_tabpage()`
     */
    nvim_get_current_tabpage: () => number;
    /**
     * Gets the current window.
     * @returns Window handle
     * @signature `nvim_get_current_win()`
     */
    nvim_get_current_win: () => number;
    /**
     * Gets a highlight definition by id. |hlID()|
     * @param hl_id Highlight id as returned by |hlID()|
     * @param rgb Export RGB colors
     * @returns Highlight definition map
     * @signature `nvim_get_hl_by_id({hl_id}, {rgb}, {err})`
     * @reference nvim_get_hl_by_name
     */
    nvim_get_hl_by_id: (hl_id: number, rgb: boolean, err?: unknown) => Record<string, unknown>;
    /**
     * Gets a highlight definition by name.
     * @param name Highlight group name
     * @param rgb Export RGB colors
     * @returns Highlight definition map
     * @signature `nvim_get_hl_by_name({name}, {rgb}, {err})`
     * @reference nvim_get_hl_by_id
     */
    nvim_get_hl_by_name: (name: string, rgb: boolean, err?: unknown) => Record<string, unknown>;
    /**
     * Gets a highlight group by name
     * similar to |hlID()|, but allocates a new ID if not present.
     * @signature `nvim_get_hl_id_by_name({name})`
     */
    nvim_get_hl_id_by_name: (name: string) => number;
    /**
     * Gets a list of global (non-buffer-local) |mapping|
     * definitions.
     * @param mode Mode short-name ("n", "i", "v", ...)
     * @returns Array of maparg()-like dictionaries describing mappings.
     *     The "buffer" key is always zero.
     * @signature `nvim_get_keymap({mode})`
     */
    nvim_get_keymap: (mode: string) => Record<string, unknown>[];
    /**
     * Return a tuple (row, col, buffer, buffername) representing the
     * position of the uppercase/file named mark. See |mark-motions|.
     * Marks are (1,0)-indexed. |api-indexing|
     *
     * Note:
     *     fails with error if a lowercase or buffer local named mark
     *     is used.
     *
     * @param name Mark name
     * @param opts Optional parameters. Reserved for future use.
     * @returns 4-tuple (row, col, buffer, buffername), (0, 0, 0, '') if
     *     the mark is not set.
     * @signature `nvim_get_mark({name}, {opts}, {err})`
     * @reference |nvim_buf_set_mark()|
     * |nvim_del_mark()|
     */
    nvim_get_mark: (name: string, opts: Record<string, unknown>, err?: unknown) => unknown[];
    /**
     * Gets the current mode. |mode()| "blocking" is true if Nvim is
     * waiting for input.
     * @returns Dictionary { "mode": String, "blocking": Boolean }
     * @signature `nvim_get_mode()`
     * @annotations {fast}
     */
    nvim_get_mode: () => Record<string, unknown>;
    /**
     * Gets existing, non-anonymous namespaces.
     * @returns dict that maps from names to namespace ids.
     * @signature `nvim_get_namespaces()`
     */
    nvim_get_namespaces: () => Record<string, unknown>;
    /**
     * Gets the global value of an option.
     * @param name Option name
     * @returns Option value (global)
     * @signature `nvim_get_option({name}, {err})`
     */
    nvim_get_option: (name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the option information for one option
     * Resulting dictionary has keys:
     * • name: Name of the option (like 'filetype')
     * • shortname: Shortened name of the option (like 'ft')
     * • type: type of option ("string", "number" or "boolean")
     * • default: The default value for the option
     * • was_set: Whether the option was set.
     * • last_set_sid: Last set script id (if any)
     * • last_set_linenr: line number where option was set
     * • last_set_chan: Channel where option was set (0 for local)
     * • scope: one of "global", "win", or "buf"
     * • global_local: whether win or buf option has a global value
     * • commalist: List of comma separated values
     * • flaglist: List of single char flags
     *
     * @param name Option name
     * @returns Option Information
     * @signature `nvim_get_option_info({name}, {err})`
     */
    nvim_get_option_info: (name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the value of an option. The behavior of this function
     * matches that of |:set|: the local value of an option is
     * returned if it exists; otherwise, the global value is
     * returned. Local values always correspond to the current buffer
     * or window. To get a buffer-local or window-local option for a
     * specific buffer or window, use |nvim_buf_get_option()| or
     * |nvim_win_get_option()|.
     * @param name Option name
     * @param opts Optional parameters
     *             • scope: One of 'global' or 'local'. Analogous to
     *               |:setglobal| and |:setlocal|, respectively.
     * @returns Option value
     * @signature `nvim_get_option_value({name}, {opts}, {err})`
     */
    nvim_get_option_value: (name: string, opts?: Record<string, unknown>, err?: unknown) => Record<string, unknown>;
    /**
     * Gets info describing process `pid`.
     * @returns Map of process properties, or NIL if process not found.
     * @signature `nvim_get_proc({pid}, {err})`
     */
    nvim_get_proc: (pid: number, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the immediate children of process `pid`.
     * @returns Array of child process ids, empty if process not found.
     * @signature `nvim_get_proc_children({pid}, {err})`
     */
    nvim_get_proc_children: (pid: number, err?: unknown) => unknown[];
    /**
     * Find files in runtime directories
     * 'name' can contain wildcards. For example
     * nvim_get_runtime_file("colors/*.vim", true) will return all
     * color scheme files. Always use forward slashes (/) in the
     * search pattern for subdirectories regardless of platform.
     * It is not an error to not find any files. An empty array is
     * returned then.
     * @param name pattern of files to search for
     * @param all whether to return all matches or only the first
     * @returns list of absolute paths to the found files
     * @signature `nvim_get_runtime_file({name}, {all}, {err})`
     * @annotations {fast}
     */
    nvim_get_runtime_file: (name: string, all: boolean, err?: unknown) => string[];
    /**
     * Gets a global (g:) variable.
     * @param name Variable name
     * @returns Variable value
     * @signature `nvim_get_var({name}, {err})`
     */
    nvim_get_var: (name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets a v: variable.
     * @param name Variable name
     * @returns Variable value
     * @signature `nvim_get_vvar({name}, {err})`
     */
    nvim_get_vvar: (name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Queues raw user-input. Unlike |nvim_feedkeys()|, this uses a
     * low-level input buffer and the call is non-blocking (input is
     * processed asynchronously by the eventloop).
     * On execution error: does not fail, but updates v:errmsg.
     *
     * Note:
     *     |keycodes| like <CR> are translated, so "<" is special. To
     *     input a literal "<", send <LT>.
     *
     * Note:
     *     For mouse events use |nvim_input_mouse()|. The pseudokey
     *     form "<LeftMouse><col,row>" is deprecated since
     *     |api-level| 6.
     *
     * @param keys to be typed
     * @returns Number of bytes actually written (can be fewer than
     *     requested if the buffer becomes full).
     * @signature `nvim_input({keys})`
     * @annotations {fast}
     */
    nvim_input: (keys: string) => number;
    /**
     * Send mouse event from GUI.
     * Non-blocking: does not wait on any result, but queues the
     * event to be processed soon by the event loop.
     *
     * Note:
     *     Currently this doesn't support "scripting" multiple mouse
     *     events by calling it multiple times in a loop: the
     *     intermediate mouse positions will be ignored. It should be
     *     used to implement real-time mouse input in a GUI. The
     *     deprecated pseudokey form ("<LeftMouse><col,row>") of
     *     |nvim_input()| has the same limitation.
     *
     * @param button Mouse button: one of "left", "right",
     *                 "middle", "wheel".
     * @param action For ordinary buttons, one of "press", "drag",
     *                 "release". For the wheel, one of "up", "down",
     *                 "left", "right".
     * @param modifier String of modifiers each represented by a
     *                 single char. The same specifiers are used as
     *                 for a key press, except that the "-" separator
     *                 is optional, so "C-A-", "c-a" and "CA" can all
     *                 be used to specify Ctrl+Alt+click.
     * @param grid Grid number if the client uses |ui-multigrid|,
     *                 else 0.
     * @param row Mouse row-position (zero-based, like redraw
     *                 events)
     * @param col Mouse column-position (zero-based, like redraw
     *                 events)
     * @signature `nvim_input_mouse({button}, {action}, {modifier}, {grid}, {row}, {col}, {err})`
     * @annotations {fast}
     */
    nvim_input_mouse: (button: string, action: string, modifier: string, grid: number, row: number, col: number, err?: unknown) => void;
    /**
     * Gets the current list of buffer handles
     * Includes unlisted (unloaded/deleted) buffers, like `:ls!`. Use
     * |nvim_buf_is_loaded()| to check if a buffer is loaded.
     * @returns List of buffer handles
     * @signature `nvim_list_bufs()`
     */
    nvim_list_bufs: () => number[];
    /**
     * Get information about all open channels.
     * @returns Array of Dictionaries, each describing a channel with the
     *     format specified at |nvim_get_chan_info()|.
     * @signature `nvim_list_chans()`
     */
    nvim_list_chans: () => unknown[];
    /**
     * Gets the paths contained in 'runtimepath'.
     * @returns List of paths
     * @signature `nvim_list_runtime_paths({err})`
     */
    nvim_list_runtime_paths: (err?: unknown) => string[];
    /**
     * Gets the current list of tabpage handles.
     * @returns List of tabpage handles
     * @signature `nvim_list_tabpages()`
     */
    nvim_list_tabpages: () => number[];
    /**
     * Gets a list of dictionaries representing attached UIs.
     * @returns Array of UI dictionaries, each with these keys:
     *     • "height" Requested height of the UI
     *     • "width" Requested width of the UI
     *     • "rgb" true if the UI uses RGB colors (false implies
     *       |cterm-colors|)
     *     • "ext_..." Requested UI extensions, see |ui-option|
     *     • "chan" Channel id of remote UI (not present for TUI)
     *
     * @signature `nvim_list_uis()`
     */
    nvim_list_uis: () => unknown[];
    /**
     * Gets the current list of window handles.
     * @returns List of window handles
     * @signature `nvim_list_wins()`
     */
    nvim_list_wins: () => number[];
    /**
     * Sets the current editor state from the given |context| map.
     * @param dict |Context| map.
     * @signature `nvim_load_context({dict})`
     */
    nvim_load_context: (dict: Record<string, unknown>) => Record<string, unknown>;
    /**
     * Notify the user with a message
     * Relays the call to vim.notify . By default forwards your
     * message in the echo area but can be overridden to trigger
     * desktop notifications.
     * @param msg Message to display to the user
     * @param log_level The log level
     * @param opts Reserved for future use.
     * @signature `nvim_notify({msg}, {log_level}, {opts}, {err})`
     */
    nvim_notify: (msg: string, log_level: number, opts: Record<string, unknown>, err?: unknown) => Record<string, unknown>;
    /**
     * Open a terminal instance in a buffer
     * By default (and currently the only option) the terminal will
     * not be connected to an external process. Instead, input send
     * on the channel will be echoed directly by the terminal. This
     * is useful to display ANSI terminal sequences returned as part
     * of a rpc message, or similar.
     * Note: to directly initiate the terminal using the right size,
     * display the buffer in a configured window before calling this.
     * For instance, for a floating display, first create an empty
     * buffer using |nvim_create_buf()|, then display it using
     * |nvim_open_win()|, and then call this function. Then
     * |nvim_chan_send()| can be called immediately to process
     * sequences in a virtual terminal having the intended size.
     * @param buffer the buffer to use (expected to be empty)
     * @param opts Optional parameters.
     *               • on_input: lua callback for input sent, i e
     *                 keypresses in terminal mode. Note: keypresses
     *                 are sent raw as they would be to the pty
     *                 master end. For instance, a carriage return is
     *                 sent as a "\r", not as a "\n". |textlock|
     *                 applies. It is possible to call
     *                 |nvim_chan_send| directly in the callback
     *                 however. ["input", term, bufnr, data]
     * @returns Channel id, or 0 on error
     * @signature `nvim_open_term({buffer}, {opts}, {err})`
     */
    nvim_open_term: (buffer: number, opts: Record<string, unknown>, err?: unknown) => number;
    /**
     * Open a new window.
     * Currently this is used to open floating and external windows.
     * Floats are windows that are drawn above the split layout, at
     * some anchor position in some other window. Floats can be drawn
     * internally or by external GUI with the |ui-multigrid|
     * extension. External windows are only supported with multigrid
     * GUIs, and are displayed as separate top-level windows.
     * For a general overview of floats, see |api-floatwin|.
     * Exactly one of `external` and `relative` must be specified.
     * The `width` and `height` of the new window must be specified.
     * With relative=editor (row=0,col=0) refers to the top-left
     * corner of the screen-grid and (row=Lines-1,col=Columns-1)
     * refers to the bottom-right corner. Fractional values are
     * allowed, but the builtin implementation (used by non-multigrid
     * UIs) will always round down to nearest integer.
     * Out-of-bounds values, and configurations that make the float
     * not fit inside the main editor, are allowed. The builtin
     * implementation truncates values so floats are fully within the
     * main screen grid. External GUIs could let floats hover outside
     * of the main window like a tooltip, but this should not be used
     * to specify arbitrary WM screen positions.
     * Example (Lua): window-relative float >
     *     vim.api.nvim_open_win(0, false,
     *       {relative='win', row=3, col=3, width=12, height=3})
     *
     * <
     * Example (Lua): buffer-relative float (travels as buffer is
     * scrolled) >
     *     vim.api.nvim_open_win(0, false,
     *       {relative='win', width=12, height=3, bufpos={100,10}})
     *
     * <
     * @param buffer Buffer to display, or 0 for current buffer
     * @param enter Enter the window (make it the current window)
     * @param config Map defining the window configuration. Keys:
     *               • relative: Sets the window layout to
     *                 "floating", placed at (row,col) coordinates
     *                 relative to:
     *                 • "editor" The global editor grid
     *                 • "win" Window given by the `win` field, or
     *                   current window.
     *                 • "cursor" Cursor position in current window.
     *
     *               • win: |window-ID| for relative="win".
     *               • anchor: Decides which corner of the float to
     *                 place at (row,col):
     *                 • "NW" northwest (default)
     *                 • "NE" northeast
     *                 • "SW" southwest
     *                 • "SE" southeast
     *
     *               • width: Window width (in character cells).
     *                 Minimum of 1.
     *               • height: Window height (in character cells).
     *                 Minimum of 1.
     *               • bufpos: Places float relative to buffer text
     *                 (only when relative="win"). Takes a tuple of
     *                 zero-indexed [line, column]. `row` and `col` if given are applied relative to this
     *                 position, else they default to:
     *                 • `row=1` and `col=0` if `anchor` is "NW" or
     *                   "NE"
     *                 • `row=0` and `col=0` if `anchor` is "SW" or
     *                   "SE" (thus like a tooltip near the buffer
     *                   text).
     *
     *               • row: Row position in units of "screen cell
     *                 height", may be fractional.
     *               • col: Column position in units of "screen cell
     *                 width", may be fractional.
     *               • focusable: Enable focus by user actions
     *                 (wincmds, mouse events). Defaults to true.
     *                 Non-focusable windows can be entered by
     *                 |nvim_set_current_win()|.
     *               • external: GUI should display the window as an
     *                 external top-level window. Currently accepts
     *                 no other positioning configuration together
     *                 with this.
     *               • zindex: Stacking order. floats with higher `zindex` go on top on floats with lower indices. Must
     *                 be larger than zero. The following screen
     *                 elements have hard-coded z-indices:
     *                 • 100: insert completion popupmenu
     *                 • 200: message scrollback
     *                 • 250: cmdline completion popupmenu (when
     *                   wildoptions+=pum) The default value for
     *                   floats are 50. In general, values below 100
     *                   are recommended, unless there is a good
     *                   reason to overshadow builtin elements.
     *
     *               • style: Configure the appearance of the window.
     *                 Currently only takes one non-empty value:
     *                 • "minimal" Nvim will display the window with
     *                   many UI options disabled. This is useful
     *                   when displaying a temporary float where the
     *                   text should not be edited. Disables
     *                   'number', 'relativenumber', 'cursorline',
     *                   'cursorcolumn', 'foldcolumn', 'spell' and
     *                   'list' options. 'signcolumn' is changed to
     *                   `auto` and 'colorcolumn' is cleared. The
     *                   end-of-buffer region is hidden by setting
     *                   `eob` flag of 'fillchars' to a space char,
     *                   and clearing the |EndOfBuffer| region in
     *                   'winhighlight'.
     *
     *               • border: Style of (optional) window border.
     *                 This can either be a string or an array. The
     *                 string values are
     *                 • "none": No border (default).
     *                 • "single": A single line box.
     *                 • "double": A double line box.
     *                 • "rounded": Like "single", but with rounded
     *                   corners ("╭" etc.).
     *                 • "solid": Adds padding by a single whitespace
     *                   cell.
     *                 • "shadow": A drop shadow effect by blending
     *                   with the background.
     *                 • If it is an array, it should have a length
     *                   of eight or any divisor of eight. The array
     *                   will specifify the eight chars building up
     *                   the border in a clockwise fashion starting
     *                   with the top-left corner. As an example, the
     *                   double box style could be specified as [
     *                   "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" ]. If
     *                   the number of chars are less than eight,
     *                   they will be repeated. Thus an ASCII border
     *                   could be specified as [ "/", "-", "\\", "|"
     *                   ], or all chars the same as [ "x" ]. An
     *                   empty string can be used to turn off a
     *                   specific border, for instance, [ "", "", "",
     *                   ">", "", "", "", "<" ] will only make
     *                   vertical borders but not horizontal ones. By
     *                   default, `FloatBorder` highlight is used,
     *                   which links to `WinSeparator` when not
     *                   defined. It could also be specified by
     *                   character: [ {"+", "MyCorner"}, {"x",
     *                   "MyBorder"} ].
     *
     *               • noautocmd: If true then no buffer-related
     *                 autocommand events such as |BufEnter|,
     *                 |BufLeave| or |BufWinEnter| may fire from
     *                 calling this function.
     * @returns Window handle, or 0 on error
     * @signature `nvim_open_win({buffer}, {enter}, {config}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_open_win: (buffer: number, enter: boolean, config?: Record<string, unknown>, err?: unknown) => number;
    /**
     * Writes a message to the Vim output buffer. Does not append
     * "\n", the message is buffered (won't display) until a linefeed
     * is written.
     * @param str Message
     * @signature `nvim_out_write({str})`
     */
    nvim_out_write: (str: string) => void;
    /**
     * Parse a VimL expression.
     * @param expr Expression to parse. Always treated as a
     *                  single line.
     * @param flags Flags:
     *                  • "m" if multiple expressions in a row are
     *                    allowed (only the first one will be
     *                    parsed),
     *                  • "E" if EOC tokens are not allowed
     *                    (determines whether they will stop parsing
     *                    process or be recognized as an
     *                    operator/space, though also yielding an
     *                    error).
     *                  • "l" when needing to start parsing with
     *                    lvalues for ":let" or ":for". Common flag
     *                    sets:
     *                  • "m" to parse like for ":echo".
     *                  • "E" to parse like for "<C-r>=".
     *                  • empty string for ":call".
     *                  • "lm" to parse for ":let".
     * @param highlight If true, return value will also include
     *                  "highlight" key containing array of 4-tuples
     *                  (arrays) (Integer, Integer, Integer, String),
     *                  where first three numbers define the
     *                  highlighted region and represent line,
     *                  starting column and ending column (latter
     *                  exclusive: one should highlight region
     *                  [start_col, end_col)).
     * @returns
     *     • AST: top-level dictionary with these keys:
     *       • "error": Dictionary with error, present only if parser
     *         saw some error. Contains the following keys:
     *         • "message": String, error message in printf format,
     *           translated. Must contain exactly one "%.*s".
     *         • "arg": String, error message argument.
     *
     *       • "len": Amount of bytes successfully parsed. With flags
     *         equal to "" that should be equal to the length of expr
     *         string. (“Successfully parsed” here means
     *         “participated in AST creation”, not “till the first
     *         error”.)
     *       • "ast": AST, either nil or a dictionary with these
     *         keys:
     *         • "type": node type, one of the value names from
     *           ExprASTNodeType stringified without "kExprNode"
     *           prefix.
     *         • "start": a pair [line, column] describing where node
     *           is "started" where "line" is always 0 (will not be 0
     *           if you will be using nvim_parse_viml() on e.g.
     *           ":let", but that is not present yet). Both elements
     *           are Integers.
     *         • "len": “length” of the node. This and "start" are
     *           there for debugging purposes primary (debugging
     *           parser and providing debug information).
     *         • "children": a list of nodes described in top/"ast".
     *           There always is zero, one or two children, key will
     *           not be present if node has no children. Maximum
     *           number of children may be found in node_maxchildren
     *           array.
     *
     *
     *     • Local values (present only for certain nodes):
     *       • "scope": a single Integer, specifies scope for
     *         "Option" and "PlainIdentifier" nodes. For "Option" it
     *         is one of ExprOptScope values, for "PlainIdentifier"
     *         it is one of ExprVarScope values.
     *       • "ident": identifier (without scope, if any), present
     *         for "Option", "PlainIdentifier", "PlainKey" and
     *         "Environment" nodes.
     *       • "name": Integer, register name (one character) or -1.
     *         Only present for "Register" nodes.
     *       • "cmp_type": String, comparison type, one of the value
     *         names from ExprComparisonType, stringified without
     *         "kExprCmp" prefix. Only present for "Comparison"
     *         nodes.
     *       • "ccs_strategy": String, case comparison strategy, one
     *         of the value names from ExprCaseCompareStrategy,
     *         stringified without "kCCStrategy" prefix. Only present
     *         for "Comparison" nodes.
     *       • "augmentation": String, augmentation type for
     *         "Assignment" nodes. Is either an empty string, "Add",
     *         "Subtract" or "Concat" for "=", "+=", "-=" or ".="
     *         respectively.
     *       • "invert": Boolean, true if result of comparison needs
     *         to be inverted. Only present for "Comparison" nodes.
     *       • "ivalue": Integer, integer value for "Integer" nodes.
     *       • "fvalue": Float, floating-point value for "Float"
     *         nodes.
     *       • "svalue": String, value for "SingleQuotedString" and
     *         "DoubleQuotedString" nodes.
     *
     *
     * @signature `nvim_parse_expression({expr}, {flags}, {highlight}, {err})`
     * @annotations {fast}
     */
    nvim_parse_expression: (expr: string, flags: string, highlight: boolean, err?: unknown) => Record<string, unknown>;
    /**
     * Pastes at cursor, in any mode.
     * Invokes the `vim.paste` handler, which handles each mode
     * appropriately. Sets redo/undo. Faster than |nvim_input()|.
     * Lines break at LF ("\n").
     * Errors ('nomodifiable', `vim.paste()` failure, …) are
     * reflected in `err` but do not affect the return value (which
     * is strictly decided by `vim.paste()`). On error, subsequent
     * calls are ignored ("drained") until the next paste is
     * initiated (phase 1 or -1).
     * @param data Multiline input. May be binary (containing NUL
     *              bytes).
     * @param crlf Also break lines at CR and CRLF.
     * @param phase -1: paste in a single call (i.e. without
     *              streaming). To "stream" a paste, call `nvim_paste` sequentially with these `phase` values:
     *              • 1: starts the paste (exactly once)
     *              • 2: continues the paste (zero or more times)
     *              • 3: ends the paste (exactly once)
     * @returns
     *     • true: Client may continue pasting.
     *     • false: Client must cancel the paste.
     *
     * @signature `nvim_paste({data}, {crlf}, {phase}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_paste: (data: string, crlf: boolean, phase: number, err?: unknown) => boolean;
    /**
     * Puts text at cursor, in any mode.
     * Compare |:put| and |p| which are always linewise.
     * @param lines |readfile()|-style list of lines.
     *               |channel-lines|
     * @param type Edit behavior: any |getregtype()| result, or:
     *               • "b" |blockwise-visual| mode (may include
     *                 width, e.g. "b3")
     *               • "c" |charwise| mode
     *               • "l" |linewise| mode
     *               • "" guess by contents, see |setreg()|
     * @param after If true insert after cursor (like |p|), or
     *               before (like |P|).
     * @param follow If true place cursor at end of inserted text.
     * @signature `nvim_put({lines}, {type}, {after}, {follow}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_put: (lines: string[], type: string, after: boolean, follow: boolean, err?: unknown) => void;
    /**
     * Replaces terminal codes and |keycodes| (<CR>, <Esc>, ...) in a
     * string with the internal representation.
     * @param str String to be converted.
     * @param from_part Legacy Vim parameter. Usually true.
     * @param do_lt Also translate <lt>. Ignored if `special` is
     *                  false.
     * @param special Replace |keycodes|, e.g. <CR> becomes a "\r"
     *                  char.
     * @signature `nvim_replace_termcodes({str}, {from_part}, {do_lt}, {special})`
     * @reference replace_termcodes
     * cpoptions
     */
    nvim_replace_termcodes: (str: string, from_part: boolean, do_lt: boolean, special: boolean) => string;
    /**
     * Selects an item in the completion popupmenu.
     * If |ins-completion| is not active this API call is silently
     * ignored. Useful for an external UI using |ui-popupmenu| to
     * control the popupmenu with the mouse. Can also be used in a
     * mapping; use <cmd> |:map-cmd| to ensure the mapping doesn't
     * end completion mode.
     * @param item Index (zero-based) of the item to select. Value
     *               of -1 selects nothing and restores the original
     *               text.
     * @param insert Whether the selection should be inserted in the
     *               buffer.
     * @param finish Finish the completion and dismiss the popupmenu.
     *               Implies `insert`.
     * @param opts Optional parameters. Reserved for future use.
     * @signature `nvim_select_popupmenu_item({item}, {insert}, {finish}, {opts}, {err})`
     */
    nvim_select_popupmenu_item: (item: number, insert: boolean, finish: boolean, opts: Record<string, unknown>, err?: unknown) => void;
    /**
     * Self-identifies the client.
     * The client/plugin/application should call this after
     * connecting, to provide hints about its identity and purpose,
     * for debugging and orchestration.
     * Can be called more than once; the caller should merge old info
     * if appropriate. Example: library first identifies the channel,
     * then a plugin using that library later identifies itself.
     *
     * Note:
     *     "Something is better than nothing". You don't need to
     *     include all the fields.
     *
     * @param name Short name for the connected client
     * @param version Dictionary describing the version, with
     *                   these (optional) keys:
     *                   • "major" major version (defaults to 0 if
     *                     not set, for no release yet)
     *                   • "minor" minor version
     *                   • "patch" patch number
     *                   • "prerelease" string describing a
     *                     prerelease, like "dev" or "beta1"
     *                   • "commit" hash or similar identifier of
     *                     commit
     * @param type Must be one of the following values. Client
     *                   libraries should default to "remote" unless
     *                   overridden by the user.
     *                   • "remote" remote client connected to Nvim.
     *                   • "ui" gui frontend
     *                   • "embedder" application using Nvim as a
     *                     component (for example, IDE/editor
     *                     implementing a vim mode).
     *                   • "host" plugin host, typically started by
     *                     nvim
     *                   • "plugin" single plugin, started by nvim
     * @param methods Builtin methods in the client. For a host,
     *                   this does not include plugin methods which
     *                   will be discovered later. The key should be
     *                   the method name, the values are dicts with
     *                   these (optional) keys (more keys may be
     *                   added in future versions of Nvim, thus
     *                   unknown keys are ignored. Clients must only
     *                   use keys defined in this or later versions
     *                   of Nvim):
     *                   • "async" if true, send as a notification.
     *                     If false or unspecified, use a blocking
     *                     request
     *                   • "nargs" Number of arguments. Could be a
     *                     single integer or an array of two
     *                     integers, minimum and maximum inclusive.
     * @param attributes Arbitrary string:string map of informal
     *                   client properties. Suggested keys:
     *                   • "website": Client homepage URL (e.g.
     *                     GitHub repository)
     *                   • "license": License description ("Apache
     *                     2", "GPLv3", "MIT", …)
     *                   • "logo": URI or path to image, preferably
     *                     small logo or icon. .png or .svg format is
     *                     preferred.
     * @signature `nvim_set_client_info({name}, {version}, {type}, {methods}, {attributes}, {err})`
     */
    nvim_set_client_info: (name: string, version: Record<string, unknown>, type: string, methods: Record<string, unknown>, attributes: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets the current buffer.
     * @param buffer Buffer handle
     * @signature `nvim_set_current_buf({buffer}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_set_current_buf: (buffer: number, err?: unknown) => void;
    /**
     * Changes the global working directory.
     * @param dir Directory path
     * @signature `nvim_set_current_dir({dir}, {err})`
     */
    nvim_set_current_dir: (dir: string, err?: unknown) => void;
    /**
     * Sets the current line.
     * @param line Line contents
     * @signature `nvim_set_current_line({line}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_set_current_line: (line: string, err?: unknown) => void;
    /**
     * Sets the current tabpage.
     * @param tabpage Tabpage handle
     * @signature `nvim_set_current_tabpage({tabpage}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_set_current_tabpage: (tabpage: number, err?: unknown) => void;
    /**
     * Sets the current window.
     * @param window Window handle
     * @signature `nvim_set_current_win({window}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_set_current_win: (window: number, err?: unknown) => void;
    /**
     * Set or change decoration provider for a namespace
     * This is a very general purpose interface for having lua
     * callbacks being triggered during the redraw code.
     * The expected usage is to set extmarks for the currently
     * redrawn buffer. |nvim_buf_set_extmark| can be called to add
     * marks on a per-window or per-lines basis. Use the `ephemeral`
     * key to only use the mark for the current screen redraw (the
     * callback will be called again for the next redraw ).
     * Note: this function should not be called often. Rather, the
     * callbacks themselves can be used to throttle unneeded
     * callbacks. the `on_start` callback can return `false` to
     * disable the provider until the next redraw. Similarly, return
     * `false` in `on_win` will skip the `on_lines` calls for that
     * window (but any extmarks set in `on_win` will still be used).
     * A plugin managing multiple sources of decoration should
     * ideally only set one provider, and merge the sources
     * internally. You can use multiple `ns_id` for the extmarks
     * set/modified inside the callback anyway.
     * Note: doing anything other than setting extmarks is considered
     * experimental. Doing things like changing options are not
     * expliticly forbidden, but is likely to have unexpected
     * consequences (such as 100% CPU consumption). doing
     * `vim.rpcnotify` should be OK, but `vim.rpcrequest` is quite
     * dubious for the moment.
     * @param ns_id Namespace id from |nvim_create_namespace()|
     * @param opts Callbacks invoked during redraw:
     *              • on_start: called first on each screen redraw
     *                ["start", tick]
     *              • on_buf: called for each buffer being redrawn
     *                (before window callbacks) ["buf", bufnr, tick]
     *              • on_win: called when starting to redraw a
     *                specific window. ["win", winid, bufnr, topline,
     *                botline_guess]
     *              • on_line: called for each buffer line being
     *                redrawn. (The interaction with fold lines is
     *                subject to change) ["win", winid, bufnr, row]
     *              • on_end: called at the end of a redraw cycle
     *                ["end", tick]
     * @signature `nvim_set_decoration_provider({ns_id}, {opts}, {err})`
     */
    nvim_set_decoration_provider: (ns_id: number, opts: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets a highlight group.
     * Note: Unlike the `:highlight` command which can update a
     * highlight group, this function completely replaces the
     * definition. For example: `nvim_set_hl(0, 'Visual', {})` will
     * clear the highlight group 'Visual'.
     * @param ns_id Namespace id for this highlight
     *              |nvim_create_namespace()|. Use 0 to set a
     *              highlight group globally |:highlight|.
     * @param name Highlight group name, e.g. "ErrorMsg"
     * @param val Highlight definition map, like |synIDattr()|. In
     *              addition, the following keys are recognized:
     *              • default: Don't override existing definition
     *                |:hi-default|
     *              • ctermfg: Sets foreground of cterm color
     *                |highlight-ctermfg|
     *              • ctermbg: Sets background of cterm color
     *                |highlight-ctermbg|
     *              • cterm: cterm attribute map, like
     *                |highlight-args|. Note: Attributes default to
     *                those set for `gui` if not set.
     * @signature `nvim_set_hl({ns_id}, {name}, {val}, {err})`
     */
    nvim_set_hl: (ns_id: number, name: string, val?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets a global |mapping| for the given mode.
     * To set a buffer-local mapping, use |nvim_buf_set_keymap()|.
     * Unlike |:map|, leading/trailing whitespace is accepted as part
     * of the {lhs} or {rhs}. Empty {rhs} is |<Nop>|. |keycodes| are
     * replaced as usual.
     * Example: >
     *     call nvim_set_keymap('n', ' <NL>', '', {'nowait': v:true})
     *
     * <
     * is equivalent to: >
     *     nmap <nowait> <Space><NL> <Nop>
     *
     * <
     * @param mode Mode short-name (map command prefix: "n", "i",
     *             "v", "x", …) or "!" for |:map!|, or empty string
     *             for |:map|.
     * @param lhs Left-hand-side |{lhs}| of the mapping.
     * @param rhs Right-hand-side |{rhs}| of the mapping.
     * @param opts Optional parameters map. Accepts all
     *             |:map-arguments| as keys excluding |<buffer>| but
     *             including |noremap| and "desc". "desc" can be used
     *             to give a description to keymap. When called from
     *             Lua, also accepts a "callback" key that takes a
     *             Lua function to call when the mapping is executed.
     *             Values are Booleans. Unknown key is an error.
     * @signature `nvim_set_keymap({mode}, {lhs}, {rhs}, {opts}, {err})`
     */
    nvim_set_keymap: (mode: string, lhs: string, rhs: string, opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets the global value of an option.
     * @param name Option name
     * @param value New option value
     * @signature `nvim_set_option({name}, {value}, {err})`
     */
    nvim_set_option: (name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets the value of an option. The behavior of this function
     * matches that of |:set|: for global-local options, both the
     * global and local value are set unless otherwise specified with
     * {scope}.
     * @param name Option name
     * @param value New option value
     * @param opts Optional parameters
     *              • scope: One of 'global' or 'local'. Analogous to
     *                |:setglobal| and |:setlocal|, respectively.
     * @signature `nvim_set_option_value({name}, {value}, {opts}, {err})`
     */
    nvim_set_option_value: (name: string, value: Record<string, unknown>, opts?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets a global (g:) variable.
     * @param name Variable name
     * @param value Variable value
     * @signature `nvim_set_var({name}, {value}, {err})`
     */
    nvim_set_var: (name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets a v: variable, if it is not readonly.
     * @param name Variable name
     * @param value Variable value
     * @signature `nvim_set_vvar({name}, {value}, {err})`
     */
    nvim_set_vvar: (name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Calculates the number of display cells occupied by `text`.
     * <Tab> counts as one cell.
     * @param text Some text
     * @returns Number of cells
     * @signature `nvim_strwidth({text}, {err})`
     */
    nvim_strwidth: (text: string, err?: unknown) => number;
    /**
     * Subscribes to event broadcasts.
     * @param event Event type string
     * @signature `nvim_subscribe({event})`
     */
    nvim_subscribe: (event: string) => void;
    /**
     * Removes a tab-scoped (t:) variable
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @param name Variable name
     * @signature `nvim_tabpage_del_var({tabpage}, {name}, {err})`
     */
    nvim_tabpage_del_var: (tabpage: number, name: string, err?: unknown) => void;
    /**
     * Gets the tabpage number
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @returns Tabpage number
     * @signature `nvim_tabpage_get_number({tabpage}, {err})`
     */
    nvim_tabpage_get_number: (tabpage: number, err?: unknown) => number;
    /**
     * Gets a tab-scoped (t:) variable
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @param name Variable name
     * @returns Variable value
     * @signature `nvim_tabpage_get_var({tabpage}, {name}, {err})`
     */
    nvim_tabpage_get_var: (tabpage: number, name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the current window in a tabpage
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @returns Window handle
     * @signature `nvim_tabpage_get_win({tabpage}, {err})`
     */
    nvim_tabpage_get_win: (tabpage: number, err?: unknown) => number;
    /**
     * Checks if a tabpage is valid
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @returns true if the tabpage is valid, false otherwise
     * @signature `nvim_tabpage_is_valid({tabpage})`
     */
    nvim_tabpage_is_valid: (tabpage: number) => boolean;
    /**
     * Gets the windows in a tabpage
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @returns List of windows in `tabpage`
     * @signature `nvim_tabpage_list_wins({tabpage}, {err})`
     */
    nvim_tabpage_list_wins: (tabpage: number, err?: unknown) => number[];
    /**
     * Sets a tab-scoped (t:) variable
     * @param tabpage Tabpage handle, or 0 for current tabpage
     * @param name Variable name
     * @param value Variable value
     * @signature `nvim_tabpage_set_var({tabpage}, {name}, {value}, {err})`
     */
    nvim_tabpage_set_var: (tabpage: number, name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Activates UI events on the channel.
     * Entry point of all UI clients. Allows |--embed| to continue
     * startup. Implies that the client is ready to show the UI. Adds
     * the client to the list of UIs. |nvim_list_uis()|
     *
     * Note:
     *     If multiple UI clients are attached, the global screen
     *     dimensions degrade to the smallest client. E.g. if client
     *     A requests 80x40 but client B requests 200x100, the global
     *     screen has size 80x40.
     *
     * @param width Requested screen columns
     * @param height Requested screen rows
     * @param options |ui-option| map
     * @signature `nvim_ui_attach({width}, {height}, {options}, {err})`
     */
    nvim_ui_attach: (width: number, height: number, options: boolean, err?: unknown) => void;
    /**
     * Deactivates UI events on the channel.
     * Removes the client from the list of UIs. |nvim_list_uis()|
     * @signature `nvim_ui_detach({err})`
     */
    nvim_ui_detach: (err?: unknown) => void;
    /**
     * Tells Nvim the geometry of the popumenu, to align floating
     * windows with an external popup menu.
     * Note that this method is not to be confused with
     * |nvim_ui_pum_set_height()|, which sets the number of visible
     * items in the popup menu, while this function sets the bounding
     * box of the popup menu, including visual elements such as
     * borders and sliders. Floats need not use the same font size,
     * nor be anchored to exact grid corners, so one can set
     * floating-point numbers to the popup menu geometry.
     * @param width Popupmenu width.
     * @param height Popupmenu height.
     * @param row Popupmenu row.
     * @param col Popupmenu height.
     * @signature `nvim_ui_pum_set_bounds({width}, {height}, {row}, {col}, {err})`
     */
    nvim_ui_pum_set_bounds: (width: number, height: number, row: number, col: number, err?: unknown) => void;
    /**
     * Tells Nvim the number of elements displaying in the popumenu,
     * to decide <PageUp> and <PageDown> movement.
     * @param height Popupmenu height, must be greater than zero.
     * @signature `nvim_ui_pum_set_height({height}, {err})`
     */
    nvim_ui_pum_set_height: (height: number, err?: unknown) => void;
    /**
     * @signature `nvim_ui_set_option({name}, {value}, {error})`
     */
    nvim_ui_set_option: (name: string, value: Record<string, unknown>, error?: unknown) => void;
    /**
     * @signature `nvim_ui_try_resize({width}, {height}, {err})`
     */
    nvim_ui_try_resize: (width: number, height: number, err?: unknown) => Record<string, unknown>;
    /**
     * Tell Nvim to resize a grid. Triggers a grid_resize event with
     * the requested grid size or the maximum size if it exceeds size
     * limits.
     * On invalid grid handle, fails with error.
     * @param grid The handle of the grid to be changed.
     * @param width The new requested width.
     * @param height The new requested height.
     * @signature `nvim_ui_try_resize_grid({grid}, {width}, {height}, {err})`
     */
    nvim_ui_try_resize_grid: (grid: number, width: number, height: number, err?: unknown) => void;
    /**
     * Unsubscribes to event broadcasts.
     * @param event Event type string
     * @signature `nvim_unsubscribe({event})`
     */
    nvim_unsubscribe: (event: string) => void;
    /**
     * Calls a function with window as temporary current window.
     * @param window Window handle, or 0 for current window
     * @param fun Function to call inside the window (currently
     *               lua callable only)
     * @returns Return value of function. NB: will deepcopy lua values
     *     currently, use upvalues to send lua references in and out.
     * @signature `nvim_win_call({window}, {fun}, {err})`
     * @reference |win_execute()|
     * |nvim_buf_call()|
     */
    nvim_win_call: (window: number, fun: unknown, err?: unknown) => Record<string, unknown>;
    /**
     * Closes the window (like |:close| with a |window-ID|).
     * @param window Window handle, or 0 for current window
     * @param force Behave like `:close!` The last window of a
     *               buffer with unwritten changes can be closed. The
     *               buffer will become hidden, even if 'hidden' is
     *               not set.
     * @signature `nvim_win_close({window}, {force}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_win_close: (window: number, force: boolean, err?: unknown) => void;
    /**
     * Removes a window-scoped (w:) variable
     * @param window Window handle, or 0 for current window
     * @param name Variable name
     * @signature `nvim_win_del_var({window}, {name}, {err})`
     */
    nvim_win_del_var: (window: number, name: string, err?: unknown) => void;
    /**
     * Gets the current buffer in a window
     * @param window Window handle, or 0 for current window
     * @returns Buffer handle
     * @signature `nvim_win_get_buf({window}, {err})`
     */
    nvim_win_get_buf: (window: number, err?: unknown) => number;
    /**
     * Gets window configuration.
     * The returned value may be given to |nvim_open_win()|.
     * `relative` is empty for normal windows.
     * @param window Window handle, or 0 for current window
     * @returns Map defining the window configuration, see
     *     |nvim_open_win()|
     * @signature `nvim_win_get_config({window}, {err})`
     */
    nvim_win_get_config: (window: number, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the (1,0)-indexed cursor position in the window.
     * |api-indexing|
     * @param window Window handle, or 0 for current window
     * @returns (row, col) tuple
     * @signature `nvim_win_get_cursor({window}, {err})`
     */
    nvim_win_get_cursor: (window: number, err?: unknown) => [
        number,
        number
    ];
    /**
     * Gets the window height
     * @param window Window handle, or 0 for current window
     * @returns Height as a count of rows
     * @signature `nvim_win_get_height({window}, {err})`
     */
    nvim_win_get_height: (window: number, err?: unknown) => number;
    /**
     * Gets the window number
     * @param window Window handle, or 0 for current window
     * @returns Window number
     * @signature `nvim_win_get_number({window}, {err})`
     */
    nvim_win_get_number: (window: number, err?: unknown) => number;
    /**
     * Gets a window option value
     * @param window Window handle, or 0 for current window
     * @param name Option name
     * @returns Option value
     * @signature `nvim_win_get_option({window}, {name}, {err})`
     */
    nvim_win_get_option: (window: number, name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the window position in display cells. First position is
     * zero.
     * @param window Window handle, or 0 for current window
     * @returns (row, col) tuple with the window position
     * @signature `nvim_win_get_position({window}, {err})`
     */
    nvim_win_get_position: (window: number, err?: unknown) => [
        number,
        number
    ];
    /**
     * Gets the window tabpage
     * @param window Window handle, or 0 for current window
     * @returns Tabpage that contains the window
     * @signature `nvim_win_get_tabpage({window}, {err})`
     */
    nvim_win_get_tabpage: (window: number, err?: unknown) => number;
    /**
     * Gets a window-scoped (w:) variable
     * @param window Window handle, or 0 for current window
     * @param name Variable name
     * @returns Variable value
     * @signature `nvim_win_get_var({window}, {name}, {err})`
     */
    nvim_win_get_var: (window: number, name: string, err?: unknown) => Record<string, unknown>;
    /**
     * Gets the window width
     * @param window Window handle, or 0 for current window
     * @returns Width as a count of columns
     * @signature `nvim_win_get_width({window}, {err})`
     */
    nvim_win_get_width: (window: number, err?: unknown) => number;
    /**
     * Closes the window and hide the buffer it contains (like
     * |:hide| with a |window-ID|).
     * Like |:hide| the buffer becomes hidden unless another window
     * is editing it, or 'bufhidden' is `unload`, `delete` or `wipe`
     * as opposed to |:close| or |nvim_win_close|, which will close
     * the buffer.
     * @param window Window handle, or 0 for current window
     * @signature `nvim_win_hide({window}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_win_hide: (window: number, err?: unknown) => void;
    /**
     * Checks if a window is valid
     * @param window Window handle, or 0 for current window
     * @returns true if the window is valid, false otherwise
     * @signature `nvim_win_is_valid({window})`
     */
    nvim_win_is_valid: (window: number) => boolean;
    /**
     * Sets the current buffer in a window, without side effects
     * @param window Window handle, or 0 for current window
     * @param buffer Buffer handle
     * @signature `nvim_win_set_buf({window}, {buffer}, {err})`
     * @annotations not allowed when |textlock| is active
     */
    nvim_win_set_buf: (window: number, buffer: number, err?: unknown) => void;
    /**
     * Configures window layout. Currently only for floating and
     * external windows (including changing a split window to those
     * layouts).
     * When reconfiguring a floating window, absent option keys will
     * not be changed. `row`/`col` and `relative` must be
     * reconfigured together.
     * @param window Window handle, or 0 for current window
     * @param config Map defining the window configuration, see
     *               |nvim_open_win()|
     * @signature `nvim_win_set_config({window}, {config}, {err})`
     * @reference |nvim_open_win()|
     */
    nvim_win_set_config: (window: number, config?: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets the (1,0)-indexed cursor position in the window.
     * |api-indexing| This scrolls the window even if it is not the
     * current one.
     * @param window Window handle, or 0 for current window
     * @param pos (row, col) tuple representing the new position
     * @signature `nvim_win_set_cursor({window}, {pos}, {err})`
     */
    nvim_win_set_cursor: (window: number, pos: [
        number,
        number
    ], err?: unknown) => void;
    /**
     * Sets the window height.
     * @param window Window handle, or 0 for current window
     * @param height Height as a count of rows
     * @signature `nvim_win_set_height({window}, {height}, {err})`
     */
    nvim_win_set_height: (window: number, height: number, err?: unknown) => void;
    /**
     * Sets a window option value. Passing 'nil' as value deletes the
     * option(only works if there's a global fallback)
     * @param window Window handle, or 0 for current window
     * @param name Option name
     * @param value Option value
     * @signature `nvim_win_set_option({window}, {name}, {value}, {err})`
     */
    nvim_win_set_option: (window: number, name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets a window-scoped (w:) variable
     * @param window Window handle, or 0 for current window
     * @param name Variable name
     * @param value Variable value
     * @signature `nvim_win_set_var({window}, {name}, {value}, {err})`
     */
    nvim_win_set_var: (window: number, name: string, value: Record<string, unknown>, err?: unknown) => void;
    /**
     * Sets the window width. This will only succeed if the screen is
     * split vertically.
     * @param window Window handle, or 0 for current window
     * @param width Width as a count of columns
     * @signature `nvim_win_set_width({window}, {width}, {err})`
     */
    nvim_win_set_width: (window: number, width: number, err?: unknown) => void;
}