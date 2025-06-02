return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp_server_on_attach = require("core/lsp_config").on_attach

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { current_line = true },
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
      vim.lsp.config("*", {
        on_attach = lsp_server_on_attach,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      -- vim.lsp.config.graphql = {
      --   filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      -- }

      -- vim.enable(require("core/lsp_config").default_lsp_servers)
    end,
  },
}
