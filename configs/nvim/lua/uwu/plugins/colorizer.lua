return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    filetypes = { "*", "!prompt", "!popup" },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      AARRGGBB = false,
      rgb_fn = false,
      hsl_fn = false,
      css = false,
      css_fn = false,
      tailwind = false,
      mode = "background",
    },
    buftypes = {},
  },
}
