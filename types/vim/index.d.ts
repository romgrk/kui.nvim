import { Loop, Timer as LoopTimer } from './loop.d';
import { Api } from './api.d';
import { Json } from './json.d';
import { Lsp } from './lsp.d';
import { Treesitter } from './treesitter.d';
import { Diagnostic } from './diagnostic.d';
import { Fn } from './fn.d';
import { Fs } from './fs.d';
import { Option, Window, Global, Buffer } from './option.d';

declare global {
  /** `lua-builtin` */
  /** @noSelf */
  namespace vim {
    type Timer = LoopTimer;

    /**
      * Invokes Nvim |API| function {func} with arguments {...}.
      * Example: call the "nvim_get_current_line()" API function: >
      *     print(tostring(vim.api.nvim_get_current_line()))
      */
    const api: Api;
    const lsp: Lsp;
    const loop: Loop;
    const json: Json;
    const diagnostic: Diagnostic;
    const treesitter: Treesitter;
    const fn: Fn;
    const fs: Fs;
    const opt: Option;
    const go: Global;
    const bo: Buffer;
    const wo: Window;
    const cmd: (input: string) => void;
    /**
      * Global (|g:|) editor variables.
      * Key with no value returns `nil`.
      */
    const g: LuaTable;
    /**
      * Buffer-scoped (|b:|) variables for the current buffer.
      * Invalid or unset key returns `nil`. Can be indexed with
      * an integer to access variables for a specific buffer.
      */
    const b: LuaTable;
    /**
      * Window-scoped (|w:|) variables for the current window.
      * Invalid or unset key returns `nil`. Can be indexed with
      * an integer to access variables for a specific window.
      */
    const w: LuaTable;
    /**
      * Tabpage-scoped (|t:|) variables for the current tabpage.
      * Invalid or unset key returns `nil`. Can be indexed with
      * an integer to access variables for a specific tabpage.
      */
    const t: LuaTable;
    /**
      * |v:| variables.
      * Invalid or unset key returns `nil`.
      */
    const v: LuaTable;
    /**
      * Environment variables defined in the editor session.
      * See |expand-env| and |:let-environment| for the Vimscript behavior.
      * Invalid or unset key returns `nil`.
      * Example: >
      *     vim.env.FOO = 'bar'
      *     print(vim.env.TERM)
      */
    const env: LuaTable;

    /**
      * Gets the version of the current Nvim build.
      */
    const version: () => LuaTable;
    /**
      * Returns true if the code is executing as part of a "fast" event
      * handler, where most of the API is disabled. These are low-level events
      * (e.g. |lua-loop-callbacks|) which can be invoked whenever Nvim polls
      * for input.  When this is `false` most API functions are callable (but
      * may be subject to other restrictions such as |textlock|).
      */
    const in_fast_event: () => boolean;
    /**
      * Special value representing NIL in |RPC| and |v:null| in Vimscript
      * conversion, and similar cases. Lua `nil` cannot be used as part of
      * a Lua table representing a Dictionary or Array, because it is
      * treated as missing: `{"foo", nil}` is the same as `{"foo"}`.
      */
    const NIL: null;
    /**
      * Creates a special empty table (marked with a metatable), which Nvim
      * converts to an empty dictionary when translating Lua values to
      * Vimscript or API types. Nvim by default converts an empty table `{}`
      * without this metatable to an list/array.

      * Note: if numeric keys are present in the table, Nvim ignores the
      * metatable marker and converts the dict to a list/array anyway.
        */
    const empty_dict: () => LuaTable;
    /**
      * Log levels are one of the values defined in `vim.log.levels`:
      */
    const log: {
      levels: {
        TRACE: 0;
        DEBUG: 1;
        INFO: 2;
        WARN: 3;
        ERROR: 4;
      };
    };



    /**
      * Add new filetype mappings.
      * Filetype mappings can be added either by extension or by
      * filename (either the "tail" or the full file path). The full
      * file path is checked first, followed by the file name. If a
      * match is not found using the filename, then the filename is
      * matched against the list of patterns (sorted by priority)
      * until a match is found. Lastly, if pattern matching does not
      * find a filetype, then the file extension is used.
      * The filetype can be either a string (in which case it is used
      * as the filetype directly) or a function. If a function, it
      * takes the full path and buffer number of the file as arguments
      * (along with captures from the matched pattern, if any) and
      * should return a string that will be used as the buffer's
      * filetype.
      * Filename patterns can specify an optional priority to resolve
      * cases when a file path matches multiple patterns. Higher
      * priorities are matched first. When omitted, the priority
      * defaults to 0.
      * See $VIMRUNTIME/lua/vim/filetype.lua for more examples.
      * Note that Lua filetype detection is only enabled when
      * |g:do_filetype_lua| is set to 1.
      * Example: >
      *
      *   vim.filetype.add({
      *     extension = {
      *       foo = "fooscript",
      *       bar = function(path, bufnr)
      *         if some_condition() then
      *           return "barscript"
      *         end
      *         return "bar"
      *       end,
      *     },
      *     filename = {
      *       [".foorc"] = "toml",
      *       ["/etc/foo/config"] = "toml",
      *     },
      *     pattern = {
      *       [".*&zwj;/etc/foo/.*"] = "fooscript",
      *       -- Using an optional priority
      *       [".*&zwj;/etc/foo/.*%.conf"] = { "dosini", { priority = 10 } },
      *       ["README.(%a+)$"] = function(path, bufnr, ext)
      *         if ext == "md" then
      *           return "markdown"
      *         elseif ext == "rst" then
      *           return "rst"
      *         end
      *       end,
      *     },
      *   })
      *
      * <
      * @param filetypes table A table containing new filetype maps
      *                  (see example).
      * @signature `add({filetypes})`
      */
    const add: (filetypes: unknown) => unknown;
    /**
      * @signature `connection_failure_errmsg({consequence})`
      */
    const connection_failure_errmsg: (consequence: unknown) => unknown;
    /**
      * Deep compare values for equality
      * Tables are compared recursively unless they both provide the `eq` methamethod. All other types are compared using the equality `==` operator.
      * @param a first value
      * @param b second value
      * @returns `true` if values are equals, else `false`.
      * @signature `deep_equal({a}, {b})`
      */
    const deep_equal: (a: unknown, b: unknown) => unknown;
    /**
      * Returns a deep copy of the given object. Non-table objects are
      * copied as in a typical Lua assignment, whereas table objects
      * are copied recursively. Functions are naively copied, so
      * functions in the copied table point to the same functions as
      * those in the input table. Userdata and threads are not copied
      * and will throw an error.
      * @param orig table Table to copy
      * @returns New table of copied keys and (nested) values.
      * @signature `deepcopy({orig})`
      */
    const deepcopy: (orig: unknown) => unknown;
    /**
      * Defers calling `fn` until `timeout` ms passes.
      * Use to do a one-shot timer that calls `fn` Note: The {fn} is |schedule_wrap|ped automatically, so API
      * functions are safe to call.
      * @param fn Callback to call once `timeout` expires
      * @param timeout Number of milliseconds to wait before calling
      *                `fn`
      * @returns timer luv timer object
      * @signature `defer_fn({fn}, {timeout})`
      */
    const defer_fn: (fn: unknown, timeout: unknown) => unknown;
    /**
      * Remove an existing mapping. Examples: >
      *
      *    vim.keymap.del('n', 'lhs')
      *
      *    vim.keymap.del({'n', 'i', 'v'}, '<leader>w', { buffer = 5 })
      *
      * <
      * @param opts table A table of optional arguments:
      *             • buffer: (number or boolean) Remove a mapping
      *               from the given buffer. When "true" or 0, use the
      *               current buffer.
      * @signature `del({modes}, {lhs}, {opts})`
      * @reference |vim.keymap.set()|
      */
    const del: (modes: unknown, lhs: unknown, opts: unknown) => unknown;
    /**
      * Tests if `s` ends with `suffix`.
      * @param s (string) a string
      * @param suffix (string) a suffix
      * @returns (boolean) true if `suffix` is a suffix of s
      * @signature `endswith({s}, {suffix})`
      */
    const endswith: (s: unknown, suffix: unknown) => unknown;
    /**
      * Splits a string at each instance of a separator.
      * @param s String to split
      * @param sep Separator string or pattern
      * @param plain If `true` use `sep` literally (passed to
      *              String.find)
      * @returns Iterator over the split components
      * @signature `gsplit({s}, {sep}, {plain})`
      * @reference |vim.split()|
      * https://www.lua.org/pil/20.2.html
      * http://lua-users.org/wiki/StringLibraryTutorial
      */
    const gsplit: (s: unknown, sep: unknown, plain: unknown) => unknown;
    /**
      * Prompts the user for input
      * Example: >
      *
      *  vim.ui.input({ prompt = 'Enter value for shiftwidth: ' }, function(input)
      *      vim.o.shiftwidth = tonumber(input)
      *  end)
      *
      * <
      * @param opts table Additional options. See |input()|
      *                   • prompt (string|nil) Text of the prompt.
      *                     Defaults to `Input:`.
      *                   • default (string|nil) Default reply to the
      *                     input
      *                   • completion (string|nil) Specifies type of
      *                     completion supported for input. Supported
      *                     types are the same that can be supplied to
      *                     a user-defined command using the
      *                     "-complete=" argument. See
      *                     |:command-completion|
      *                   • highlight (function) Function that will be
      *                     used for highlighting user inputs.
      * @param on_confirm function ((input|nil) -> ()) Called once the
      *                   user confirms or abort the input. `input` is
      *                   what the user typed. `nil` if the user
      *                   aborted the dialog.
      * @signature `input({opts}, {on_confirm})`
      */
    const input: (opts: unknown, on_confirm: unknown) => unknown;
    /**
      * Return a human-readable representation of the given object.
      * @signature `inspect({object}, {options})`
      * @reference https://github.com/kikito/inspect.lua
      * https://github.com/mpeterv/vinspect
      */
    const inspect: (object: unknown, options?: unknown) => unknown;
    /**
      * Returns true if object `f` can be called as a function.
      * @param f Any object
      * @returns true if `f` is callable, else false
      * @signature `is_callable({f})`
      */
    const is_callable: (f: unknown) => unknown;
    /**
      * Extends a list-like table with the values of another list-like
      * table.
      * NOTE: This mutates dst!
      * @param dst list which will be modified and appended to.
      * @param src list from which values will be inserted.
      * @param start Start index on src. defaults to 1
      * @param finish Final index on src. defaults to #src
      * @returns dst
      * @signature `list_extend({dst}, {src}, {start}, {finish})`
      * @reference |vim.tbl_extend()|
      */
    const list_extend: (dst: unknown, src: unknown, start: unknown, finish: unknown) => unknown;
    /**
      * Creates a copy of a table containing only elements from start
      * to end (inclusive)
      * @param list table table
      * @param start integer Start range of slice
      * @param finish integer End range of slice
      * @returns Copy of table sliced from start to finish (inclusive)
      * @signature `list_slice({list}, {start}, {finish})`
      */
    const list_slice: (list: unknown, start: unknown, finish: unknown) => unknown;
    /**
      * Set the filetype for the given buffer from a file name.
      * @param name string File name (can be an absolute or relative
      *              path)
      * @param bufnr number|nil The buffer to set the filetype for.
      *              Defaults to the current buffer.
      * @signature `match({name}, {bufnr})`
      */
    const match: (name: unknown, bufnr: unknown) => unknown;
    /**
      * Display a notification to the user.
      * This function can be overridden by plugins to display
      * notifications using a custom provider (such as the system
      * notification provider). By default, writes to |:messages|.
      * @param msg string Content of the notification to show to the
      *              user.
      * @param level number|nil One of the values from
      *              |vim.log.levels|.
      * @param opts table|nil Optional parameters. Unused by default.
      * @signature `notify({msg}, {level}, {opts})`
      */
    const notify: (msg: unknown, level: unknown, opts: unknown) => unknown;
    /**
      * Display a notification only one time.
      * Like |vim.notify()|, but subsequent calls with the same
      * message will not display a notification.
      * @param msg string Content of the notification to show to the
      *              user.
      * @param level number|nil One of the values from
      *              |vim.log.levels|.
      * @param opts table|nil Optional parameters. Unused by default.
      * @signature `notify_once({msg}, {level}, {opts})`
      */
    const notify_once: (msg: unknown, level: unknown, opts: unknown) => unknown;
    /**
      * Adds Lua function {fn} with namespace id {ns_id} as a listener
      * to every, yes every, input key.
      * The Nvim command-line option |-w| is related but does not
      * support callbacks and cannot be toggled dynamically.
      *
      * Note:
      *     {fn} will not be cleared by |nvim_buf_clear_namespace()|
      *
      * Note:
      *     {fn} will receive the keys after mappings have been
      *     evaluated
      *
      * @param fn function: Callback function. It should take one
      *              string argument. On each key press, Nvim passes
      *              the key char to fn(). |i_CTRL-V| If {fn} is nil,
      *              it removes the callback for the associated
      *              {ns_id}
      * @param ns_id number? Namespace ID. If nil or 0, generates and
      *              returns a new |nvim_create_namespace()| id.
      * @returns number Namespace id associated with {fn}. Or count of all
      *     callbacks if on_key() is called without arguments.
      *
      * Note:
      *     {fn} will be removed if an error occurs while calling.
      *
      * @signature `on_key({fn}, {ns_id})`
      */
    const on_key: (fn: unknown, ns_id: unknown) => unknown;
    /**
      * Paste handler, invoked by |nvim_paste()| when a conforming UI
      * (such as the |TUI|) pastes text into the editor.
      * Example: To remove ANSI color codes when pasting: >
      *
      *  vim.paste = (function(overridden)
      *    return function(lines, phase)
      *      for i,line in ipairs(lines) do
      *        -- Scrub ANSI color codes from paste input.
      *        lines[i] = line:gsub('\27%[[0-9;mK]+', '')
      *      end
      *      overridden(lines, phase)
      *    end
      *  end)(vim.paste)
      *
      * <
      * @param lines |readfile()|-style list of lines to paste.
      *              |channel-lines|
      * @param phase -1: "non-streaming" paste: the call contains all
      *              lines. If paste is "streamed", `phase` indicates the stream state:
      *              • 1: starts the paste (exactly once)
      *              • 2: continues the paste (zero or more times)
      *              • 3: ends the paste (exactly once)
      * @returns false if client should cancel the paste.
      * @signature `paste({lines}, {phase})`
      * @reference |paste|
      */
    const paste: (lines: unknown, phase: unknown) => unknown;
    /**
      * Escapes magic chars in a Lua pattern.
      * @param s String to escape
      * @returns %-escaped pattern string
      * @signature `pesc({s})`
      * @reference https://github.com/rxi/lume
      */
    const pesc: (s: unknown) => unknown;
    /**
      * Prints given arguments in human-readable format. Example: >
      *   -- Print highlight group Normal and store it's contents in a variable.
      *   local hl_normal = vim.pretty_print(vim.api.nvim_get_hl_by_name("Normal", true))
      *
      * <
      * @returns given arguments.
      * @signature `pretty_print({...})`
      * @reference |vim.inspect()|
      */
    const pretty_print: (args: unknown[]) => unknown;
    /**
      * Get a table of lines with start, end columns for a region
      * marked by two points
      * @param bufnr number of buffer
      * @param pos1 (line, column) tuple marking beginning of
      *                  region
      * @param pos2 (line, column) tuple marking end of region
      * @param regtype type of selection (:help setreg)
      * @param inclusive boolean indicating whether the selection is
      *                  end-inclusive
      * @returns region lua table of the form {linenr = {startcol,endcol}}
      * @signature `region({bufnr}, {pos1}, {pos2}, {regtype}, {inclusive})`
      */
    const region: (bufnr: unknown, pos1: unknown, pos2: unknown, regtype: unknown, inclusive: unknown) => unknown;
    /**
      * Defers callback `cb` until the Nvim API is safe to call.
      * @signature `schedule_wrap({cb})`
      * @reference |lua-loop-callbacks|
      * |vim.schedule()|
      * |vim.in_fast_event()|
      */
    const schedule_wrap: (cb: Function) => Function;
    /**
      * Prompts the user to pick a single item from a collection of
      * entries
      * Example: >
      *
      *  vim.ui.select({ 'tabs', 'spaces' }, {
      *      prompt = 'Select tabs or spaces:',
      *      format_item = function(item)
      *          return "I'd like to choose " .. item
      *      end,
      *  }, function(choice)
      *      if choice == 'spaces' then
      *          vim.o.expandtab = true
      *      else
      *          vim.o.expandtab = false
      *      end
      *  end)
      *
      * <
      * @param items table Arbitrary items
      * @param opts table Additional options
      *                  • prompt (string|nil) Text of the prompt.
      *                    Defaults to `Select one of:`
      *                  • format_item (function item -> text)
      *                    Function to format an individual item from
      *                    `items`. Defaults to `tostring`.
      *                  • kind (string|nil) Arbitrary hint string
      *                    indicating the item shape. Plugins
      *                    reimplementing `vim.ui.select` may wish to
      *                    use this to infer the structure or
      *                    semantics of `items`, or the context in
      *                    which select() was called.
      * @param on_choice function ((item|nil, idx|nil) -> ()) Called
      *                  once the user made a choice. `idx` is the
      *                  1-based index of `item` within `items`. `nil`
      *                  if the user aborted the dialog.
      * @signature `select({items}, {opts}, {on_choice})`
      */
    const select: (items: unknown, opts: unknown, on_choice: unknown) => unknown;
    /**
      * Add a new |mapping|. Examples: >
      *
      *    -- Can add mapping to Lua functions
      *    vim.keymap.set('n', 'lhs', function() print("real lua function") end)
      *
      *    -- Can use it to map multiple modes
      *    vim.keymap.set({'n', 'v'}, '<leader>lr', vim.lsp.buf.references, { buffer=true })
      *
      *    -- Can add mapping for specific buffer
      *    vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { silent = true, buffer = 5 })
      *
      *    -- Expr mappings
      *    vim.keymap.set('i', '<Tab>', function()
      *      return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
      *    end, { expr = true })
      *    -- <Plug> mappings
      *    vim.keymap.set('n', '[%', '<Plug>(MatchitNormalMultiBackward)')
      *
      * <
      * Note that in a mapping like: >
      *
      *     vim.keymap.set('n', 'asdf', require('jkl').my_fun)
      *
      * <
      * the `require('jkl')` gets evaluated during this call in order to access the
      * function. If you want to avoid this cost at startup you can
      * wrap it in a function, for example: >
      *
      *     vim.keymap.set('n', 'asdf', function() return require('jkl').my_fun() end)
      *
      * <
      * @param mode string|table Same mode short names as
      *             |nvim_set_keymap()|. Can also be list of modes to
      *             create mapping on multiple modes.
      * @param lhs string Left-hand side |{lhs}| of the mapping.
      * @param rhs string|function Right-hand side |{rhs}| of the
      *             mapping. Can also be a Lua function. If a Lua
      *             function and `opts.expr == true`, returning `nil`
      *             is equivalent to an empty string.
      * @param opts table A table of |:map-arguments| such as
      *             "silent". In addition to the options listed in
      *             |nvim_set_keymap()|, this table also accepts the
      *             following keys:
      *             • buffer: (number or boolean) Add a mapping to the
      *               given buffer. When "true" or 0, use the current
      *               buffer.
      *             • replace_keycodes: (boolean, default true) When
      *               both this and expr is "true",
      *               |nvim_replace_termcodes()| is applied to the
      *               result of Lua expr maps.
      *             • remap: (boolean) Make the mapping recursive.
      *               This is the inverse of the "noremap" option from
      *               |nvim_set_keymap()|. Default `false`.
      * @signature `set({mode}, {lhs}, {rhs}, {opts})`
      * @reference |nvim_set_keymap()|
      */
    const set: (mode: unknown, lhs: unknown, rhs: unknown, opts: unknown) => unknown;
    /**
      * Splits a string at each instance of a separator.
      * Examples: >
      *
      *   split(":aa::b:", ":")     --> {'','aa','','b',''}
      *   split("axaby", "ab?")     --> {'','x','y'}
      *   split("x*yz*o", "*", {plain=true})  --> {'x','yz','o'}
      *   split("|x|y|z|", "|", {trimempty=true}) --> {'x', 'y', 'z'}
      *
      * <
      * @param s String to split
      * @param sep Separator string or pattern
      * @param kwargs Keyword arguments:
      *               • plain: (boolean) If `true` use `sep` literally
      *                 (passed to string.find)
      *               • trimempty: (boolean) If `true` remove empty
      *                 items from the front and back of the list
      * @returns List-like table of the split components.
      * @signature `split({s}, {sep}, {kwargs})`
      * @reference |vim.gsplit()|
      */
    const split: (s: string, sep: string, kwargs?: unknown) => string[];
    /**
      * Tests if `s` starts with `prefix`.
      * @param s (string) a string
      * @param prefix (string) a prefix
      * @returns (boolean) true if `prefix` is a prefix of s
      * @signature `startswith({s}, {prefix})`
      */
    const startswith: (s: unknown, prefix: unknown) => unknown;
    /**
      * Add the reverse lookup values to an existing table. For
      * example: `tbl_add_reverse_lookup { A = 1 } == { [1] = 'A', A = 1 }`
      * @param o table The table to add the reverse to.
      * @signature `tbl_add_reverse_lookup({o})`
      */
    const tbl_add_reverse_lookup: (o: unknown) => unknown;
    /**
      * Checks if a list-like (vector) table contains `value`.
      * @param t Table to check
      * @param value Value to compare
      * @returns true if `t` contains `value`
      * @signature `tbl_contains({t}, {value})`
      */
    const tbl_contains: (t: unknown, value: unknown) => unknown;
    /**
      * Counts the number of non-nil values in table `t`.
      * >
      *
      *  vim.tbl_count({ a=1, b=2 }) => 2
      *  vim.tbl_count({ 1, 2 }) => 2
      *
      * <
      * @param t Table
      * @returns Number that is the number of the value in table
      * @signature `tbl_count({t})`
      * @reference https://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
      */
    const tbl_count: (t: unknown) => unknown;
    /**
      * Merges recursively two or more map-like tables.
      * @param behavior Decides what to do if a key is found in more
      *                 than one map:
      *                 • "error": raise an error
      *                 • "keep": use value from the leftmost map
      *                 • "force": use value from the rightmost map
      * @param ... Two or more map-like tables.
      * @signature `tbl_deep_extend({behavior}, {...})`
      * @reference |tbl_extend()|
      */
    const tbl_deep_extend: (behavior: unknown, args: unknown[]) => unknown;
    /**
      * Merges two or more map-like tables.
      * @param behavior Decides what to do if a key is found in more
      *                 than one map:
      *                 • "error": raise an error
      *                 • "keep": use value from the leftmost map
      *                 • "force": use value from the rightmost map
      * @param ... Two or more map-like tables.
      * @signature `tbl_extend({behavior}, {...})`
      * @reference |extend()|
      */
    const tbl_extend: (behavior: unknown, args: unknown[]) => unknown;
    /**
      * Filter a table using a predicate function
      * @param func function or callable table
      * @param t table
      * @signature `tbl_filter({func}, {t})`
      */
    const tbl_filter: (func: unknown, t: unknown) => unknown;
    /**
      * Creates a copy of a list-like table such that any nested
      * tables are "unrolled" and appended to the result.
      * @param t List-like table
      * @returns Flattened copy of the given list-like table.
      * @signature `tbl_flatten({t})`
      * @reference From https://github.com/premake/premake-core/blob/master/src/base/table.lua
      */
    const tbl_flatten: (t: unknown) => unknown;
    /**
      * Index into a table (first argument) via string keys passed as
      * subsequent arguments. Return `nil` if the key does not exist. Examples: >
      *
      *   vim.tbl_get({ key = { nested_key = true }}, 'key', 'nested_key') == true
      *   vim.tbl_get({ key = {}}, 'key', 'nested_key') == nil
      *
      * <
      * @param o Table to index
      * @param ... Optional strings (0 or more, variadic) via which to
      *            index the table
      * @returns nested value indexed by key if it exists, else nil
      * @signature `tbl_get({o}, {...})`
      */
    const tbl_get: (o: unknown, args: unknown[]) => unknown;
    /**
      * Checks if a table is empty.
      * @param t Table to check
      * @signature `tbl_isempty({t})`
      * @reference https://github.com/premake/premake-core/blob/master/src/base/table.lua
      */
    const tbl_isempty: (t: unknown) => unknown;
    /**
      * Tests if a Lua table can be treated as an array.
      * Empty table `{}` is assumed to be an array, unless it was
      * created by |vim.empty_dict()| or returned as a dict-like |API|
      * or Vimscript result, for example from |rpcrequest()| or
      * |vim.fn|.
      * @param t Table
      * @returns `true` if array-like table, else `false`.
      * @signature `tbl_islist({t})`
      */
    const tbl_islist: (t: unknown) => unknown;
    /**
      * Return a list of all keys used in a table. However, the order
      * of the return table of keys is not guaranteed.
      * @param t Table
      * @returns list of keys
      * @signature `tbl_keys({t})`
      * @reference From https://github.com/premake/premake-core/blob/master/src/base/table.lua
      */
    const tbl_keys: (t: unknown) => unknown;
    /**
      * Apply a function to all values of a table.
      * @param func function or callable table
      * @param t table
      * @signature `tbl_map({func}, {t})`
      */
    const tbl_map: (func: unknown, t: unknown) => unknown;
    /**
      * Return a list of all values used in a table. However, the
      * order of the return table of values is not guaranteed.
      * @param t Table
      * @returns list of values
      * @signature `tbl_values({t})`
      */
    const tbl_values: (t: unknown) => unknown;
    /**
      * Trim whitespace (Lua pattern "%s") from both sides of a
      * string.
      * @param s String to trim
      * @returns String with whitespace removed from its beginning and end
      * @signature `trim({s})`
      * @reference https://www.lua.org/pil/20.2.html
      */
    const trim: (s: unknown) => unknown;
    /**
      * Get a URI from a bufnr
      * @param bufnr number
      * @returns string URI
      * @signature `uri_from_bufnr({bufnr})`
      */
    const uri_from_bufnr: (bufnr: unknown) => unknown;
    /**
      * Get a URI from a file path.
      * @param path string Path to file
      * @returns string URI
      * @signature `uri_from_fname({path})`
      */
    const uri_from_fname: (path: unknown) => unknown;
    /**
      * Get the buffer for a uri. Creates a new unloaded buffer if no
      * buffer for the uri already exists.
      * @param uri string
      * @returns number bufnr
      * @signature `uri_to_bufnr({uri})`
      */
    const uri_to_bufnr: (uri: unknown) => unknown;
    /**
      * Get a filename from a URI
      * @param uri string
      * @returns string filename or unchanged URI for non-file URIs
      * @signature `uri_to_fname({uri})`
      */
    const uri_to_fname: (uri: unknown) => unknown;
    /**
      * Validates a parameter specification (types and values).
      * Usage example: >
      *
      *   function user.new(name, age, hobbies)
      *     vim.validate{
      *       name={name, 'string'},
      *       age={age, 'number'},
      *       hobbies={hobbies, 'table'},
      *     }
      *     ...
      *   end
      *
      * <
      * Examples with explicit argument values (can be run directly): >
      *
      *   vim.validate{arg1={{'foo'}, 'table'}, arg2={'foo', 'string'}}
      *      => NOP (success)
      *
      *   vim.validate{arg1={1, 'table'}}
      *      => error('arg1: expected table, got number')
      *
      *   vim.validate{arg1={3, function(a) return (a % 2) == 0 end, 'even number'}}
      *      => error('arg1: expected even number, got 3')
      *
      * <
      * If multiple types are valid they can be given as a list. >
      *
      *   vim.validate{arg1={{'foo'}, {'table', 'string'}}, arg2={'foo', {'table', 'string'}}}
      *      => NOP (success)
      *
      *   vim.validate{arg1={1, {'string', table'}}}
      *      => error('arg1: expected string|table, got number')
      *
      *
      * <
      * @param opt table of parameter names to validations. Each key
      *            is a parameter name; each value is a tuple in one
      *            of these forms:
      *            1. (arg_value, type_name, optional)
      *               • arg_value: argument value
      *               • type_name: string|table type name, one of:
      *                 ("table", "t", "string", "s", "number", "n",
      *                 "boolean", "b", "function", "f", "nil",
      *                 "thread", "userdata") or list of them.
      *               • optional: (optional) boolean, if true, `nil`
      *                 is valid
      *
      *            2. (arg_value, fn, msg)
      *               • arg_value: argument value
      *               • fn: any function accepting one argument,
      *                 returns true if and only if the argument is
      *                 valid. Can optionally return an additional
      *                 informative error message as the second
      *                 returned value.
      *               • msg: (optional) error string if validation
      *                 fails
      * @signature `validate({opt})`
      */
    const validate: (opt: unknown) => unknown;
  }
}
