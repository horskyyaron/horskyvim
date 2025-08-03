-- highlight on yanking
-- see :help vim.highlight.on_yank()
-- to check a table we can do `:lua =<table-name>`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Quit keyap for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "qf", "man", "lspinfo", "fugitive", "gitcommit" }, -- Add your desired file types here
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = true })
  end,
})
