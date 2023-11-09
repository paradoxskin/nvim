-- useful
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.spr = true
vim.opt.fdm = "manual"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.cache/nvim/undo")
vim.bo.formatoptions = "jcroqlt"
vim.opt.mouse = ""
-- clipboard
vim.opt.clipboard = ""
-- case
vim.opt.smartcase = true
vim.opt.ignorecase = true
-- fast
vim.opt.ut = 60
vim.opt.ttimeoutlen = 50
-- tab as space NOTE: do not use in makefile
vim.opt.expandtab = true
vim.opt.tabstop = 6
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- appearance
vim.opt.pumblend = 20
vim.cmd[[colorscheme snazzy]]
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.foldtext = "v:lua.MyFoldText()"
vim.opt.fillchars = {
    fold = " ",
    eob = "~",
    lastline = "@",
    vert = "│"
}
-- function

function Myindent()
    local line_text = vim.fn.getline(".")
    if vim.fn.mode() == "n" and not string.match(line_text, '^[%s\t]*$') then
        return require("nvim-treesitter.indent").get_indent(vim.fn.line("."))
    end
    return -1
end

function MyFoldText()
    local len = 55
    local text = vim.fn.getline(vim.v.foldstart)
    if len <= string.len(text) then
        text = string.sub(text, 1, len - 5) .. ".."
    end
    local cur = vim.fn.line('.')
    if vim.v.foldstart <= cur and cur <= vim.v.foldend then
        text = '▶ ' .. text .. string.rep(' ', math.max(1, len - string.len(text)) - 2) ..'█ 󱛱 ' .. (vim.v.foldend - vim.v.foldstart + 1) .. ' '
    else
        text = text .. string.rep(' ', math.max(1, len - string.len(text))) ..'│  ' .. (vim.v.foldend - vim.v.foldstart + 1) .. ' '
    end
    return text
end
