return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end,
    init = function()
      -- Keymaps
      vim.keymap.set("n", "<localleader>nt", "<cmd>NvimTreeToggle<cr>")
      vim.keymap.set("n", "<localleader>nf", "<cmd>NvimTreeFindFile<cr>")
    end,
  },
}
