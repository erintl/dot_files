return {
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<leader>we", "<cmd>SessionSearch<CR>", desc = "Session Search" },
      { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
      { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto-session root dir" },
    },
    config = function()
      local auto_session = require("auto-session")
      auto_session.setup({
        auto_restore_enabled = false,
        auto_session_supress_dirs = { "~/", "~/Downloads", "~/Documents" },
      })

      -- Set custom keymaps
      local keymap = vim.keymap
    end,
  },
}
