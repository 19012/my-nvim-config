local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
}

function M.config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "json", "markdown", "bash", "java" }, 
        highlight = { enable = true },
        indent = { enable = true },
    }
end

return M
