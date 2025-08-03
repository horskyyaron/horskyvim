print("HORSKYVIM")

-- main entry points of the config
require("config.lazy")
require("config.lsp")
require("config.keymaps")
require("config.autocmd")

-- good options
vim.opt.shiftwidth = 4

-- vim.cmd [[ hi @function.builtin.lua guifg=yellow ]] 
-- hello

-- faster iteration when working on the configuration files.
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", {desc = "source file"})
vim.keymap.set("n", "<space>x", ":.lua<CR>", {desc = "source line"})
vim.keymap.set("v", "<space>x", ":lua<CR>", {desc = "source visual selection"})
