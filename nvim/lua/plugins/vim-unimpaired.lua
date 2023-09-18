return {
  {
    "tpope/vim-unimpaired",
    init = function()
      vim.keymap.set("n", "<C-k>", "<Plug>(unimpaired-move-up)", { silent = true })
      vim.keymap.set("n", "<C-j>", "<Plug>(unimpaired-move-down)", { silent = true })
      vim.keymap.set("x", "<C-k>", "<Plug>(unimpaired-move-selection-up)<esc>gv", { silent = true })
      vim.keymap.set("x", "<C-j>", "<Plug>(unimpaired-move-selection-down)<esc>gv", { silent = true })
    end,
  },
}
