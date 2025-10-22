return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        numbers = { "bold" },
        types = { "bold" },
      },
      integrations = {
        lsp_trouble = true,
        dashboard = false,
        hop = true,
        neogit = true,
        nvimtree = false,
        blink_cmp = false,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            NormalFloat = { bg = colors.mantle },
            FloatBorder = { bg = colors.mantle, fg = colors.mantle },
            BlinkCmpDoc = { bg = colors.mantle },
            BlinkCmpDocBorder = { bg = colors.mantle, fg = colors.mantle },
            BlinkCmpGhostText = { link = "Comment" },
            CursorLineNr = { fg = colors.mauve, style = { "bold" } },
            PmenuSel = { bg = colors.surface0, fg = "" },
            Pmenu = { bg = colors.mantle },
            PmenuSbar = { bg = colors.crust },
            PmenuThumb = { bg = colors.surface0 },
            VertSplit = { fg = colors.base },
            Folded = { link = "Comment" },
            LazyBackdrop = { bg = colors.base },
            HighlightUndo = { bg = colors.teal, fg = colors.base },
            HighlightRedo = { bg = colors.teal, fg = colors.base },
            Cursor = { fg = colors.base, bg = colors.overlay0 },

            TelescopeSelection = { bg = colors.surface0, fg = colors.text },
            TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },

            TelescopePromptPrefix = { bg = colors.mantle, fg = colors.mauve },
            TelescopePromptNormal = { bg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },

            TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePreviewMessage = { fg = colors.teal, style = { "italic" } },

            TelescopePromptTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },

            GitSignsChange = { fg = colors.peach },
            GitSignsCurrentLineBlame = { link = "Comment" },

            HimalayaHead = { fg = colors.overlay0 },

            IndentBlanklineChar = { fg = colors.surface0 },
            IndentBlanklineContextChar = { fg = colors.surface2 },

            NoiceConfirm = { bg = colors.mantle, fg = colors.mauve },
            NoiceCmdlineIconLua = { fg = colors.blue },
            NoiceConfirmBorder = { bg = colors.mantle, fg = colors.mantle },
            NoiceMini = { link = "Comment" },
            NoiceLspProgressClient = { fg = colors.blue, style = { "italic", "bold" } },
            NoiceCmdlinePopup = { bg = colors.mantle },
            NoiceCmdlinePopupBorder = { bg = colors.mantle, fg = colors.mantle },
            NoiceCmdlinePopupBorderSearch = { bg = colors.mantle, fg = colors.mantle },

            CratesNvimPopupPillText = { bg = colors.none, fg = colors.mauve, style = { "bold" } },
            CratesNvimPopupEnabled = { fg = colors.green, style = { "bold" } },
            CratesNvimPopupTransitive = { fg = colors.teal, style = { "bold" } },
            CratesNvimPopupLabel = { fg = colors.blue, style = { "bold" } },

            HimalayaUnseen = { fg = colors.mauve, style = { "bold" } },
          }
        end,
      },
    })

    vim.api.nvim_command("colorscheme catppuccin")

    local colors = require("catppuccin.palettes").get_palette() or ""

    vim.g.terminal_color_0 = colors.surface0
    vim.g.terminal_color_8 = colors.surface2
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_5 = colors.mauve
    vim.g.terminal_color_13 = colors.mauve
    vim.g.terminal_color_6 = colors.teal
    vim.g.terminal_color_14 = colors.teal
    vim.g.terminal_color_7 = colors.text
    vim.g.terminal_color_15 = colors.surface2
  end,
}
