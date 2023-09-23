vim.cmd [[
  syntax enable
]]

-- vim options
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.textwidth = 0
vim.opt.smartindent = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.wildignore = { ".git", "*/build/*" }
vim.opt.showmode = false
vim.opt.cursorline = true
-- vim.opt.completeopt= { "menuone", "noselect" } 
vim.opt.timeout = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
-- Status
-- vim.opt.laststatus = 2
-- vim.opt.statusline = ''
-- vim.opt.statusline:append('%<')                 -- cut at start
-- vim.opt.statusline:append('%2*[%n%H%M%R%W]%* ') -- buffer number,: and flags
-- vim.opt.statusline:append('%-40f')              -- relative path
-- vim.opt.statusline:append('%=')                 -- seperate between right- and left-aligned
-- vim.opt.statusline:append('%1*%y%*%*')          -- file type
-- vim.opt.statusline:append('%10(L(%l/%L)%) ')    -- line
-- vim.opt.statusline:append('%2(C(%v/125)%) ')    -- column
-- vim.opt.statusline:append('%P')                 -- percentage of file
