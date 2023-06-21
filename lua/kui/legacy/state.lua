local ffi = require('ffi')
local Rectangle = require('kui.legacy.rectangle')

ffi.cdef[[
  typedef struct {
      unsigned short row;
      unsigned short col;
      unsigned short xpixel;
      unsigned short ypixel;
  } winsize;

  int ioctl(int, int, ...);
]]

local state = {
  dimensions = {
    screen = Rectangle.new(0, 0, 0, 0),
    screen_cells = {
      width = 0,
      height = 0,
    },
    screen_pixels = {
      width = 0,
      height = 0,
    },
    cell_pixels = {
      width = 0,
      height = 0,
    },
  }
}

function state.update_dimensions()
  -- Use `ioctl` to retrieve the current window size
  -- https://sw.kovidgoyal.net/kitty/graphics-protocol/#getting-the-window-size

  local TIOCGWINSZ = nil
  if vim.fn.has('linux') == 1 then
      TIOCGWINSZ = 0x5413
  elseif vim.fn.has('mac') == 1 then
      TIOCGWINSZ = 0x40087468
  elseif vim.fn.has('bsd') == 1 then
      TIOCGWINSZ = 0x40087468
  end

  local libc = ffi.load('c')
  local sz = ffi.new('winsize')
  libc.ioctl(1, TIOCGWINSZ, sz)

  state.dimensions.screen_cells.width  = sz.col
  state.dimensions.screen_cells.height = sz.row

  state.dimensions.screen_pixels.width  = sz.xpixel
  state.dimensions.screen_pixels.height = sz.ypixel

  state.dimensions.cell_pixels.width  = sz.xpixel / sz.col
  state.dimensions.cell_pixels.height = sz.ypixel / sz.row

  state.dimensions.screen = Rectangle.new(0, 0, sz.xpixel, sz.ypixel)
end

function state.pixels_to_cells(point)
  local cell_pixels = state.dimensions.cell_pixels
  return {
    x = point.x / cell_pixels.width,
    y = point.y / cell_pixels.height,
  }
end

function state.cells_to_pixels(point)
  local cell_pixels = state.dimensions.cell_pixels
  return {
    x = point.x * cell_pixels.width,
    y = point.y * cell_pixels.height,
  }
end

return state
