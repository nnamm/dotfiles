return {
  -- git
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
      },
    },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<leader>ir",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "Incremental rename",
        mode = "n",
        noremap = true,
        expr = true,
      },
    },
    config = true,
  },

  -- refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- telescope
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "df",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },

  -- AI-driven code suggestions
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     model = "claude-3.7-sonnet",
  --   },
  --   config = function(_, opts)
  --     require("CopilotChat").setup(opts)
  --   end,
  -- },
  --   {
  --     "yetone/avante.nvim",
  --     event = "VeryLazy",
  --     version = false, -- Never set this value to "*"! Never!
  --     opts = {
  --       -- My Settings
  --       provider = "copilot",
  --       copilot = {
  --         model = "claude-3.7-sonnet",
  --       },
  --       auto_suggestions_provider = "copilot",
  --       file_selector = {
  --         provider = "telescope",
  --       },
  --       windows = {
  --         position = "right",
  --         wrap = true,
  --         width = 40,
  --         ask = {
  --           start_insert = false,
  --         },
  --       },
  --       web_search_engine = {
  --         provider = "brave",
  --         proxy = nil,
  --       },
  --       -- My Settings end
  --     },
  --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --     build = "make",
  --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --     dependencies = {
  --       "nvim-treesitter/nvim-treesitter",
  --       "stevearc/dressing.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "MunifTanjim/nui.nvim",
  --       --- The below dependencies are optional,
  --       "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --       "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --       "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --       "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --       "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --       "zbirenbaum/copilot.lua", -- for providers='copilot'
  --       {
  --         -- support for image pasting
  --         "HakonHarnes/img-clip.nvim",
  --         event = "VeryLazy",
  --         opts = {
  --           -- recommended settings
  --           default = {
  --             embed_image_as_base64 = false,
  --             prompt_for_file_name = false,
  --             drag_and_drop = {
  --               insert_mode = true,
  --             },
  --             -- required for Windows users
  --             use_absolute_path = true,
  --           },
  --         },
  --       },
  --       {
  --         -- Make sure to set this up properly if you have lazy=true
  --         "MeanderingProgrammer/render-markdown.nvim",
  --         opts = {
  --           file_types = { "markdown", "Avante" },
  --         },
  --         ft = { "markdown", "Avante" },
  --       },
  --     },
  --   },
}
