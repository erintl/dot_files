return {
  {
    "0x00-ketsu/maximizer.nvim",
    lazy = true,
    config = true,
    keys = {
      {
        "<leader>mt",
        '<cmd>lua require("maximizer").toggle()<cr>',
        desc = "Toggle maximize window",
        silent = true,
      },
      {
        "<leader>mm",
        '<cmd>lua require("maximizer").maximize()<cr>',
        desc = "Maximize window",
        silent = true,
      },
      {
        "<leader>mr",
        '<cmd>lua require("maximizer").restore()<cr>',
        desc = "Restore window",
        silent = true,
      },
    },
  },
}
