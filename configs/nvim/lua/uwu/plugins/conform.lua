return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixfmt" },
      rust = { "rustfmt" },
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
