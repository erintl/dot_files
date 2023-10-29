return {
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("symbols-outline").setup()

      local keymap = vim.keymap
      local opts = { desc = "Toggle symbols outline" }
      keymap.set("n", "<localleader>so", "<cmd>SymbolsOutline<CR>", opts)
    end,
  },
}
