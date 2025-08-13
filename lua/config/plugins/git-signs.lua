return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Actions
        -- Stage hunk / selection
        map({ "n", "v" }, "<leader>hs", function()
          if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          else
            gitsigns.stage_hunk()
          end
        end, { desc = "stage hunk / selection" })

        -- Reset hunk / selection
        map({ "n", "v" }, "<leader>hr", function()
          if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          else
            gitsigns.reset_hunk()
          end
        end, { desc = "reset hunk / selection" })

        -- Stage entire buffer
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage entire buffer" })

        -- Undo stage hunk
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })

        -- Reset entire buffer
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset entire buffer" })

        -- Preview hunk
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk" })

        -- Blame current line (full)
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "blame current line (full)" })

        -- Toggle inline blame
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "toggle git blame" })
      end,
    })
  end,
}
