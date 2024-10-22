return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "go"
      },
    },
  },

  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "yaml-language-server",
      }
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns"
  },
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick",         -- optional
    },
    config = true
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },

  {
    "Bekaboo/dropbar.nvim",
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  {
    "nvim-neotest/neotest",
    cmd = { "Neotest" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang"),
        },
      })
    end
  },
  {
    'ldelossa/litee.nvim',
    event = "VeryLazy",
    opts = {
      notify = { enabled = false },
      panel = {
        orientation = "bottom",
        panel_size = 10,
      },
    },
    config = function(_, opts) require('litee.lib').setup(opts) end
  },

  {
    'ldelossa/litee-calltree.nvim',
    dependencies = 'ldelossa/litee.nvim',
    event = "VeryLazy",
    opts = {
      on_open = "panel",
      map_resize_keys = false,
      keymaps = {
        toggle = "<tab>"
      },
    },
    config = function(_, opts)
      require('litee.calltree').setup(opts)
      -- Highlight only while on calltree
      vim.api.nvim_create_autocmd({ "WinEnter" }, {
        desc = "Clear hls when leaving calltree",
        callback = function()
          vim.defer_fn(function()
            if vim.bo.filetype == "calltree" then
              vim.cmd(
                "silent! hi LTSymbolJump ctermfg=015 ctermbg=110 cterm=italic,bold,underline guifg=#464646 guibg=#87afd7 gui=italic,bold")
              vim.cmd(
                "silent! hi LTSymbolJumpRefs ctermfg=015 ctermbg=110 cterm=italic,bold,underline guifg=#464646 guibg=#87afd7 gui=italic,bold")
            else
              vim.cmd("silent! highlight clear LTSymbolJump")
              vim.cmd("silent! highlight clear LTSymbolJumpRefs")
            end
          end, 100)
        end
      })
    end
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function()
      return require("configs.null-ls")
    end,
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "User FilePost",
    config = function ()
      dofile(vim.g.base46_cache .. "rainbowdelimiters")
      require("rainbow-delimiters.setup").setup()
    end
  }
  --
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = function()
  --     local opts = {
  --       extensions = {
  --         fzf = {
  --           fuzzy = true,
  --           override_generic_sorter = true,
  --           override_file_sorter = true,
  --           case_mode = "smart_case",
  --         }
  --       }
  --     }
  --     require("telescope").load_extension("fzf")
  --     return opts
  --   end
  -- }
}
