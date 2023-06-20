local ffi = require('ffi')
local Rectangle = require('kui.legacy.rectangle')

ffi.cdef[[
  int ioctl(int fildes, int request, uint16_t *winsize);
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
  state.dimensions.screen_cells.width  = vim.api.nvim_get_option('columns')
  state.dimensions.screen_cells.height = vim.api.nvim_get_option('lines')

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
  local winsize = ffi.new('uint16_t[?]', 4)
  libc.ioctl(0, TIOCGWINSZ, winsize)
  local x_pixels = winsize[2]
  local y_pixels = winsize[3]

  state.dimensions.screen_pixels.width  = x_pixels
  state.dimensions.screen_pixels.height = y_pixels

  state.dimensions.cell_pixels.width  = state.dimensions.screen_pixels.width  / state.dimensions.screen_cells.width
  state.dimensions.cell_pixels.height = state.dimensions.screen_pixels.height / state.dimensions.screen_cells.height

  state.dimensions.screen = Rectangle.new(
    0, 0, state.dimensions.screen_pixels.width, state.dimensions.screen_pixels.height)
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
