return {
  {
    "nvchad/minty",
    cmd = { "Shades", "Huefy" },
    dependencies = {
      { "nvchad/volt", lazy = true },
    },
    keys = {
      {
        "<leader>sh",
        "<cmd>Huefy<cr>",
        desc = "[color picker] huefy",
      },
      {
        "<leader>sg",
        "<cmd>Shades<cr>",
        desc = "[color picker] shades",
      },
    },
  },
}
