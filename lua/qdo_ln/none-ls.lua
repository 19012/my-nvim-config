local M = {
    "nvimtools/none-ls.nvim"
}

function M.config()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting;
    local diagnostics = null_ls.builtins.diagnostics; -- linting

    null_ls.setup{
        debug = false,
        sources = {
            formatting.stylua,
            formatting.prettier,
            formatting.prettier.with {
                extra_filetype = { "toml" },
                extra_args = { "--no-semi", "--single-quate", "--jsx-single-quote" },
            },
            diagnostics.checkstyle,
            null_ls.builtins.completion.spell,
        }
    }
end

return M;
