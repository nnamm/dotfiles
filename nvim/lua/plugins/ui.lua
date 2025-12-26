return {
  --------------------------
  --  minimal statusline  --
  --------------------------
  -- disable lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },

  -- gitsigns.nvim for incline.nvim
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = {},
  },

  -- floating statusline
  {
    "b0o/incline.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
      require("incline").setup({
        window = {
          placement = {
            horizontal = "right",
            vertical = "bottom",
          },
          margin = {
            horizontal = 1,
            vertical = 1,
          },
          padding = {
            left = 1,
            right = 1,
          },
        },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")

          -- 診断アイコンの定義（LazyVimのデフォルト設定を使用）
          local lazy_icons = LazyVim.config.icons.diagnostics
          local icons = {
            error = lazy_icons.Error,
            warn = lazy_icons.Warn,
            hint = lazy_icons.Hint,
          }

          -- Gitアイコンの定義
          local git_icons = LazyVim.config.icons.git

          -- 同名ファイルが複数あるかチェック
          local same_name_count = 0
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
              local buf_filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
              if buf_filename == filename and buf_filename ~= "" then
                same_name_count = same_name_count + 1
              end
            end
          end

          -- ファイルアイコンを取得
          local devicons = require("nvim-web-devicons")
          local extension = vim.fn.fnamemodify(filename, ":e")
          local file_icon, icon_color = devicons.get_icon(filename, extension, { default = true })

          -- 背景色の設定（アクティブ/非アクティブで変える）
          local bg_color = props.focused and "#24283b" or "#1a1b26"

          -- 結果を構築
          local result = {}

          -- 診断情報を表示（左側、重要度順: Error → Warn → Hint）
          local has_diagnostics = false
          local severity_order = { "error", "warn", "hint" }
          for _, severity in ipairs(severity_order) do
            local icon = icons[severity]
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(result, {
                icon .. n .. " ",
                guibg = bg_color,
                guifg = props.focused and ({
                  error = "#f7768e",
                  warn = "#e0af68",
                  hint = "#0db9d7",
                })[severity] or "#565f89",
              })
              has_diagnostics = true
            end
          end

          -- Git diff情報を表示
          local has_diff = false
          local ok, status = pcall(vim.api.nvim_buf_get_var, props.buf, "gitsigns_status_dict")
          if ok and status then
            local diff_data = {
              { icon = git_icons.added, count = status.added, color = "#9ece6a" },
              { icon = git_icons.modified, count = status.changed, color = "#7aa2f7" },
              { icon = git_icons.removed, count = status.removed, color = "#f7768e" },
            }

            for _, diff in ipairs(diff_data) do
              if diff.count and diff.count > 0 then
                table.insert(result, {
                  diff.icon .. diff.count .. " ",
                  guibg = bg_color,
                  guifg = props.focused and diff.color or "#565f89",
                })
                has_diff = true
              end
            end
          end

          -- セパレータ（診断情報またはdiff情報がある場合のみ）
          if has_diagnostics or has_diff then
            table.insert(result, { "┊ ", guifg = "#565f89", guibg = bg_color })
          end

          -- ファイルアイコン
          table.insert(result, { file_icon and (file_icon .. " ") or "", guifg = icon_color, guibg = bg_color })

          -- 親ディレクトリとファイル名
          if same_name_count > 1 then
            local parent = vim.fn.fnamemodify(bufname, ":h:t")
            -- 親ディレクトリはコメント色で表示
            table.insert(result, { parent .. "/", guifg = "#565f89", guibg = bg_color })
            table.insert(result, { filename, guifg = props.focused and "#c0caf5" or "#565f89", guibg = bg_color })
          else
            table.insert(result, { filename, guifg = props.focused and "#c0caf5" or "#565f89", guibg = bg_color })
          end

          return result
        end,
      })

      -- gitsignsの更新時にinclineを再レンダリング
      vim.api.nvim_create_autocmd("User", {
        pattern = "GitSignsUpdate",
        callback = function()
          vim.defer_fn(function()
            require("incline").refresh()
          end, 50)
        end,
      })
    end,
    event = "VeryLazy",
  },

  -- mode style
  {
    "mvllow/modes.nvim",
    config = function()
      require("modes").setup({
        colors = {
          copy = "#f5c359",
          delete = "#c75c6a",
          insert = "#bfdaff",
          visual = "#ff761a",
        },
        line_opacity = 0.2,
      })
    end,
  },

  ----------------
  --  makrdown  --
  ----------------
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = "Min"
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_theme = "dark"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        enabled = true, -- code block are enebled
        sign = false, -- sign column in hidden
        width = "block",
        right_pad = 1,
        -- inline = false, -- disable inline code rendering
      },
      -- link = {
      --   enabled = false,
      -- },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      -- disable by default
      require("render-markdown").disable()
      -- toggleable with Snacks.toggle
      Snacks.toggle({
        name = "Render Markdown",
        get = require("render-markdown").get,
        set = require("render-markdown").set,
      }):map("<leader>um")
    end,
  },

  -------------------
  --  buffer line  --
  -------------------
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<s-tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    config = function()
      local nb = require("config.nb")
      require("bufferline").setup({
        options = {
          mode = "buffers",
          indicator = {
            icon = "",
            style = "none",
          },
          separator_style = { "/", "/" },
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          color_icons = true,
          always_show_bufferline = true,
          -- nb setttings
          ---@param buf {name: string, path: string, bufnr: number}
          name_formatter = function(buf)
            local title = nb.get_title(buf.path)
            return title or buf.name
          end,
        },
      })
    end,
  },

  --------------------
  --  notification  --
  --------------------
  -- notification messages
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- notification messages timeout
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
}
