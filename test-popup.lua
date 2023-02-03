local Popup = require('nui.popup')
local event = require('nui.utils.autocmd').event

local h = require('kui')
local state = require('kui.state')
local cairo = require('kui.cairo.cairo')

local popup = Popup({
  enter = true,
  focusable = true,
  border = {
    renderer = 'image',
    style = 'rounded',
  },
  position = '10%',
  size = {
    width = 40,
    height = 15,
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
})

-- mount/open the component
popup:mount()

-- unmount component when cursor leaves buffer
popup:on(event.BufLeave, function()
  popup:unmount()
end)

-- set content
vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { 'Hello World' })
-- print(vim.inspect(popup))
