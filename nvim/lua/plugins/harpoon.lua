return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local keymap = vim.keymap
      local harpoon = require("harpoon")

      harpoon:setup()

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      keymap.set("n", "<leader>fm", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon window" })

      keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Harpoon add file" })
      keymap.set("n", "<c-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon toggle quick menu" })
      keymap.set("n", "]h", function()
        harpoon:list():next()
      end, { desc = "Harpoon next mark" })
      keymap.set("n", "[h", function()
        harpoon:list():prev()
      end, { desc = "Harpoon previous mark" })
      keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon mark 1" })
      keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon mark 2" })
      keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon mark 3" })
      keymap.set("n", "<leader>3", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon mark 4" })
      keymap.set("n", "<leader>4", function()
        harpoon:list():select(5)
      end, { desc = "Harpoon mark 5" })
      keymap.set("n", "<leader>5", function()
        harpoon:list():select(6)
      end, { desc = "Harpoon mark 6" })
      keymap.set("n", "<leader>6", function()
        harpoon:list():select(7)
      end, { desc = "Harpoon mark 7" })
      keymap.set("n", "<leader>8", function()
        harpoon:list():select(8)
      end, { desc = "Harpoon mark 8" })
      keymap.set("n", "<leader>9", function()
        harpoon:list():select(9)
      end, { desc = "Harpoon mark 9" })
      keymap.set("n", "<leader>10", function()
        harpoon:list():select(10)
      end, { desc = "Harpoon mark 10" })
    end,
  },
}
