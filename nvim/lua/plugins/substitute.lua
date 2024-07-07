return {
  {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    config = function()
      local substitute = require("substitute")
      substitute.setup()

      local keymap = vim.keymap

      keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
      keymap.set("n", "ss", substitute.operator, { desc = "Substitute line" })
      keymap.set("n", "S", substitute.operator, { desc = "Substitute to end of line" })
      keymap.set("x", "s", substitute.operator, { desc = "Substitute in visual mode" })
    end
  },
}
