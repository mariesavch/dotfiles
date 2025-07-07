return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          rosewater = "#ff8389",
          flamingo = "#ff8389",
          red = "#ff8389",
          maroon = "#ff8389",
          pink = "#ff7eb6",
          mauve = "#be95ff",
          peach = "#d44a1c",
          yellow = "#ab8600",
          green = "#08bdba",
          teal = "#33b1ff",
          sky = "#33b1ff",
          sapphire = "#33b1ff",
          blue = "#78a9ff",
          lavender = "#78a9ff",
          text = "#ffffff",
          subtext1 = "#f4f4f4",
          subtext0 = "#e0e0e0",
          overlay2 = "#adadad",
          overlay1 = "#949494",
          overlay0 = "#7a7a7a",
          surface2 = "#4f4f4f",
          surface1 = "#383838",
          surface0 = "#2e2e2e",
          base = "#161616",
          mantle = "#0d0d0d",
          crust = "#000000",
        },
      },
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

            TelescopeSelection = { bg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },

            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },

            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePreviewMessage = { fg = colors.teal, style = { "italic" } },

            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
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

            Todo = { fg = colors.mauve, bg = colors.none, style = { "bold" } },
            ["@comment.error"] = { fg = colors.red, bg = colors.none, style = { "bold" } },
            ["@comment.warning"] = { fg = colors.yellow, bg = colors.none, style = { "bold" } },
            ["@comment.note"] = { fg = colors.blue, bg = colors.none, style = { "bold" } },
            ["@comment.todo"] = { fg = colors.mauve, bg = colors.none, style = { "bold" } },

            Structure = { fg = colors.pink },
            StorageClass = { fg = colors.pink },
            Type = { fg = colors.pink, style = { "bold" } },
            Constant = { fg = colors.text, style = { "bold" } },
            Number = { fg = colors.text },
            Float = { fg = colors.text },
            Boolean = { fg = colors.pink },
            ["@function.builtin"] = { fg = colors.pink },
            ["@method"] = { fg = colors.pink },
            ["@constant"] = { fg = colors.text, style = { "bold" } },
            ["@variable.builtin"] = { fg = colors.pink },
            ["@type.builtin"] = { fg = colors.pink, style = { "bold" } },
            ["@tag.attribute.tsx"] = { fg = colors.mauve, style = { "italic" } },
            ["@tag.attribute"] = { fg = colors.mauve, style = { "italic" } },
            ["@tag.builtin.tsx"] = { fg = colors.mauve },
            ["@lsp.type.namespace.rust"] = { fg = colors.pink, style = { "bold" } },
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
