-- indentLine
vim.g.indentLine_char = "┆"
vim.api.nvim_exec("set list lcs=tab:\\┆\\ ", true)
vim.api.nvim_create_autocmd("FileType", {pattern = "json", callback = function()
    vim.api.nvim_command("IndentLinesDisable")
end})

-- lightline
vim.g.lightline = {
    colorscheme = 'paradoxskin',
    active = {
        left = {{'filename'}, {'percent'}, {'modified', 'readonly'}},
        right = {{'lineinfo'}, {'bubble'}, {'fileformat', 'fileencoding', 'filetype'}}
    },
    inactive = {
        left = {{'filename'}, {'percent'}, {'modified', 'readonly'}},
        right = {{'lineinfo'}, {'fileformat', 'fileencoding', 'filetype'}}
    },
    component = {
        bubble = '%{g:bubble}'
    },
}
vim.api.nvim_create_autocmd("TextChanged", {pattern = "*", callback = function()
    vim.api.nvim_call_function("lightline#update", {})
end})

-- cfdufo
require("cfdufo").setup {
    bufline = {
        keybind = "<Leader>s",
        always_top = true,
        winblend = 20,
    },
    fcitx5_support = true
}

-- boringBubble.nvim
require("boringBubble").setup({
    bubble = {
        map = {" ", "󱁂 ", "󰠓 ", "󰐂 ", " ", " ", "󰌽 ", "󰚩 ", "󰣐 ", " "},
        len = 3
    },
    fun = {
        prize = function(number)
            --if vim.g.SnazzyTransparent == 1 then
            --    vim.api.nvim_set_hl(0, "Normal", {bg = "#282a36"})
            --    vim.api.nvim_set_hl(0, "SignColumn", {bg = "#282a36"})
            --    vim.api.nvim_set_hl(0, "DiffAdd", {bg = "#3a3d4d"})
            --    vim.api.nvim_set_hl(0, "DiffDelete", {bg = "#3a3d4d"})
            --    vim.api.nvim_set_hl(0, "DiffChange", {bg = "#3a3d4d"})
            --    vim.api.nvim_set_hl(0, "SignifyLineDelete", {bg = "#282a36"})
            --    vim.api.nvim_set_hl(0, "SignifyLineChange", {bg = "#282a36"})
            --else
            --    vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
            --    vim.api.nvim_set_hl(0, "SignColumn", {bg = "NONE"})
            --    vim.api.nvim_set_hl(0, "DiffAdd", {bg = "NONE"})
            --    vim.api.nvim_set_hl(0, "DiffDelete", {bg = "NONE"})
            --    vim.api.nvim_set_hl(0, "DiffChange", {bg = "NONE"})
            --    vim.api.nvim_set_hl(0, "SignifyLineDelete", {bg = "NONE"})
            --    vim.api.nvim_set_hl(0, "SignifyLineChange", {bg = "NONE"})
            --end
            --vim.g.SnazzyTransparent = 1 - vim.g.SnazzyTransparent
        end
    }
})

-- gitsign
require('gitsigns').setup{
    signs = {
        changedelete = { text = '[' },
    },
    sign_priority = 100
}

-- treesitter
require("nvim-treesitter.configs").setup {
    --ensure_installed = "all",
    ensure_installed = {"lua", "python", "cpp", "javascript", "go", "rust", "markdown", "sql", "java", "bash"},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = { enable = true },
    modules = {},
    indent = { enable = true },
    playground = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = false,
        }
    }
}
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end
vim.opt.fdm = "manual"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
require("nvim-treesitter.parsers").get_parser_configs().pico8 = {
  install_info = {
    url = "https://github.com/paradoxskin/tree-sitter-pico8.git",
    files = {"src/parser.c"},
  },
  filetype = "pico8",
}

-- ranger
require("ranger-nvim").setup{
    enable_cmds = false,
    replace_netrw = false,
    keybinds = {
        ["v"] = "vsplit",
        ["s"] = "split",
        ["e"] = "cur",
    },
    start_bind = "<Leader>ra",
    ui = {
        border = "rounded",
        height = 0.7,
        width = 0.9,
        x = 0.5,
        y = 0.5,
    }
}

-- lsp
require("lsp.all")
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- colorizer
require("colorizer").setup()

-- snippets
vim.g.UltiSnipsExpandTrigger = "<c-e>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-d>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-f>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetDirectories = {"UltiSnips", "~/.config/nvim/UltiSnips"}

-- aerial
require("aerial").setup({
    on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    show_guides = true,
    guides = {
        mid_item = "├─",
        last_item = "╰─",
        nested_top = "│ ",
        whitespace = "  ",
    },
})

-- nvim-cmp
local cmp = require("cmp")
local icons = {
    Function = "󰯻\u{00a0}",
    Snippet = "\u{00a0}",
    Keyword = "u{00a0}",
    Variable = "󰰫\u{00a0}",
    Text = "\u{00a0}",
}
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    preselect = cmp.PreselectMode.None,
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" },
    }, {
            { name = "buffer" },
            { name = "path" }
        }
    ),
    mapping = {
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
        ["<C-j>"] = cmp.mapping.scroll_docs(3),
        ["<C-k>"] = cmp.mapping.scroll_docs(-3),
    },
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = icons[vim_item.kind] or vim_item.kind
            return vim_item
        end,
    },
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal"
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal"
        }
    }
}
