-- indentLine
vim.g.indentLine_char = "┆"

-- lightline
vim.g.lightline = {
    colorscheme = 'paradoxskin',
    active = {
        left = {{'filename'}, {'percent'}, {'modified', 'readonly'}},
        right = {{'lineinfo'}, {'bubble'}, {'fileformat', 'fileencoding', 'filetype'}}
    },
    component = {
        bubble = '%{g:bubble}'
    },
}

-- boringBubble.nvim
vim.g.bubble_map = {" ", " "}
vim.g.bubble_len = 3
vim.g.bubble_show = 0

-- gitsign
require('gitsigns').setup{
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '│' },
        topdelete    = { text = '|' },
        changedelete = { text = '|' },
        untracked    = { text = '┆' },
    }
}

-- lsp
require("lsp.all")

-- snippets
vim.g.UltiSnipsExpandTrigger = "<c-e>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-d>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-f>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetDirectories = {"UltiSnips", "~/.config/nvim/UltiSnips"}

-- nvim-cmp
local cmp = require("cmp")
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "ultisnips" },
        }, {
            { name = "buffer" },
            { name = "path" }
        }
    ),
    mapping = cmp.mapping.preset.insert({
            ["<c-e>"] = cmp.mapping(
                function(fallback)
                    fallback()
                end
            ),
            ["<c-d>"] = cmp.mapping(
                function(fallback)
                    fallback()
                end
            ),
            ["<c-f>"] = cmp.mapping(
                function(fallback)
                    fallback()
                end
            ),
            ["<tab>"] = cmp.mapping({
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end
            }),
            ["<s-tab>"] = cmp.mapping({
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end
            }),
        }),
}
