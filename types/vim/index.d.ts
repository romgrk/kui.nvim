/// <reference path="utils.d.ts" />
// vim: nomodeline:
// about vim modeline: https://vim.fandom.com/wiki/Modeline_magic

import { Api } from './api.d';
import { Lua } from './lua.d';
import { Loop } from './loop.d';
import { Lsp } from './lsp.d';
import { Treesitter } from './treesitter.d';
import { Diagnostic } from './diagnostic.d';
import { Fn } from './fn.d';
import { Fs } from './fs.d';
import { Option, Window, Global, Buffer } from './option.d';

declare global {
  /** `lua-builtin` */
  interface IVim extends Lua {
    /**
     * Invokes Nvim |API| function {func} with arguments {...}.
     * Example: call the "nvim_get_current_line()" API function: >
     *     print(tostring(vim.api.nvim_get_current_line()))
     */
    api: Api;
    loop: Loop;
    lsp: Lsp;
    diagnostic: Diagnostic;
    treesitter: Treesitter;
    fn: Fn;
    fs: Fs;
    opt: Option;
    go: Global;
    bo: Buffer;
    wo: Window;
    /**
     * Global (|g:|) editor variables.
     * Key with no value returns `nil`.
     */
    g: LuaTable;
    /**
     * Buffer-scoped (|b:|) variables for the current buffer.
     * Invalid or unset key returns `nil`. Can be indexed with
     * an integer to access variables for a specific buffer.
     */
    b: LuaTable;
    /**
     * Window-scoped (|w:|) variables for the current window.
     * Invalid or unset key returns `nil`. Can be indexed with
     * an integer to access variables for a specific window.
     */
    w: LuaTable;
    /**
     * Tabpage-scoped (|t:|) variables for the current tabpage.
     * Invalid or unset key returns `nil`. Can be indexed with
     * an integer to access variables for a specific tabpage.
     */
    t: LuaTable;
    /**
     * |v:| variables.
     * Invalid or unset key returns `nil`.
     */
    v: LuaTable;
    /**
     * Environment variables defined in the editor session.
     * See |expand-env| and |:let-environment| for the Vimscript behavior.
     * Invalid or unset key returns `nil`.
     * Example: >
     *     vim.env.FOO = 'bar'
     *     print(vim.env.TERM)
     */
    env: LuaTable;

    /**
     * Gets the version of the current Nvim build.
     */
    version: () => LuaTable;
    /**
     * Returns true if the code is executing as part of a "fast" event
     * handler, where most of the API is disabled. These are low-level events
     * (e.g. |lua-loop-callbacks|) which can be invoked whenever Nvim polls
     * for input.  When this is `false` most API functions are callable (but
     * may be subject to other restrictions such as |textlock|).
     */
    in_fast_event: () => boolean;
    /**
     * Special value representing NIL in |RPC| and |v:null| in Vimscript
     * conversion, and similar cases. Lua `nil` cannot be used as part of
     * a Lua table representing a Dictionary or Array, because it is
     * treated as missing: `{"foo", nil}` is the same as `{"foo"}`.
     */
    NIL: null;
    /**
      * Creates a special empty table (marked with a metatable), which Nvim
      * converts to an empty dictionary when translating Lua values to
      * Vimscript or API types. Nvim by default converts an empty table `{}`
      * without this metatable to an list/array.

      * Note: if numeric keys are present in the table, Nvim ignores the
      * metatable marker and converts the dict to a list/array anyway.
        */
    empty_dict: () => LuaTable;
    /**
     * Log levels are one of the values defined in `vim.log.levels`:
     */
    log: {
      levels: {
        TRACE: 0;
        DEBUG: 1;
        INFO: 2;
        WARN: 3;
        ERROR: 4;
      };
    };
  }
  const vim: IVim;
}
