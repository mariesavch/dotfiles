local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert!")
  end,
})

autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("ResizeSplit", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

local rust_group = vim.api.nvim_create_augroup("rust_group", {})
autocmd({ "FileType" }, {
  pattern = "rust",
  callback = function()
    vim.opt_local.backupcopy = "yes"
  end,
  group = rust_group,
})
