local lspconfig = require("lspconfig")
lspconfig.ccls.setup {
    on_attach = function() end,
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
}
