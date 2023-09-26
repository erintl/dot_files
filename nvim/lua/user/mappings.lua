local set_mappings = function()
  local keymap = vim.keymap
  local opts = { silent = true }

  keymap.set("n", "<localleader>nh", vim.cmd.noh, { desc = 'Hide search highlights' })

  -- Remap for dealing with word wrap
  keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  opts.desc = "Move line up"
  keymap.set("n", "<C-k>", ":m -2<CR>==", opts)

  opts.desc = "Move line down"
  keymap.set("n", "<C-j>", ":m +1<CR>==", opts)

  opts.desc = "Move selection up"
  keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", opts)

  opts.desc = "Move selection down"
  keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", opts)

  opts.desc = "Next buffer"
  keymap.set("n", "]b", "<cmd>bn<CR>", opts)

  opts.desc = "Previous buffer"
  keymap.set("n", "[b", "<cmd>bp<CR>", opts)
end
set_mappings()
