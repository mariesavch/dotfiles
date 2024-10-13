return {
  { "nvchad/volt", lazy = true },
  {
    "nvchad/minty",
    cmd = { "Shades", "Huefy" },
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
