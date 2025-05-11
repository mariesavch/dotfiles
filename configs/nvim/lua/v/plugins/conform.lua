return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format()
      end,
      desc = "[lsp] format",
    },
  },
  opts = {
    formatters_by_ft = {
      json = { "dprint" },
      jsonc = { "dprint" },
      markdown = { "dprint" },
      fish = { "fish_indent" },
      lua = { "stylua" },
      nix = { "nixfmt" },
      rust = { "rustfmt" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      dxfmt = {
        command = "dx",
        args = { "fmt", "-f", "-" },
        stdin = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
}
