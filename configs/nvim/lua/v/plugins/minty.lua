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
        desc = "[colorpicker] huefy",
      },
      {
        "<leader>sg",
        "<cmd>Shades<cr>",
        desc = "[colorpicker] shades",
      },
    },
  },
}
