return {
  {
    "vim-test/vim-test",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.g["test#strategy"] = "toggleterm"
    end,
    keys = {
      { "<leader>rb", "<cmd>TestFile<cr>", desc = "Run all tests in file" },
      { "<leader>rf", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>rl", "<cmd>TestLast<cr>", desc = "Re-run last test" },
    },
  },
}
