return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    ---@diagnostic disable-next-line: duplicate-set-field
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = {
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
        { " ", "FloatBorder" },
      }
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    vim.diagnostic.config({
      virtual_text = {
        source = false,
        prefix = "▎",
        format = function(diagnostic)
          return string.format("%s ", diagnostic.message)
        end,
      },
      float = {
        source = false,
        header = "",
        format = function(diagnostic)
          return string.format("%s ", diagnostic.message)
        end,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
        texthl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "[lsp] line diagnostic" })
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = 1 })
    end, { desc = "[lsp] previous diagnostic" })
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = -1 })
    end, { desc = "[lsp] next diagnostic" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[lsp] goto declaration" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "[lsp] hover" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "[lsp] signature help" })
        vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[lsp] rename" })
        vim.keymap.set("n", "<space>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[lsp] code actions" })
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
    })

    lspconfig.nil_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          format = { enable = false },
          completion = { callSnippet = "Replace" },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    lspconfig.taplo.setup({
      capabilities = capabilities,
    })
  end,
}
