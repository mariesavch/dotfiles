return {
  {
    "nvchad/minty",
    cmd = { "Shades", "Huefy" },
    dependencies = {
      { "nvchad/volt", lazy = true },
    },
    keys = {
      {
        "<leader>s",
        "<cmd>Huefy<cr>",
        desc = "[colorpicker]",
      },
    },
  },
}
