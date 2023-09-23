return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup()

      -- Keymaps
      local keymap = vim.keymap
      keymap.set("n", "<localleader>nt", "<cmd>NvimTreeToggle<cr>")
      keymap.set("n", "<localleader>nf", "<cmd>NvimTreeFindFile<cr>")
    end,
  },
}
