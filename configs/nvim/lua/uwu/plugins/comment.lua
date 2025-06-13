return {
  "numtostr/comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = {
    padding = true,
    sticky = true,
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
    mappings = { basic = true, extra = true, extended = false },
  },
}
