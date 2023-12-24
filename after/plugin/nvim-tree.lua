-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?',      api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'l',      api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'h',      api.node.navigate.parent_close,        opts('Close'))

end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort = {
        sorter = "name",
    },
    view = {
        width = 30,
        side = "left",
        number = true,
        relativenumber = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
     git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
})
