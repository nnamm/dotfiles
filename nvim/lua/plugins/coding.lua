return {
  -- "neovim/nvim-lspconfig",
  -- opts = {
  --   servers = {
  --     gopls = {
  --       settings = {
  --         gopls = {
  --           staticcheck = true,
  --           analyses = {
  --             unusedparams = true,
  --           },
  --           gofumpt = true,
  --           memoryMode = "DegradeClosed",
  --           expandWorkspaceToModule = true,
  --         },
  --       },
  --     },
  --   },
  -- },

  -- nvim-cmp
  -- Use the Tab-key to confirm a candidate
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  --     })
  --     return opts
  --   end,
  -- },

  -- snippets
  -- {
  --   "garymjr/nvim-snippets",
  --   opts = {
  --     friendly_snippets = true,
  --     search_paths = { vim.fn.stdpath("config") .. "/snippets" },
  --   },
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --   },
  -- },

  -- copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   opts = {
  --     suggestion = { enabled = true },
  --     panel = { enabled = true },
  --     filetypes = {
  --       ["*"] = false,
  --     },
  --   },
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "claude-sonnet-4.5",
      temperature = 0.1,
      auto_fold = true,
      -- window = {
      --   layout = "float",
      --   relative = "editor",
      -- },
      show_help = "yes",
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
          mapping = "<leader>ce",
          description = "コードの説明",
        },
        Review = {
          prompt = "/COPILOT_REVIEW コードを日本語でレビューしてください。",
          mapping = "<leader>cr",
          description = "コードのレビュー",
        },
        Fix = {
          prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
          mapping = "<leader>cf",
          description = "バグコードの修正",
        },
        Optimize = {
          prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
          mapping = "<leader>co",
          description = "コードの最適化",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
          mapping = "<leader>cd",
          description = "コードのドキュメント作成",
        },
        Tests = {
          prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
          mapping = "<leader>ct",
          description = "テストコード作成",
        },
        FixDiagnostic = {
          prompt = "コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。",
          mapping = "<leader>cd",
          description = "コードの修正",
          selection = require("CopilotChat.select").diagnostics,
        },
        Commit = {
          prompt = "実装差分に対するコミットメッセージを日本語で記述してください。",
          mapping = "<leader>cco",
          description = "コミットメッセージの作成",
          selection = require("CopilotChat.select").gitdiff,
        },
        CommitStaged = {
          prompt = "ステージ済みの変更に対するコミットメッセージを日本語で記述してください。",
          mapping = "<leader>cs",
          description = "ステージ済みのコミットメッセージの作成",
          selection = function(source)
            return require("CopilotChat.select").gitdiff(source, true)
          end,
        },
      },
    },
  },
}
