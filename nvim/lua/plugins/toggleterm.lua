function _G.set_terminal_keymaps()
  local keymap = vim.keymap
  local opts = { buffer = 0 }
  keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
return {
  {
    "akinsho/toggleterm.nvim",
    event = "VimEnter",
    config = function()
      require("toggleterm").setup({
        open_mapping = "<leader>tt",
        direction = "horizontal",
        size = 30,
      })

      local cmd = vim.cmd
      cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
