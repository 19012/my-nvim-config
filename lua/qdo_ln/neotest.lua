local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "rcasia/neotest-java",
    "rcasia/neotest-bash",
  },
}

function M.config()
    require("neotest").setup {
    adapters = {
        require "neotest-java" {
                dap = { justMyCode = false },
            },
        require "neotest-vim-test" {
            iignore_file_types = { "java", "vim" , "lua", "javascript", "typescript" },
        },
    },
}
end

return M;
