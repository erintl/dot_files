return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local keymap = vim.keymap
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      require("harpoon").setup()

      keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
      keymap.set("n", "<c-e>", ui.toggle_quick_menu, { desc = "Harpoon toggle quick menu" })
      keymap.set("n", "]h", ui.nav_next, { desc = "Harpoon next mark" })
      keymap.set("n", "[h", ui.nav_prev, { desc = "Harpoon previous mark" })
      keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon mark 1" })
      keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon mark 2" })
      keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon mark 3" })
      keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon mark 4" })
      keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon mark 5" })
      keymap.set("n", "<leader>6", function() ui.nav_file(6) end, { desc = "Harpoon mark 6" })
      keymap.set("n", "<leader>7", function() ui.nav_file(7) end, { desc = "Harpoon mark 7" })
      keymap.set("n", "<leader>8", function() ui.nav_file(8) end, { desc = "Harpoon mark 8" })
      keymap.set("n", "<leader>9", function() ui.nav_file(9) end, { desc = "Harpoon mark 9" })
      keymap.set("n", "<leader>0", function() ui.nav_file(0) end, { desc = "Harpoon mark 10" })
    end,
  },
}
