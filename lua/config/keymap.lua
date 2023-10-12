vim.g.mapleader = " "
local maplist = {
    --full: {from = "", to = "", mode = "" or {"", ""} [, opts = {}] },
    --short: {from = "", to = ""},

    -- misc
    {from = "s", to = ":edit "},
    {from = "S", to = ":vsp "},
    {from = "H", to = "0"},
    {from = "L", to = "$"},
    {from = "<S-Tab>", to = "<C-d>", mode = "i"},

    -- leader
    {from = "<Leader>h", to = "<C-w>h"},
    {from = "<Leader>j", to = "<C-w>j"},
    {from = "<Leader>k", to = "<C-w>k"},
    {from = "<Leader>l", to = "<C-w>l"},
    {from = "<Leader>f", to = "<C-o>"},
    {from = "<Leader>n", to = ":bn<CR>"},
    {from = "<Leader>N", to = ":bp<CR>"},
    {from = "<Leader>C", to = ":bd!<CR>"},
    {from = "<Leader>i", to = "g<C-g>", mode = "v"},
    {from = "<Leader>z", to = ":set invcursorline<CR>"},
    {from = "<Leader>2", to = "@q"},
    {from = "<Leader>a", to = "mTggVG"},
    {from = "<Leader>b", to = "`Tzz"},
    {from = "<Leader><CR>", to = ":set nohlsearch<CR>"},

    -- ctrl
    {from = "<C-z>", to = ":qa!"},
    {from = "<C-p>", to = "mT\"+p"},
    {from = "<C-y>", to = "mTggVG\"+y"},
    {from = "<C-y>", to = "mT\"+y", mode = "v"},

}

exec = function()
    for _, line in ipairs(maplist) do
        keybind(line)
    end
end

function keybind(line)
    mode = line.mode
    if mode == nil then
        mode = "n"
    end
    if line.opts ~= nil then
        vim.keymap.set(mode, line.from, line.to, line.opts)
    else
        vim.keymap.set(mode, line.from, line.to)
    end
end
exec()
