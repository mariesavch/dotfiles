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
    vim.opt_local.cursorline = false
    vim.cmd("startinsert!")
  end,
})

autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("ResizeSplit", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
