-- custom function
local keybind = function(line)
    local mode = line.mode
    if mode == nil then
        mode = "n"
    end
    if line.opts ~= nil then
        vim.keymap.set(mode, line.from, line.to, line.opts)
    else
        vim.keymap.set(mode, line.from, line.to)
    end
end

function TriggerDiagonstic()
    if vim.diagnostic.is_disabled() then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end

-- maplist
vim.g.mapleader = " "
local maplist = {
    --full: {from = "", to = "", mode = "" or {"", ""} [, opts = {}] },
    --short: {from = "", to = ""},

    -- misc
    {from = "s", to = ":edit "},
    {from = "S", to = ":vsp "},
    {from = "H", to = "0", mode = {"n", "v"}},
    {from = "L", to = "$", mode = {"n", "v"}},
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

    -- lsp
    {from = "<Leader>g", to = ""}, -- jump TODO
    {from = "<Leader>d", to = ":lua TriggerDiagonstic()<CR>"},
    {from = "<Leader>K", to = ":lua vim.lsp.buf.hover()<CR>"},
    {from = "-", to = ":lua vim.diagnostic.goto_next()<CR>"},
    {from = "_", to = ":lua vim.diagnostic.goto_prev()<CR>"},

}

-- bind
local exec = function()
    for _, line in ipairs(maplist) do
        keybind(line)
    end
end

exec()
