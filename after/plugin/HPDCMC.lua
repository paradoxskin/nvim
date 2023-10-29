-- HEY PLUGINS DONT CHANGE MY CONFIG ! --
vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        pattern = "*",
        command = "silent! loadview|set indentexpr=v:lua.Myindent()"
    }
)
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "*",
        command = "set indentexpr=v:lua.Myindent()"
    }
)
vim.api.nvim_create_autocmd(
    "BufWinLeave",
    {
        pattern = "*",
        command = "silent! mkview"
    }
)
vim.api.nvim_create_autocmd(
    "TermEnter",
    {
        pattern = "*",
        command = "IndentLinesDisable"
    }
)
