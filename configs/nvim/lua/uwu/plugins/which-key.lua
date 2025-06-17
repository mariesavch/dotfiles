return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>f", group = "[telescope]" },
      { "<leader>g", group = "[git]" },
      { "<leader>l", group = "[lsp]" },
      { "<leader>v", group = "[note]" },
    })

    wk.setup({
      icons = {
        breadcrumb = "",
        separator = "",
        group = " ",
        mappings = false,
      },
      show_help = false,
      show_keys = false,
    })
  end,
}
