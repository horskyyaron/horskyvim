return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Make sure to require 'nvim-tree' first
    local nvim_tree = require "nvim-tree"
    nvim_tree.setup {}

    nvim_tree.setup {
      view = {
        width = 40,
      },
    }

    -- Example keymaps for nvim-tree
    vim.api.nvim_set_keymap(
      "n",
      "<leader>ee",
      ":NvimTreeToggle<CR>",
      { noremap = true, silent = true, desc = "Toggle nvim-tree" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>ef",
      ":NvimTreeFindFile<CR>",
      { noremap = true, silent = true, desc = "Find current file in nvim-tree" }
    )
  end,
}
