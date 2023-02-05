local ffi = require('ffi')
local Rectangle = require('kui.legacy.rectangle')


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
  if vim.fn.executable('kitty') ~= 1 then
    vim.api.nvim_err_writeln('Unable to find Kitty executable')
    return
  end

  state.dimensions.screen_cells = {
    width  = vim.api.nvim_get_option('columns'),
    height = vim.api.nvim_get_option('lines'),
  }

  -- Use `ioctl` to retrieve the current window size
  -- https://sw.kovidgoyal.net/kitty/graphics-protocol/#getting-the-window-size

  local TIOCGWINSZ = 0x5413
  ffi.cdef[[
    int ioctl(int fildes, int request, uint16_t *winsize);
  ]]
  local libc = ffi.load('c')
  local winsize = ffi.new('uint16_t[?]', 4)
  libc.ioctl(0, TIOCGWINSZ, winsize)
  local x_pixels = winsize[2]
  local y_pixels = winsize[3]

  state.dimensions.screen_pixels.width  = x_pixels
  state.dimensions.screen_pixels.height = y_pixels

  state.dimensions.cell_pixels = {
    width  = state.dimensions.screen_pixels.width  / state.dimensions.screen_cells.width,
    height = state.dimensions.screen_pixels.height / state.dimensions.screen_cells.height,
  }

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
