return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "j-hui/fidget.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local telescope_builtin = require("telescope.builtin")
      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

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
        keymap.set("n", "<leader>D", function() telescope_builtin.diagnostics({ bufnr = 0 }) end, opts)

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
        keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

        opts.desc = "LSP format buffer"
        keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({async = true}) end, opts)
      end

      -- Setup gutter LSP diagnotic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Configure language servers

      -- configure html server
      lspconfig["solargraph"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/solargraph", 'stdio' },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      })

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      lspconfig["tsserver"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure tailwindcss server
      -- lspconfig["tailwindcss"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- configure svelte server
      -- lspconfig["svelte"].setup({
      --   capabilities = capabilities,
      --   on_attach = function(client, bufnr)
      --     on_attach(client, bufnr)
      --
      --     vim.api.nvim_create_autocmd("BufWritePost", {
      --       pattern = { "*.js", "*.ts" },
      --       callback = function(ctx)
      --         if client.name == "svelte" then
      --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      --         end
      --       end,
      --     })
      --   end,
      -- })

      -- configure graphql language server
      lspconfig["graphql"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      })

      -- configure emmet language server
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      -- configure python server
      lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            telemetry = { enable = false },
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
  },
}
