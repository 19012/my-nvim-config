local M = {
  "nvim-lualine/lualine.nvim",
}

function ObsStatus()
  return string.format("%s", vim.fn.ObsessionStatus("Ⓡ", "ⓟ"))
end

function M.config()
  local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
  local icons = require "qdo_ln.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  require("lualine").setup {
    options = {
      icons_enable = true,
      theme = "tokyonight",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "filename",
          path = 1,
          shorting_target = 100,
        },
        "diff",
        "diagnostics",
      },
      lualine_c = { "branch" },
      lualine_x = { ObsStatus, "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
