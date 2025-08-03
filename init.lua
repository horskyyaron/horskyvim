print("HORSKYVIM")

require("config.lazy")
require("config.lsp")

-- good options
vim.opt.shiftwidth = 4

-- vim.cmd [[ hi @function.builtin.lua guifg=yellow ]] 
-- hello

--Plan
--oil
--file tree
--git signs
--fugitive
--laygit?

-- faster iteration when working on the configuration files.
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- some keymaps 
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Yank and Paste
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })


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
