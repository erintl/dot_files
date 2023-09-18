return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    config = function()
      local trouble = require("trouble.providers.telescope")

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            follow = true,
          },
          git_files = {
            show_untracked = true,
          },
        },
      })
    end,
    init = function()
      -- Setup mappings
      local builtin = require('telescope.builtin')
      local live_grep_args = require('telescope').extensions.live_grep_args
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fr', live_grep_args.live_grep_args, {})
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
    end,
  }
}
