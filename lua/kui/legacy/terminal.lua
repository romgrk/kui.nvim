local utils = require('kui.legacy.utils')
local winpos_to_screenpos = utils.winpos_to_screenpos

local stdout = vim.loop.new_pipe(false)
stdout:open(1)

local terminal = {}

function terminal.write(data)
  if #data == 0 then
    return
  end
  stdout:write(data)
end

function terminal.move_cursor(row, col)
  -- Works by calculating offset between cursor and desired position.
  -- Bypasses need to translate between terminal cols/rows and nvim window cols/rows ;)

  local cur_row, cur_col = unpack(vim.api.nvim_win_get_cursor(0))
  local dr = row - cur_row
  local dc = col - cur_col

  -- Find direction to move in
  local key1, key2

  if dr < 0 then
    key1 = 'A'  -- up
  else
    key1 = 'B'  -- down
  end

  if dc < 0 then
    key2 = 'D' -- right
  else
    key2 = 'C' -- left
  end

  terminal.write('\x1b[s') -- save position
  terminal.write('\x1b[' .. math.abs(dr) .. key1)
  terminal.write('\x1b[' .. math.abs(dc) .. key2)
end

function terminal.move_cursor_to_text(window, row, col)
  local position = winpos_to_screenpos(window, row, col)
  terminal.move_cursor_absolute(position.row, position.col)
end

function terminal.move_cursor_absolute(x, y)
  if y < 0 or x < 0 then
    assert(false, 'Negative position')
  end

  terminal.write('\x1b[s') -- save position
  terminal.write('\x1b[' .. (y + 1) .. ':' .. (x + 1) .. 'H')
end

function terminal.restore_cursor()
  terminal.write('\x1b[u')
end


return terminal
