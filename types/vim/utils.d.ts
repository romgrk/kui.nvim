/**
 * Style of (optional) window border.
 *
 * This can either be a string or an array. The string values are
 * * "none": No border (default).
 * * "single": A single line box.
 * * "double": A double line box.
 * * "rounded": Like "single", but with rounded corners ("╭" etc.).
 * * "solid": Adds padding by a single whitespace cell.
 * * "shadow": A drop shadow effect by blending with the background.
 */
export type NvimFloatWinBorderString =
  | "none"
  | "single"
  | "double"
  | "rounded"
  | "solid"
  | "shadow";
/**
 * Style of (optional) window border.
 *
 * This can either be a string or an array.
 * * If it is an array, it should have a length of eight or any divisor of eight. The array will specifify the eight chars building up the border in a clockwise fashion starting with the top-left corner.
 * As an example, the double box style could be specified as [ "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" ]. If the number of chars are less than eight, they will be repeated. Thus an ASCII border could be specified as [ "/", "-", "\\", "|" ], or all chars the same as [ "x" ].
 * An empty string can be used to turn off a specific border, for instance, [ "", "", "", ">", "", "", "", "<" ] will only make vertical borders but not horizontal ones.
 * By default, `FloatBorder` highlight is used, which links to `WinSeparator` when not defined. It could also be specified by character: [ {"+", "MyCorner"}, {"x", "MyBorder"} ].
 */
export type NvimFloatWinBorderArray = string[];
/**
 * Style of (optional) window border.
 *
 * This can either be a string or an array.
 */
export type NvimFloatWinBorder =
  | NvimFloatWinBorderString
  | NvimFloatWinBorderArray;

/**
 * config parameter type for *nvim_open_win()* API
 *
 * documentation from neovim help |nvim_open_win()|
 */
export declare interface INvimFloatWinConfig {
  /**
   * Sets the window layout to "floating", placed at (row,col) coordinates
   * relative to:
   * * "editor" The global editor grid
   * * "win" Window given by the `win` field, or current window.
   * * "cursor" Cursor position in current window.
   */
  relative: "editor" | "win" | "cursor";
  /**
   * |window-ID| for relative="win".
   */
  win: number;
  /**
   * Decides which corner of the float to place at (row,col):
   * * "NW" northwest (default)
   * * "NE" northeast
   * * "SW" southwest
   * * "SE" southeast
   */
  anchor: "NW" | "NE" | "SW" | "SE";
  /**
   * Window width (in character cells). Minimum of 1.
   */
  width: number;
  /**
   * Window height (in character cells). Minimum of 1.
   */
  height: number;
  /**
   * Places float relative to buffer text (only when relative="win"). Takes a tuple of zero-indexed [line, column]. `row` and `col` if given are applied relative to this position, else they default to:
   * * `row=1` and `col=0` if `anchor` is "NW" or "NE"
   * * `row=0` and `col=0` if `anchor` is "SW" or "SE" (thus like a tooltip near the buffer text).
   */
  bufpos: [number, number];
  /**
   * Row position in units of "screen cell height", may be fractional.
   */
  row: number;
  /**
   * Row position in units of "screen cell height", may be fractional.
   */
  col: number;
  /**
   * Enable focus by user actions (wincmds, mouse events). Defaults to true.
   * Non-focusable windows can be entered by |nvim_set_current_win()|.
   */
  focusable: boolean;
  /**
   * GUI should display the window as an external top-level window. Currently accepts no other positioning configuration together with this.
   */
  external: any;
  /**
   * Stacking order. floats with higher `zindex` go on top on floats with lower indices. Must
   * be larger than zero. The following screen elements have hard-coded z-indices:
   * * 100: insert completion popupmenu
   * * 200: message scrollback
   * * 250: cmdline completion popupmenu (when wildoptions+=pum) The default value for floats are 50. In general, values below 100 are recommended, unless there is a good reason to overshadow builtin elements.
   */
  zindex: number;
  /**
   * Configure the appearance of the window.
   *
   * Currently only takes one non-empty value:
   * * "minimal" Nvim will display the window with
   *   many UI options disabled. This is useful
   *   when displaying a temporary float where the
   *   text should not be edited. Disables
   *   'number', 'relativenumber', 'cursorline',
   *   'cursorcolumn', 'foldcolumn', 'spell' and
   *   'list' options. 'signcolumn' is changed to
   *   `auto` and 'colorcolumn' is cleared. The
   *   end-of-buffer region is hidden by setting
   *   `eob` flag of 'fillchars' to a space char,
   *   and clearing the |EndOfBuffer| region in
   *   'winhighlight'.
   */
  style: "minimal";
  /**
   * Style of (optional) window border.
   *
   * This can either be a string or an array. The
   * string values are
   * * "none": No border (default).
   * * "single": A single line box.
   * * "double": A double line box.
   * * "rounded": Like "single", but with rounded
   *   corners ("╭" etc.).
   * * "solid": Adds padding by a single whitespace
   *   cell.
   * * "shadow": A drop shadow effect by blending
   *   with the background.
   * * If it is an array, it should have a length
   *   of eight or any divisor of eight. The array
   *   will specifify the eight chars building up
   *   the border in a clockwise fashion starting
   *   with the top-left corner. As an example, the
   *   double box style could be specified as [
   *   "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" ]. If
   *   the number of chars are less than eight,
   *   they will be repeated. Thus an ASCII border
   *   could be specified as [ "/", "-", "\\", "|"
   *   ], or all chars the same as [ "x" ]. An
   *   empty string can be used to turn off a
   *   specific border, for instance, [ "", "", "",
   *   ">", "", "", "", "<" ] will only make
   *   vertical borders but not horizontal ones. By
   *   default, `FloatBorder` highlight is used,
   *   which links to `WinSeparator` when not
   *   defined. It could also be specified by
   *   character: [ {"+", "MyCorner"}, {"x",
   *   "MyBorder"} ].
   */
  border?: NvimFloatWinBorder;
  /**
   * If true then no buffer-related autocommand events such as |BufEnter|,
   * |BufLeave| or |BufWinEnter| may fire from calling this function.
   */
  noautocmd?: boolean;
}
