vim.opt.nu = true
vim.opt.rnu = true
vim.opt.spr = true
vim.opt.fdm = "manual"
vim.bo.formatoptions = "jcroqlt"
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
vim.cmd[[colorscheme snazzy]]
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.fillchars = {
    fold = "-",
    eob = "~",
    lastline = "@",
    vert = "│"
}
