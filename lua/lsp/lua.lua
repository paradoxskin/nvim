require("neodev").setup({
    lspconfig = true,
    override = function() end
})
require("lspconfig").lua_ls.setup({
    on_attach = function() end,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                checkThirdParty = false,
            },
            completion = {
                callSnippet = "Replace"
            }
        }
    }
})
