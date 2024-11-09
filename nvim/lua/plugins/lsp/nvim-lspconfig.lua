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
          keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)

          opts.desc = "LSP remove workspace folder"
          keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

          opts.desc = "LSP list workspace folders"
          keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)

          opts.desc = "LSP format buffer"
          keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- Setup gutter LSP diagnotic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Configure language servers
      mason_lsp_config.setup_handlers({
        -- default handlers for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["ruby_lsp"] = function()
          lspconfig["ruby_lsp"].setup({
            capabilities = capabilities,
            init_options = { formatter = "none" },
          })
        end,
        ["sorbet"] = function()
          lspconfig["sorbet"].setup({
            capabilities = capabilities,
            cmd = { "srb", "tc", "--lsp", "--disable-watchman" },
          })
        end,
        ["graphql"] = function()
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,
        ["emmet_ls"] = function()
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
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
          })
        end,
      })
    end,
  },
}
