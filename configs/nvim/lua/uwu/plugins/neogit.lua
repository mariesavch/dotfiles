return {
  "neogitorg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    disable_hint = true,
  },
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
