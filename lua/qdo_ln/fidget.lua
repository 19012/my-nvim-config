local M = {
  "j-hui/fidget.nvim",
}

function M.config()
  require("fidget").setup {
    integration = {
      ["nvim-tree"] = {
        enable = true,
      },
    },
    notification = {
      window = {
        normal_hl = "CursorLineNr",
        winblend = 100,
        border = "none",
        zindex = 45,
        max_width = 0,
        max_height = 0,
        x_padding = 1,
        y_padding = 0,
        align = "bottom",
        relative = "editor",
      },
    },
  }
end

return M
