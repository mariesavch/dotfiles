---@diagnostic disable: undefined-field
return {
  "rebelot/heirline.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
    {
      "linrongbin16/lsp-progress.nvim",
      event = { "LspAttach", "LspDetach" },
      opts = {
        series_format = function(title)
          local builder = {}

          if type(title) == "string" and string.len(title) > 0 then
            table.insert(builder, title:lower())
          end

          return table.concat(builder, " ")
        end,
        ---@diagnostic disable-next-line: unused-local
        client_format = function(client_name, spinner, series_messages)
          local messages = table.concat(series_messages, " ")

          if string.len(messages) > 20 then
            messages = messages:sub(1, 20) .. "..."
          end

          return #series_messages > 0 and ("[" .. messages .. "] " .. client_name .. " ") or nil
        end,
        format = function(client_messages)
          local sign = ""

          if #client_messages > 0 then
            return sign .. " " .. table.concat(client_messages, " ")
          end

          if #require("lsp-progress.api").lsp_clients() > 0 then
            local names = {}
            for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
              table.insert(names, server.name)
            end

            if #names == 0 then
              return ""
            end

            return ("%s %s "):format(sign, table.concat(names, " "))
          end

          return ""
        end,
      },
    },
  },
  config = function()
    local heirline = require("heirline")
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")
    local colors = require("catppuccin.palettes").get_palette() or ""

    conditions.buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end
    conditions.buffer_not_term = function()
      return vim.fn.expand("%:t") ~= "fish"
    end

    local Align = { provider = "%=", hl = { bg = colors.mantle } }
    local Space = { provider = " " }

    local VIMODE_COLORS = {
      ["n"] = colors.blue,
      ["no"] = colors.pink,
      ["nov"] = colors.pink,
      ["noV"] = colors.pink,
      ["no"] = colors.pink,
      ["niI"] = colors.blue,
      ["niR"] = colors.blue,
      ["niV"] = colors.blue,
      ["v"] = colors.mauve,
      ["vs"] = colors.mauve,
      ["V"] = colors.lavender,
      ["Vs"] = colors.lavender,
      [""] = colors.yellow,
      ["s"] = colors.yellow,
      ["s"] = colors.teal,
      ["S"] = colors.teal,
      [""] = colors.yellow,
      ["i"] = colors.green,
      ["ic"] = colors.green,
      ["ix"] = colors.green,
      ["R"] = colors.flamingo,
      ["Rc"] = colors.flamingo,
      ["Rv"] = colors.rosewater,
      ["Rx"] = colors.flamingo,
      ["c"] = colors.peach,
      ["cv"] = colors.peach,
      ["ce"] = colors.peach,
      ["r"] = colors.teal,
      ["rm"] = colors.sky,
      ["r?"] = colors.maroon,
      ["!"] = colors.maroon,
      ["t"] = colors.red,
      ["nt"] = colors.red,
      ["null"] = colors.pink,
    }

    local ViModeSepLeft = {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      provider = "▍",
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = VIMODE_COLORS[mode], bg = colors.mantle }
      end,
      update = {
        "ModeChanged",
      },
    }

    local ViModeSepRight = {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      provider = "▐",
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = VIMODE_COLORS[mode], bg = colors.mantle }
      end,
      update = {
        "ModeChanged",
      },
    }

    local FileNameBlock = {
      init = function(self)
        if conditions.buffer_not_term() then
          self.filename = vim.api.nvim_buf_get_name(0)
        else
          self.filename = vim.fn.getcwd()
        end
      end,
      condition = function()
        return conditions.buffer_not_empty()
      end,
      hl = { bg = colors.mantle, fg = colors.subtext1 },
    }

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        if conditions.buffer_not_term() then
          self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
            vim.fn.fnamemodify(filename, ":t"),
            extension,
            { default = true }
          )
        else
          self.icon = ""
          self.icon_color = colors.blue
        end
      end,
      provider = function(self)
        return self.icon and (" %s "):format(self.icon)
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end,
    }

    local FileName = {
      provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":~:.")
        if filename == "" then
          return "[no name]"
        end
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = { fg = colors.subtext1, bold = true, italic = true },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = " ● ",
        hl = { fg = colors.subtext1 },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = "",
        hl = { fg = colors.red },
      },
    }

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          return { fg = colors.text, bold = true, force = true }
        end
      end,
    }

    FileNameBlock = utils.insert(
      FileNameBlock,
      FileIcon,
      utils.insert(FileNameModifer, FileName),
      unpack(FileFlags),
      { provider = "%< " }
    )

    local Ruler = {
      provider = " %1(%l/%1L%)",
      condition = function()
        return conditions.buffer_not_empty() and conditions.buffer_not_term()
      end,
      hl = { bg = colors.mantle, fg = colors.overlay0 },
    }

    local LspProgress = {
      provider = function()
        return require("lsp-progress").progress()
      end,
      condition = function()
        return conditions.lsp_attached()
      end,
      update = {
        "User",
        pattern = "LspProgressStatusUpdated",
        callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end),
      },
      hl = { bg = colors.mantle, fg = colors.overlay0, bold = true, italic = false },
    }

    local Diagnostics = {
      condition = function()
        return conditions.buffer_not_empty() and conditions.has_diagnostics()
      end,
      static = {
        error_icon = " ",
        warn_icon = " ",
        info_icon = " ",
        hint_icon = " ",
      },
      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,
      update = { "DiagnosticChanged", "BufEnter" },
      hl = { bg = colors.mantle },
      Space,
      {
        provider = function(self)
          return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.red },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.yellow },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.sapphire },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.sky },
      },
      Space,
    }

    local head_cache = {}

    local function get_git_detached_head()
      local git_branches_file = io.popen("git branch -a --no-abbrev --contains", "r")
      if not git_branches_file then
        return
      end
      local git_branches_data = git_branches_file:read("*l")
      io.close(git_branches_file)
      if not git_branches_data then
        return
      end

      local branch_name = git_branches_data:match(".*HEAD (detached %w+ [%w/-]+)")
      if branch_name and string.len(branch_name) > 0 then
        return branch_name
      end
    end

    local function parent_pathname(path)
      local i = path:find("[\\/:][^\\/:]*$")
      if not i then
        return
      end
      return path:sub(1, i - 1)
    end

    local function get_git_dir(path)
      local function has_git_dir(dir)
        local git_dir = dir .. "/.git"
        if vim.fn.isdirectory(git_dir) == 1 then
          return git_dir
        end
      end

      local function has_git_file(dir)
        local gitfile = io.open(dir .. "/.git")
        if gitfile ~= nil then
          local git_dir = gitfile:read():match("gitdir: (.*)")
          gitfile:close()

          return git_dir
        end
      end

      local function is_path_absolute(dir)
        local patterns = {
          "^/",
          "^%a:[/\\]",
        }
        for _, pattern in ipairs(patterns) do
          if string.find(dir, pattern) then
            return true
          end
        end
        return false
      end

      if not path or path == "." then
        path = vim.fn.getcwd()
      end

      local git_dir
      while path do
        git_dir = has_git_dir(path) or has_git_file(path)
        if git_dir ~= nil then
          break
        end
        path = parent_pathname(path)
      end

      if not git_dir then
        return
      end

      if is_path_absolute(git_dir) then
        return git_dir
      end
      return path .. "/" .. git_dir
    end

    local function git_metrics()
      local git_metrics_cmd = io.popen("git diff --shortstat")
      if not git_metrics_cmd then
        return { added = 0, removed = 0, changed = 0 }
      end

      local git_metrics_data = git_metrics_cmd:read("*a")
      git_metrics_cmd:close()

      if not git_metrics_data then
        return { added = 0, removed = 0, changed = 0 }
      end

      local added = tonumber(git_metrics_data:match("(%d+) insertions?%(%+%)")) or 0
      local removed = tonumber(git_metrics_data:match("(%d+) deletions?%(%-%)")) or 0
      local changed = tonumber(git_metrics_data:match("(%d+) file[s]? changed")) or 0

      return {
        added = added,
        removed = removed,
        changed = changed,
      }
    end

    local Git = {
      condition = function()
        return conditions.buffer_not_empty() and conditions.is_git_repo()
          or not conditions.buffer_not_term() and get_git_dir(vim.fn.getcwd())
      end,
      init = function(self)
        ---@diagnostic disable-next-line: undefined-field
        if conditions.buffer_not_term() then
          self.status_dict = vim.b.gitsigns_status_dict
        else
          self.status_dict = git_metrics()
        end
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      hl = { bg = colors.mantle, fg = colors.mauve },
      Space,
      {
        provider = function()
          if vim.bo.filetype == "help" then
            return
          end
          local current_file = vim.fn.expand("%:p")
          local current_dir

          if vim.fn.getftype(current_file) == "link" then
            local real_file = vim.fn.resolve(current_file)
            current_dir = vim.fn.fnamemodify(real_file, ":h")
          elseif conditions.buffer_not_term() then
            current_dir = vim.fn.expand("%:p:h")
          else
            current_dir = vim.fn.getcwd()
          end

          local git_dir = get_git_dir(current_dir)
          if not git_dir then
            return
          end

          local git_root = git_dir:gsub("/.git/?$", "")
          local head_stat = vim.loop.fs_stat(git_dir .. "/HEAD")

          if head_stat and head_stat.mtime then
            if
              head_cache[git_root]
              and head_cache[git_root].mtime == head_stat.mtime.sec
              and head_cache[git_root].branch
            then
              return " " .. head_cache[git_root].branch
            else
              local head_file = vim.loop.fs_open(git_dir .. "/HEAD", "r", 438)
              if not head_file then
                return
              end
              local head_data = vim.loop.fs_read(head_file, head_stat.size, 0)
              if not head_data then
                return
              end
              vim.loop.fs_close(head_file)

              head_cache[git_root] = {
                head = head_data,
                mtime = head_stat.mtime.sec,
              }
            end
          else
            return
          end

          local branch_name = head_cache[git_root].head:match("ref: refs/heads/([^\n\r%s]+)")
          if not branch_name then
            branch_name = get_git_detached_head()
            if not branch_name then
              head_cache[git_root].branch = ""
              return
            end
          end

          head_cache[git_root].branch = branch_name
          return " " .. branch_name
        end,
        hl = { bold = true },
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("  %s"):format(count)
        end,
        hl = { fg = colors.green },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("  %s"):format(count)
        end,
        hl = { fg = colors.red },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("  %s"):format(count)
        end,
        hl = { fg = colors.peach },
      },
      Space,
    }

    heirline.setup({
      ---@diagnostic disable-next-line: missing-fields
      statusline = {
        ViModeSepLeft,
        FileNameBlock,
        Ruler,
        Align,
        LspProgress,
        Diagnostics,
        Git,
        ViModeSepRight,
      },
    })
  end,
}
