return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    {"<leader>ff",function() require("fzf-lua").files() end},
    {"<leader>fc",function() require("fzf-lua").files({cwd = vim.fn.stdpath('config')}) end},
    {"<leader>fw",function() require("fzf-lua").grep() end},
    {"<leader>fW",function() require("fzf-lua").grep_cWORD() end}
  }
}



