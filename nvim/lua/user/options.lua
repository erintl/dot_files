vim.cmd [[
  syntax enable
]]

-- vim options
local opt = vim.opt

opt.termguicolors = true
opt.hlsearch = true
opt.ruler = true
opt.showmatch = true
opt.incsearch = true
opt.number = true
opt.backspace = { "indent", "eol", "start" }
opt.textwidth = 0
opt.smartindent = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.expandtab = true
opt.wrap = true
opt.smartcase = true
opt.ignorecase = true
opt.wildignore = { ".git", "*/build/*" }
opt.showmode = false
opt.cursorline = true
-- vim.opt.completeopt= { "menuone", "noselect" } 
opt.timeout = true
opt.updatetime = 250
opt.timeoutlen = 500
opt.breakindent = true
opt.signcolumn = "yes"
opt.background = "dark"
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.list = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
