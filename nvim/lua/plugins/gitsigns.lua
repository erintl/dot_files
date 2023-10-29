return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local keymap = vim.keymap

        keymap.set("n", "<leader>ph", gs.preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })

        -- don't override the built-in and fugitive keymaps
        keymap.set(
          { "n", "v" },
          "]c",
          function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end,
          { expr = true, buffer = bufnr, desc = "Jump to next hunk" }
        )
        keymap.set(
          { "n", "v" },
          "[c",
          function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" }
        )
      end,
    },
  },
}
