local h = require('kui')
local state = require('kui.state')
local cairo = require('kui.cairo.cairo')

h.clear_images()

-- Draw image using cairo

local cell = state.dimensions.cell_pixels
local width  = cell.width  * 40
local height = cell.height * 3
local surface = cairo.image_surface('argb32', width, height)
local cr = surface:context()
-- print(vim.inspect(cairo.enums.CAIRO_ANTIALIAS_))
-- print(vim.inspect(cairo.enums.CAIRO_ANTIALIAS_.gray))
cr:antialias('subpixel')

cr:line_width(2)
cr:rounded_rectangle(0, 0, width, height, 10)
cr:rgba(0.2, 0.2, 0.2, 0.5)
cr:fill_preserve()
cr:rgba(1.0, 0.0, 0.0, 1.0)
cr:stroke()

cr:rgba(1.0, 1.0, 1.0, 1.0)
cr:font_face('JetBrainsMono Nerd Font')
cr:font_size(15)
cr:move_to(cell.width + 0.5, cell.height * 2 + 0.5)
cr:show_text('JetBrainsMono Nerd Font')

surface:flush()

h.add_image(surface, { buffer = 0, row = 0, col = 0 })
