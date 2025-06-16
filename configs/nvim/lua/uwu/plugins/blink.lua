return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  build = "nix run .#build-plugin",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "xzbdmw/colorful-menu.nvim", opts = {} },
  },
  opts = {
    completion = {
      menu = {
        min_width = 20,
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            kind_icon = {
              text = function(ctx)
                return ctx.kind_icon .. ctx.icon_gap .. " "
              end,
            },
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
        scrollbar = false,
      },
      keyword = {
        range = "full",
      },
      ghost_text = {
        enabled = true,
        show_without_selection = true,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          scrollbar = false,
        },
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    },
    keymap = {
      preset = "none",
      ["<C-b>"] = { "scroll_documentation_down", "fallback" },
      ["<C-f>"] = { "scroll_documentation_up", "fallback" },
      ["<C-Space>"] = { "show", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
      ["<cr>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      keymap = { preset = "inherit" },
      completion = {
        menu = { auto_show = true },
        list = {
          selection = {
            preselect = false,
          },
        },
      },
    },
    term = {
      enabled = false,
      keymap = { preset = "inherit" },
      completion = {
        menu = {
          auto_show = true,
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
          },
        },
      },
    },
  },
}
