return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies =  {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "bash",
          "cmake",
          "cpp",
          "css",
          "dockerfile",
          "embedded_template",
          "git_config",
          "gitcommit",
          "gitignore",
          "gpg",
          "graphql",
          "groovy",
          "html",
          "java",
          "javascript",
          "jq",
          "json",
          "kotlin",
          "latex",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "ruby",
          "scss",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "xml",
          "yaml",
        },
        sync_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-z>',
          },
        },
        textobjects = {
          enable = true,
          lockahead = true,
        }
      })
      require("treesitter-context").setup()

      -- Code Folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false 

      -- Jump to context (upwards)
      local treesitter_context = require("treesitter-context")
      vim.keymap.set("n", "[c", treesitter_context.go_to_context, { silent = true })
    end,
  },
}
