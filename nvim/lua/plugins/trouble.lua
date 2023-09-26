return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local trouble = require('trouble')
      trouble.setup()

      local keymap = vim.keymap
      local opts = {}

      opts.desc = "Open trouble"
      keymap.set("n", "<leader>xx", function() trouble.open() end, opts)

      opts.desc = "Trouble workspace diagnostics"
      keymap.set("n", "<leader>xw", function() trouble.open("workspace_diagnostics") end, opts)

      opts.desc = "Trouble document diagnostics"
      keymap.set("n", "<leader>xd", function() trouble.open("document_diagnostics") end, opts)

      opts.desc = "Trouble quickfix"
      keymap.set("n", "<leader>xq", function() trouble.open("quickfix") end, opts)

      opts.desc = "Trouble location list"
      keymap.set("n", "<leader>xl", function() trouble.open("loclist") end, opts)

      opts.desc = "Trouble LSP references"
      keymap.set("n", "gR", function() trouble.open("lsp_references") end, opts)
    end,
  },
}
