local map = vim.keymap.set

map("n", "<leader>q", "<cmd>bd<cr>", { desc = "[buffer] close current" })
map("n", "<leader>Q", "<cmd>%bd|e#|bd#<cr>", { desc = "[buffer] close other" })
map("n", "<A-n>", "<cmd>tabnew<cr>", { desc = "[tab] new" })
map("n", "[t", "<cmd>tabprev<cr>", { desc = "[tab] previous" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "[tab] next" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "[search] clear" })

map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "[lazy]" })

map("n", "<leader>vn", "<cmd>e ~/notes/note.md<cr>", { desc = "[note]" })
map(
  "n",
  "<leader>vj",
  string.format("<cmd>e ~/.catgirljournal/%s.md<cr>", os.date("%Y-%m-%d")),
  { desc = "[note] journal" }
)

map("n", "<A-->", "<C-w>s", { desc = "[window] split" })
map("n", "<A-\\>", "<C-w>v", { desc = "[window] vsplit" })

map("n", "<A-h>", "<C-w>h", { desc = "[window] go to left" })
map("n", "<A-j>", "<C-w>j", { desc = "[window] go to down" })
map("n", "<A-k>", "<C-w>k", { desc = "[window] go to up" })
map("n", "<A-l>", "<C-w>l", { desc = "[window] go to right" })

map("n", "<A-S-h>", "<C-w><", { desc = "[window] resize left" })
map("n", "<A-S-j>", "<C-w>-", { desc = "[window] resize down" })
map("n", "<A-S-k>", "<C-w>+", { desc = "[window] resize up" })
map("n", "<A-S-l>", "<C-w>>", { desc = "[window] resize right" })

map("n", "<leader>t", "<cmd>term<cr>", { desc = "[terminal] open" })

map("t", "<esc>", "<C-\\><C-n>", { desc = "[terminal] normal" })
map("t", "<S-esc>", "<esc>", { desc = "[terminal] esc" })
