local map = vim.keymap.set

map("n", "<leader>q", "<CMD>bd<CR>", { desc = "[buffer] close current" })
map("n", "<leader>Q", "<CMD>%bd|e#|bd#<CR>", { desc = "[buffer] close other" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "[search] clear" })

map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "[lazy]" })

map("n", "<leader>vn", "<cmd>e ~/notes/note.md<cr>", { desc = "[note]" })
map(
  "n",
  "<leader>vj",
  string.format("<cmd>e ~/.catgirljournal/%s.md<cr>", os.date("%Y-%m-%d")),
  { desc = "[note] journal" }
)
