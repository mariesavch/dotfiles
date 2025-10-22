vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provier = 0
vim.g.loaded_node_provier = 0

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = "longest,menuone"
vim.opt.conceallevel = 2
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = {
  fold = " ",
  vert = " ",
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
  horiz = " ",
  horizup = " ",
  horizdown = " ",
  eob = " ",
  msgsep = " ",
  diff = " ",
}
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.list = false
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
vim.opt.number = false
vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ I = true, c = true, F = true })
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undodir = "/tmp/nvim-undo"
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.wildignorecase = true
vim.opt.winminwidth = 5
vim.opt.wrap = false
vim.opt.statusline = " "
vim.opt.diffopt = { "closeoff", "hiddenoff", "linematch:60", "foldcolumn:0" }

vim.o.guifont = "CartographCF Nerd Font:h12"
vim.o.guicursor = "n-v-sm:block-Cursor,i-ci-c-ve:ver25-Cursor,r-cr-o:hor20-Cursor,t:ver25-Cursor"
vim.opt.linespace = 15
vim.g.neovide_padding_top = 23
vim.g.neovide_padding_bottom = 23
vim.g.neovide_padding_right = 23
vim.g.neovide_padding_left = 23
vim.g.neovide_underline_stroke_scale = 1.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_confirm_quit = false
vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00

vim.fn.setenv("NVIM_LISTEN_SOCKET", vim.v.servername)

vim.filetype.add({
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
