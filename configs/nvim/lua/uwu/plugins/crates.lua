return {
  "saecki/crates.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufRead Cargo.toml",
  opts = {
    text = {
      loading = "  loading ",
      searching = "  searching ",
      version = "  %s ",
      prerelease = "  %s ",
      yanked = "  %s ",
      nomatch = "  no match ",
      upgrade = "  %s ",
      error = "  error fetching crate ",
    },
    lsp = {
      enabled = true,
      name = "crates",
      actions = true,
      completion = true,
      hover = true,
    },
    completion = {
      text = {
        prerelease = " pre-release",
      },
      blink = {
        kind_icon = {
          version = "",
          feature = "",
        },
      },
    },
    popup = {
      text = {
        pill_left = " ",
        pill_right = " ",
        prerelease = "  %s ",
      },
    },
  },
}
