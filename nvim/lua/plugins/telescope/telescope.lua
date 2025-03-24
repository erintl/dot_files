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
      "folke/todo-comments.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open
      local add_to_trouble = require("trouble.sources.telescope").add

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<c-o>"] = open_with_trouble,
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = { ["<c-o>"] = open_with_trouble },
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

      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")

      -- Setup mappings
      local keymap = vim.keymap
      local builtin = require("telescope.builtin")
      local live_grep_args = telescope.extensions.live_grep_args
      local opts = {}

      opts.desc = "Telescope find files"
      keymap.set("n", "<leader>ff", builtin.find_files, opts)

      opts.desc = "Telescope live grep args"
      keymap.set("n", "<leader>fr", live_grep_args.live_grep_args, opts)

      opts.desc = "Telescope git files"
      keymap.set("n", "<leader>fg", builtin.git_files, opts)

      opts.desc = "Telescope buffers"
      keymap.set("n", "<leader>fb", builtin.buffers, opts)

      opts.desc = "Telescope help tags"
      keymap.set("n", "<leader>fh", builtin.help_tags, opts)

      opts.desc = "Telescope current buffer fuzzy find"
      keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, opts)

      opts.desc = "Telescope old files"
      keymap.set("n", "<leader>fo", builtin.oldfiles, opts)

      opts.desc = "Telescope grep string"
      keymap.set("n", "<leader>fw", builtin.grep_string, opts)

      opts.desc = "Telescope diagnostics"
      keymap.set("n", "<leader>fd", builtin.diagnostics, opts)

      opts.desc = "Telescope quickfix"
      keymap.set("n", "<leader>fq", builtin.quickfix, opts)

      opts.desc = "Telescope colorscheme"
      keymap.set("n", "<leader>fs", function()
        builtin.colorscheme({ enable_preview = true })
      end, opts)

      opts.desc = "Telescope find TODOs"
      keymap.set("n", "<localleader>ft", "<cmd>TodoTelescope<cr>", opts)
    end,
  },
}
