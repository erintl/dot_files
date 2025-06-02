local M = {}

-- List of servers to automotically install, configure, and enable.
--- @type string[]
M.default_lsp_servers = {
  "ts_ls",
  "html",
  "cssls",
  "lua_ls",
  "graphql",
  "emmet_ls",
  "pyright",
  "ruby_lsp",
  "sorbet",
}

function M.on_attach(_, bufnr)
  -- default options
  --- @param modes string|string[]
  --- @param lhs string
  --- @param rhs string|function
  --- @param opts? table
  local function set(modes, lhs, rhs, opts)
    local defaults = { noremap = true, silent = true, buffer = bufnr }
    local local_opts = vim.tbl_deep_extend("force", defaults, opts or {})

    vim.keymap.set(modes, lhs, rhs, local_opts)
  end
  local telescope_builtin = require("telescope.builtin")

  -- Set keybindings
  set("n", "gr", telescope_builtin.lsp_references, { desc = "Go to LSP references" })
  set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
  set("n", "gd", telescope_builtin.lsp_implementations, { desc = "Show LSP definitions" })
  set("n", "gi", telescope_builtin.lsp_implementations, { desc = "Show LSP implementation" })
  set("n", "gy", telescope_builtin.lsp_type_definitions, { desc = "Show LSP type definitions" })
  set("n", "gs", function()
    vim.buf.signature_help({ border = "rounded" })
  end, { desc = "Display signature information" })
  set("n", "<leader>ds", telescope_builtin.lsp_document_symbols, { desc = "Show document symbols" })
  set("n", "<leader>ws", telescope_builtin.lsp_workspace_symbols, { desc = "Show workspace symbols" })
  set({ "n", "v" }, "co", vim.lsp.buf.code_action, { desc = "Show available code actions" })
  set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
  set("n", "<leader>D", function()
    telescope_builtin.diagnostics({ bufnr = 0 })
  end, { desc = "Show buffer diagnostics" })
  set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
  set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, { desc = "Go to previous diagnostic message" })
  set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, { desc = "Go to previous diagnostic message" })
  set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end, { desc = "LSP signature help" })
  set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
  set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, { desc = "LSP add workspace folder" })
  set("n", "<leader>lr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP remove workspace folder" })
  set("n", "<leader>ll", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "LSP list folders" })
  set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "LSP format buffer" })
end

return M
