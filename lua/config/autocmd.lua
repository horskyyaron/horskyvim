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

local function update_lastmod()
  local ts = os.date("%Y-%m-%dT%H:%M:%S%z"):gsub("(%d%d)(%d%d)$", "%1:%2")

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for i, line in ipairs(lines) do
    if line:match("^lastmod%s=") then
      lines[i] = "lastmod = " .. ts
      break -- stop after first match
    end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

-- keymap for updating the front matter lastmod field to the saving time
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.md", "*.markdown" }, -- adjust patterns as you like
  callback = update_lastmod,
})
