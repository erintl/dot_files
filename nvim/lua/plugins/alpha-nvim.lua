return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      dashboard.leader = "\\"
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New file", "<cmd>ene<CR>"),
        dashboard.button("\\nt", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
        dashboard.button("\\ff", "󰈞  > Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("\\fo", "󰊄  > Recently opened files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("\\fr", "  > Find word", "<cmd>Telescope live_grep_args<CR>"),
        dashboard.button("\\wr", "  > Restore session for current directory", "<cmd>SessionRestore<CR>"),
        dashboard.button("q", "  > Quit NEOVIM", "<cmd>qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  }
}
