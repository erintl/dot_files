return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "antosha417/nvim-lsp-file-operations",
      "folke/lazydev.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local mason_lsp_config = require("mason-lspconfig")
      local telescope_builtin = require("telescope.builtin")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local keymap = vim.keymap

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local opts = { buffer = event.buf, noremap = true, silent = true }

          -- Set keybindings
          opts.desc = "Show LSP references"
          keymap.set("n", "gr", telescope_builtin.lsp_references, opts)

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)

          opts.desc = "Show LSP implementation"
          keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gy", telescope_builtin.lsp_type_definitions, opts)

          opts.desc = "Display signature information"
          keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

          opts.desc = "Show document symbols"
          keymap.set("n", "<leader>ds", telescope_builtin.lsp_document_symbols, opts)

          opts.desc = "Show workspace symbols"
          keymap.set("n", "<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, opts)

          opts.desc = "Show available code actions"
          keymap.set({ "n", "v" }, "co", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", function()
            telescope_builtin.diagnostics({ bufnr = 0 })
          end, opts)

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          opts.desc = "Go to previous diagnostic message"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

          opts.desc = "Go to next diagnostic message"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

          opts.desc = "LSP add workspace folder"
          keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, opts)

          opts.desc = "LSP remove workspace folder"
          keymap.set("n", "<leader>lr", vim.lsp.buf.remove_workspace_folder, opts)

          opts.desc = "LSP list workspace folders"
          keymap.set("n", "<leader>ll", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)

          opts.desc = "LSP format buffer"
          keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = "󰠠 ",
          },
          texthl = {
            [vim.diagnostic.severity.ERROR] = "Error",
            [vim.diagnostic.severity.WARN] = "Warn",
            [vim.diagnostic.severity.HINT] = "Hint",
            [vim.diagnostic.severity.INFO] = "Info",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })
      -- Configure language servers
      mason_lsp_config.setup_handlers({
        -- default handlers for installed servers
        function(server_name)
          vim.lsp.config(server_name, {
            capabilities = capabilities,
          })
          vim.lsp.enable(server_name)
        end,
        -- ["ruby_lsp"] = function()
        --   lspconfig["ruby_lsp"].setup({
        --     capabilities = capabilities,
        --     init_options = { formatter = "none" },
        --   })
        -- end,
        -- ["sorbet"] = function()
        --   lspconfig["sorbet"].setup({
        --     capabilities = capabilities,
        --     cmd = { "srb", "tc", "--lsp", "--disable-watchman" },
        --   })
        -- end,
        ["graphql"] = function()
          vim.lsp.config("graphql", {
            capabilities = capabilities,
            settings = {
              ["graphql"] = {
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
              },
            },
          })
          vim.lsp.enable("graphql")
        end,
        ["emmet_ls"] = function()
          vim.lsp.config("emmet_ls", {
            capabilities = capabilities,
            settings = {
              ["emmet_ls"] = {
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
              },
            },
          })
          lspconfig["emmet_ls"].setup({})
          vim.lsp.enable("emmet_ls")
        end,
        ["lua_ls"] = function()
          vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
              ["lua_ls"] = {
                Lua = {
                  -- make the language server recognize "vim" global
                  diagnostics = {
                    globals = { "vim" },
                  },
                  completion = {
                    callSnippet = "Replace",
                  },
                },
              },
            },
          })
          vim.lsp.enable("lua_ls")
        end,
      })
    end,
  },
}
