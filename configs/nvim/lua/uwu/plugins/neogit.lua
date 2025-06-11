return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    disable_hint = true,
  },
  cmd = "Neogit",
  keys = {
    {
      "<leader>gg",
      function()
        require("neogit").open({ kind = "replace" })
      end,
      desc = "[neogit] open",
    },
  },
}
