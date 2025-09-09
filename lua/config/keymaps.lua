local set = vim.keymap.set
local k = vim.keycode

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("n", "n", "nzz", { desc = "centering after next match in search" })

set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Save
set("n", "<leader>w", "<cmd>w<CR>", { desc = "save" })
set("n", "<leader>q", "<cmd>q<CR>", { desc = "save" })

-- Quickfix stuff
set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "quit quickfix" })

-- centering after operations
set("n", "<c-d>", "<c-d>zz", { desc = "scroll down and center" })
set("n", "<c-u>", "<c-u>zz", { desc = "scroll up and center" })

-- Yank and Paste
set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return k("<CR>")
  end
end, { expr = true })

-- diff between two windows
set("n", "<leader>Wd", "<cmd>windo diffthis<cr>", { desc = "window diff" })

-- undotree
set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })

-- will run tmux-sessionizer script
set(
  "n",
  "<C-f>",
  "<cmd>!tmux neww tmux-sessionizer<cr>",
  { desc = "creates new tmux session using tmux-sessionizer script" }
)

set("n", "<leader>lt", "<cmd>LogThisShit<cr>", { desc = "toggle log this shit on/off" })

set("n", "<leader>td", "<cmd>TSToolsGoToSourceDefinition<cr>", { desc = "Go to source definition" })
-- will run nvim-sessionizer script
-- set(
--   "n",
--   "<C-n>",
--   "<cmd>!tmux neww nvim-sessionizer<cr>",
--   { desc = "creates new tmux session using nvim-sessionizer script" }
-- )

-- set("n", "<leader>lt", "<cmd>LogThisShit<cr>", { desc = "toggle log this shit on/off" })

-- yank, comment, paste
vim.keymap.set("n", "ycc", "yygccp", { remap = true })

local fl = require("fzf-lua")
local snacks = require("snacks")
local wk = require("which-key")

-- Diffview nvim utilities function
local function get_default_branch_name()
  local res = vim.system({ "git", "rev-parse", "--verify", "main" }, { capture_output = true }):wait()
  return res.code == 0 and "main" or "master"
end

-- local function toggle_diffview(cmd)
--   if next(require("diffview.lib").views) == nil then
--     vim.cmd(cmd)
--   else
--     vim.cmd("DiffviewClose")
--   end
-- end

wk.add({
  { "<leader>f", group = "Search files" }, -- group
  {
    "<leader>ff",
    function()
      fl.files()
    end,
    desc = "find files",
  },
  {
    "<leader>fc",
    function()
      fl.files({ cwd = vim.fn.stdpath("config") })
    end,
    desc = "find config files",
  },
  {
    "<leader>fg",
    function()
      fl.grep()
    end,
    desc = "grep for a word",
  },
  {
    "<leader>fv",
    function()
      fl.grep_visual()
    end,
    desc = "grep visual selection",
    mode = "v",
  },
  {
    "<leader>fw",
    function()
      fl.grep_cword()
    end,
    desc = "grep word under cursor",
  },
  {
    "<leader>fW",
    function()
      fl.grep_cWORD()
    end,
    desc = "grep WORD under cursor",
  },
  { "<leader>e", group = "File explorer" }, -- group
  { "<leader>g", group = "Git" }, -- group
  {
    "<leader>gb",
    function()
      snacks.gitbrowse()
    end,
    desc = "Git browse",
  },
  { "<leader>d", group = "Diffview" }, -- group
  { "<leader>dd", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
  { "<leader>df", "<cmd>DiffviewFileHistory --follow %<cr>", desc = "File history" },
  { "<leader>ds", "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", desc = "Range History", mode = "v" },
  { "<leader>dl", "<Cmd>.DiffviewFileHistory --follow<CR>", desc = "Line history" },
  { "<leader>dh", "<cmd>DiffviewOpen<cr>", desc = "Diff against HEAD" },
  {
    "<leader>dm",
    function()
      vim.cmd("DiffviewOpen " .. get_default_branch_name())
    end,
    desc = "Diff against local Master",
  },
  {
    "<leader>dM",
    function()
      vim.cmd("DiffviewOpen HEAD..origin/" .. get_default_branch_name())
    end,
    desc = "Diff against remote Master",
  },
})

set("n", "E", function()
  vim.diagnostic.open_float()
end)

set("n", "<C-;>", ":")
