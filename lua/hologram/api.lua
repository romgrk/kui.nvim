local Image = require('hologram.image')
local vim = _G.vim

local hologram = {}

-- Get all extmarks in viewport (and within winwidth/2 of viewport bounds)
function hologram.get_ext_loclist(buf)
    if buf == 0 then buf = vim.api.nvim_get_current_buf() end
    local top = vim.fn.line('w0')
    local bot = vim.fn.line('w$')

    local view_top = math.floor(math.max(0, top-(bot-top)/2))
    local view_bot = math.floor(bot+(bot-top)/2)

    return vim.api.nvim_buf_get_extmarks(buf,
        vim.g.hologram_extmark_ns,
        {view_top, 0},
        {view_bot, -1},
    {})
end

function hologram.update_images(buf)
    if buf == 0 then buf = vim.api.nvim_get_current_buf() end

    for _, ext_loc in ipairs(hologram.get_ext_loclist(0)) do
        local ext, _, _ = unpack(ext_loc)

        local image = hologram.get_image(buf, ext)
        image:adjust()
    end
end

function hologram.clear_images(buf)
    if buf == 0 then
        buf = vim.api.nvim_get_current_buf()
    end

    for _, image in ipairs(Image.instances) do
        if buf == nil or image.buffer == buf then
            image:delete({ free = true })
        end
    end
end

-- @param data
-- @param opts
function hologram.add_image(data, opts)
    local row = opts.row
    local col = opts.col
    local buf = opts.buf
    if buf == 0 then buf = vim.api.nvim_get_current_buf() end
    local window = buf and vim.fn.bufwinid(buf) or nil

    local image_opts = {
        window = window,
        buffer = buf,
        row = row,
        col = col,
    }

    local img = Image.new(data, image_opts)
    img:transmit()

    return img
end

-- Return image in 'buf' linked to 'ext'
function hologram.get_image(buf, ext)
    if buf == 0 then buf = vim.api.nvim_get_current_buf() end

    local img = nil
    for _, i in ipairs(Image.instances) do
        if i.buffer == buf and i.extmark == ext then
            img = i
        end
    end
    return img
end

function hologram.gen_images(buf, ft)
    if buf == 0 then buf = vim.api.nvim_get_current_buf() end
    ft = ft or vim.bo.filetype

    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    if ft == 'markdown' then
        for row, line in ipairs(lines) do
            local image_link = line:match('!%[.-%]%(.-%)')
            if image_link then
                local source = image_link:match('%((.+)%)')
                hologram.add_image(buf, source, row, 0)
            end
        end
    end
end

function hologram.create_autocmds()
    vim.cmd("augroup Hologram")
    vim.cmd("autocmd!")
    vim.cmd("silent autocmd WinScrolled * :lua require('hologram').update_images(0)")
    vim.cmd("augroup END")
end

return hologram