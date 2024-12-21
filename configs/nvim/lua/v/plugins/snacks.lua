return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    words = { enabled = true },
    dashboard = {
      sections = {
        { title = "recent files", section = "recent_files", limit = 10, padding = 1 },
        { title = "projects", section = "projects", limit = 10, padding = 1 },
      },
    },
  },
}
