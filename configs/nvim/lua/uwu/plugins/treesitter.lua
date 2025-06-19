return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  dependencies = {
    {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end,
    },
    {
      "Wansmer/treesj",
      keys = { { "J", "<cmd>TSJToggle<cr>", desc = "[join] toggle" } },
      opts = { use_default_keymaps = false, max_join_length = 150 },
    },
  },
  config = function()
    local MAX_FILE_LINES = 5000
    local MAX_FILE_SIZE = 1048576 -- 1MB

    require("nvim-treesitter.configs").setup({
      auto_install = false,
      sync_install = true,
      ignore_install = {},
      modules = {},
      ensure_installed = {
        "bash",
        "comment",
        "diff",
        "fish",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "gpg",
        "http",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "regex",
        "rust",
        "toml",
        "vimdoc",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        max_file_lines = MAX_FILE_LINES,
        disable = function(_, bufnr)
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
          if ok and stats and stats.size > MAX_FILE_SIZE then
            return true
          end
        end,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
      indent = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
    })
  end,
}
