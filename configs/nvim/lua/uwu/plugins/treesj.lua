return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = { { "J", "<cmd>TSJToggle<cr>", desc = "[join] toggle" } },
  opts = { use_default_keymaps = false, max_join_length = 150 },
}
