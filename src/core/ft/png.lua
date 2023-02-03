local api = require('kui.api')

local m = {}

function m.enable()
  vim.cmd("augroup Hologram_PNG")
  vim.cmd("autocmd!")
  vim.cmd("autocmd BufReadCmd  *.png :lua require('kui.ft.png').on_read()")
  vim.cmd("autocmd BufWriteCmd *.png :lua require('kui.ft.png').on_write()")
  vim.cmd("augroup END")
end

function m.disable()
  vim.cmd("augroup Hologram_PNG")
  vim.cmd("autocmd!")
  vim.cmd("augroup END")
end

function m.on_read()
  local filepath = vim.fn.fnamemodify(vim.fn.bufname(), ':p')

  vim.api.nvim_buf_set_lines(0, 0, 0, false, {'PNG file: ' .. filepath})
  vim.defer_fn(function()
    api.add_image(filepath, { buffer = 0, row = 1, col = 0 })
  end, 100)
end

function m.on_write()
  -- empty
end

return m
