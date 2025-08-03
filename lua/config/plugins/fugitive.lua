return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "gs", "<cmd>tab Git<cr>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gp", "<cmd>Git pull<cr>", { desc = "Git pull" })
      vim.keymap.set("n", "<leader>gP", "<cmd>Git push<cr>", { desc = "Git push" })

      -- some magic on merge conflict
      vim.keymap.set("n", "gl", "<cmd>diffget //3<cr>", { desc = "take right side of conflict" })
      vim.keymap.set("n", "gh", "<cmd>diffget //2<cr>", { desc = "take left side of conflict" })
    end,
  },
}
