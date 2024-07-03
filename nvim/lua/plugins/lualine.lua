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
          current_mark = tostring(mark_index)
        end

        return string.format("󱡅 %s/%d", current_mark, total_marks)
      end

      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      })

      lualine.setup({
        options = {
          theme = "catppuccin",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "NvimTree" },
          },
        },
        sections = {
          lualine_c = {
            "filename",
            { symbols.get, cond = symbols.has }
          },
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
