return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
        })
      end,
      desc = "[telescope] find file",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep({
          prompt_prefix = "     ",
        })
      end,
      desc = "[telescope] find file by grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers({
          prompt_prefix = "     ",
        })
      end,
      desc = "[telescope] find buffers",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics({
          prompt_prefix = "     ",
        })
      end,
      desc = "[telescope] diagnostics",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags({
          prompt_prefix = "    ",
        })
      end,
      desc = "[telescope] help",
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").man_pages({
          prompt_prefix = "    ",
        })
      end,
      desc = "[telescope] man pages",
    },
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_status({
          prompt_prefix = "     ",
        })
      end,
      desc = "[git] status",
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits({
          prompt_prefix = "    ",
        })
      end,
      desc = "[git] commits",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches({
          prompt_prefix = "    ",
        })
      end,
      desc = "[git] branches",
    },
    {
      "<leader>n",
      function()
        require("telescope").extensions.file_browser.file_browser({
          prompt_prefix = "     ",
        })
      end,
      desc = "[telescope] files",
    },
    -- telescope lsp keybinds
    {
      "gr",
      function()
        require("telescope.builtin").lsp_references({
          prompt_prefix = "     ",
        })
      end,
      desc = "[lsp] references",
    },
    {
      "gd",
      function()
        require("telescope.builtin").lsp_definitions({
          prompt_prefix = "     ",
        })
      end,
      desc = "[lsp] goto definition",
    },
    {
      "<space>D",
      function()
        require("telescope.builtin").lsp_type_definitions({
          prompt_prefix = "     ",
        })
      end,
      desc = "[lsp] show type definition",
    },
    {
      "gi",
      function()
        require("telescope.builtin").lsp_implementations({
          prompt_prefix = "     ",
        })
      end,
      desc = "[lsp] goto implementation",
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      picker = {
        hidden = false,
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        prompt_prefix = "     ",
        selection_caret = "  ",
        entry_prefix = "  ",
        preview = { msg_bg_fillchar = " " },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
          vertical = { mirror = false },
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "dist/",
          "build/",
          "target/",
          "%.png",
          "%.jpg",
          "%.jpeg",
          "%.webp",
          "%.mp4",
          "%.gif",
          "%.mp3",
          "%.woff2",
          "%.woff",
          "%.otf",
          "%.ttf",
        },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "absolute" },
        winblend = 0,
        border = {},
        borderchars = { "" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          i = {
            ["<Tab>"] = "move_selection_next",
            ["<S-Tab>"] = "move_selection_previous",
          },
          n = {
            ["<Tab>"] = "move_selection_next",
            ["<S-Tab>"] = "move_selection_previous",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        file_browser = {
          path = "%:p:h",
          no_ignore = true,
          hidden = true,
          file_ignore_patterns = {},
          hijack_netrw = true,
          display_stat = false,
          dir_icon_hl = "CmpItemKind",
          mappings = {
            ["i"] = {
              ["<bs>"] = function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<bs>", true, false, true), "tn", false)
              end,
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
