return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = trouble.open_with_trouble,
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
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

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")

      -- Setup mappings
      local keymap = vim.keymap
      local builtin = require("telescope.builtin")
      local live_grep_args = require("telescope").extensions.live_grep_args

      keymap.set("n", "<leader>ff", builtin.find_files, {})
      keymap.set("n", "<leader>fr", live_grep_args.live_grep_args, {})
      keymap.set("n", "<leader>fg", builtin.git_files, {})
      keymap.set("n", "<leader>fb", builtin.buffers, {})
      keymap.set("n", "<leader>fh", builtin.help_tags, {})
      keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, {})
      keymap.set("n", "<leader>fo", builtin.oldfiles, {})
      keymap.set("n", "<leader>fw", builtin.grep_string, {})
      keymap.set("n", "<leader>fd", builtin.diagnostics, {})
      keymap.set("n", "<leader>fq", builtin.quickfix, {})
    end,
  },
}
