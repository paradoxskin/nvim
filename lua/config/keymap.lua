-- maplist
vim.g.mapleader = " "
local maplist = {
    --full: {from = "", to = "", mode = "" or {"", ""} [, opts = {}] },
    --short: {from = "", to = ""},

    -- misc
    {from = "s", to = ":edit "},
    {from = "S", to = ":vsp "},
    {from = "H", to = "0", mode = {"n", "v"}},
        -- TODO some problem in undo
        {from = "J", to = ":m '>+1<CR>gv=gv", mode = {"v"}},
        {from = "K", to = ":m '<-2<CR>gv=gv", mode = {"v"}},
    {from = "L", to = "$", mode = {"n", "v"}},
    {from = "<S-Tab>", to = "<C-d>", mode = "i"},

    -- leader-base
    {from = "<Leader>h", to = "<C-w>h"},
    {from = "<Leader>j", to = "<C-w>j"},
    {from = "<Leader>k", to = "<C-w>k"},
    {from = "<Leader>l", to = "<C-w>l"},
    {from = "<Leader>f", to = "<C-o>"},
    {from = "<Leader>n", to = "<cmd>bn<CR>"},
    {from = "<Leader>N", to = "<cmd>bp<CR>"},
    {from = "<Leader>C", to = "<cmd>bd!<CR>"},
    {from = "<Leader>i", to = "g<C-g>", mode = "v"},
    {from = "<Leader>z", to = "<cmd>set invcursorline<CR>"},
    {from = "<Leader>2", to = "@q"},
    {from = "<Leader>a", to = "mTggVG"},
    {from = "<Leader>b", to = "`Tzz"},
    {from = "<Leader><CR>", to = "<cmd>set invhlsearch<CR>"},
    {from = "<Leader>M", to = ""},

    -- ctrl
    {from = "<C-z>", to = ":qa!"},
    {from = "<C-p>", to = "mT\"+p"},
    {from = "<C-y>", to = "mTggVG\"+y"},
    {from = "<C-y>", to = "mT\"+y", mode = "v"},

    -- snazzy
    {from = "<Leader>Z", to = function()
        if vim.g.SnazzyTransparent == 1 then
            vim.api.nvim_set_hl(0, "Normal", {bg = "#282a36"})
            vim.api.nvim_set_hl(0, "SignColumn", {bg = "#282a36"})
            vim.api.nvim_set_hl(0, "DiffAdd", {bg = "#3a3d4d"})
            vim.api.nvim_set_hl(0, "DiffDelete", {bg = "#3a3d4d"})
            vim.api.nvim_set_hl(0, "DiffChange", {bg = "#3a3d4d"})
            vim.api.nvim_set_hl(0, "SignifyLineDelete", {bg = "#282a36"})
            vim.api.nvim_set_hl(0, "SignifyLineChange", {bg = "#282a36"})
        else
            vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
            vim.api.nvim_set_hl(0, "SignColumn", {bg = "NONE"})
            vim.api.nvim_set_hl(0, "DiffAdd", {bg = "NONE"})
            vim.api.nvim_set_hl(0, "DiffDelete", {bg = "NONE"})
            vim.api.nvim_set_hl(0, "DiffChange", {bg = "NONE"})
            vim.api.nvim_set_hl(0, "SignifyLineDelete", {bg = "NONE"})
            vim.api.nvim_set_hl(0, "SignifyLineChange", {bg = "NONE"})
        end
        vim.g.SnazzyTransparent = 1 - vim.g.SnazzyTransparent
    end},

    -- lsp
    {from = "<Leader>g", to = "<cmd>lua vim.lsp.buf.definition()<CR>"}, -- jump float quickfix TODO
    {from = "<Leader>d", to = "<cmd>lua TriggerDiagonstic()<CR>"},
    {from = "<Leader>rn", to = "<cmd>lua vim.lsp.buf.rename()<CR>"},
    {from = "<Leader>K", to = "<cmd>lua vim.lsp.buf.hover()<CR>"},
    {from = "-", to = "<cmd>lua vim.diagnostic.goto_next()<CR>"},
    {from = "_", to = "<cmd>lua vim.diagnostic.goto_prev()<CR>"},

    -- telescope
    {from = "<Leader><space>", to = "<cmd>Telescope buffers<CR>"},
    {from = "<Leader>;;", to = "<cmd>Telescope<CR>"},
    {from = "<Leader>;/", to = "<cmd>Telescope current_buffer_fuzzy_find<CR>"},
    {from = "<Leader>;`", to = "<cmd>Telescope oldfiles<CR>"},
    {from = "<Leader>;g", to = "<cmd>Telescope live_grep<CR>"},
    {from = "<Leader>;f", to = "<cmd>Telescope find_files<CR>"},
    {from = "<Leader>;-", to = "<cmd>Telescope diagnostics<CR>"},
    {from = "<Leader>;a", to = "<cmd>Telescope aerial<CR>"},

    -- aerial
    {from = "<Leader>a", to = "<cmd>AerialToggle!<CR>"},

    -- fun
    {from = "<Leader>;0", to = "<cmd>CellularAutomaton make_it_rain<CR>"},

    -- execute
    {from = "<Leader>;]", to = "<cmd>call system('pico8 -run '..expand('%')..' &')<CR>"}

}

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

local exec = function()
    for _, line in ipairs(maplist) do
        keybind(line)
    end
end


-- bind
exec()
