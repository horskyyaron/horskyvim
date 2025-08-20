-- lua/plugins/fzf-lua.lua (example path)
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local actions = require("fzf-lua.actions")
    return {
      winopts = { backdrop = 85 },
      keymap = {
        builtin = {
          ["<C-f>"] = "preview-page-down",
          ["<C-b>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-a"] = "toggle-all",
          ["ctrl-t"] = "first",
          ["ctrl-g"] = "last",
          ["ctrl-d"] = "half-page-down",
          ["ctrl-u"] = "half-page-up",
        },
      },
      actions = {
        files = {
          ["ctrl-q"] = actions.file_sel_to_qf,
          ["ctrl-h"] = actions.toggle_hidden,
          ["enter"] = actions.file_edit_or_qf,
        },
      },
    }
  end,
  -- (optional) explicit, Lazy usually does this for you:
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,
}
