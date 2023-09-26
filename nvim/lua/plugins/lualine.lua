return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ThePrimeagen/harpoon",
    },
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status")
      local harpoon_mark = require("harpoon.mark")
      local harpoon_status = function()
        local total_marks = harpoon_mark.get_length()
        if total_marks == 0 then
          return ""
        end

        local current_mark = "-"
        local mark_index = harpoon_mark.get_current_index()
        if mark_index ~= nil then
          current_mark  = tostring(mark_index)
        end

        return string.format("󱡅 %s/%d", current_mark, total_marks)
      end

      lualine.setup({
        options = {
          theme = "tokyonight",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "NvimTree" },
          },
        },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "ff9e64" },
            },
            harpoon_status,
            "encoding",
            "fileformat",
            "filetype",
          },
        },
      })
    end,
  },
}
