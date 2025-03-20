return {
  "pimalaya/himalaya-vim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = true,
  keys = {
    {
      "<leader>h",
      "<cmd>Himalaya<cr>",
      desc = "[himalaya]",
    },
  },
}
