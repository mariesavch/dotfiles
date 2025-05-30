local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "v.plugins.autopairs" },
  { import = "v.plugins.catppuccin" },
  { import = "v.plugins.cmp" },
  { import = "v.plugins.colorizer" },
  { import = "v.plugins.comment" },
  { import = "v.plugins.devicons" },
  { import = "v.plugins.gitsigns" },
  { import = "v.plugins.heirline" },
  { import = "v.plugins.lspconfig" },
  { import = "v.plugins.noice" },
  { import = "v.plugins.smart-splits" },
  { import = "v.plugins.surround" },
  { import = "v.plugins.telescope" },
  { import = "v.plugins.treesitter" },
  { import = "v.plugins.treesj" },
  { import = "v.plugins.which-key" },
  { import = "v.plugins.hop" },
  { import = "v.plugins.conform" },
  { import = "v.plugins.himalaya" },
  { import = "v.plugins.crates" },
  { import = "v.plugins.minty" },
  { import = "v.plugins.neogit" },
  { import = "v.plugins.highlight-undo" },
}, {
  defaults = {
    lazy = true,
    version = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  ui = {
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = "",
      import = "",
      keys = "",
      lazy = " ",
      loaded = "",
      not_loaded = "",
      plugin = "󱧕",
      runtime = "",
      source = " ",
      start = "",
      task = "",
      list = {
        "",
        "",
        "",
        "‒",
      },
    },
  },
  install = { colorscheme = { "catppuccin", "habamax" } },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      reset = true,
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
