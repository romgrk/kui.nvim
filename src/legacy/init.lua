local api = require('kui.api')
local png = require('kui.ft.png')
local state = require('kui.state')

local did_init = false

local function initialize()
  if did_init then
    return
  end

  vim.g.kui_extmark_ns = vim.api.nvim_create_namespace('kui_extmark')

  api.create_autocmds()
  state.update_dimensions()

  did_init = true
end

local function setup(opts)
  -- opts unused for now

  initialize()

  png.enable()
end

return vim.tbl_extend('keep', api, {
  setup = setup,
})
