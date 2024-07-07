return {
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")
      local cmp = require("cmp")
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        }
      })
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
