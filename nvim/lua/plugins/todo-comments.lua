return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    config = function()
      local todo_comments = require("todo-comments")
      local keymap = vim.keymap

      keymap.set(
        "n",
        "]t",
        function()
          todo_comments.jump_next()
        end,
        { desc = "Next TODO comment" }
      )

      keymap.set(
        "n",
        "[t",
        function()
          todo_comments.jump_prev()
        end,
        { desc = "Previous TODO comment" }
      )

      todo_comments.setup()
    end,
  },
}
