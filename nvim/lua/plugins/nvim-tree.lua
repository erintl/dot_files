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

      -- Keymaps
      local keymap = vim.keymap
      local opts = {}

      opts.desc = "Nvim Tree toggle"
      keymap.set("n", "<localleader>nt", "<cmd>NvimTreeToggle<CR>", opts)

      opts.desc = "Nvim Tree find file toggle"
      keymap.set("n", "<localleader>nf", "<cmd>NvimTreeFindFileToggle<CR>", opts)
    end,
  },
}
