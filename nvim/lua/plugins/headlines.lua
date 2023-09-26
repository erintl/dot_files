return {
  {
    "lukas-reineke/headlines.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
