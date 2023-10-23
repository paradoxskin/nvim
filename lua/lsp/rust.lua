require'lspconfig'.rust_analyzer.setup{
    on_attach = function() end,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            }
        }
    }
}
