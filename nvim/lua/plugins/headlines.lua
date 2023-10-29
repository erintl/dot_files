return {
  {
    "lukas-reineke/headlines.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
