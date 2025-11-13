return {
  -- Not convinced with blink yet
  -- { import = "nvchad.blink.lazyspec", },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "scala",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   "nvimtools/none-ls.nvim",
    --   config = function()
    --     require "configs.null-ls"
    --   end,
    -- },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        "sonarlint-language-server",

        "typescript-language-server",
        "eslint-lsp",

        "html-lsp",

        "stylelint-lsp",
        "css-lsp",
        "cssmodules-language-server",

        "tailwindcss-language-server",

        "json-lsp",

        "marksman",
      },
    },
  },
  {
    "bkad/CamelCaseMotion",
    event = "BufEnter",
    config = function()
      vim.fn["camelcasemotion#CreateMotionMappings"] "<leader>"
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"

      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }
    end,
    event = "VimEnter",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>" },
      { "<C-j>" },
      { "<C-k>" },
      { "<C-l>" },
      { "<C-\\>" },
    },
  },
  { "djoshea/vim-autoread", event = "BufEnter" },
  { "easymotion/vim-easymotion", event = "BufEnter" },
  { "jeffkreeftmeijer/vim-numbertoggle", event = "BufEnter" },
  { "junegunn/gv.vim", event = "VimEnter" },
  {
    "mbbill/undotree",
    cmd = {
      "UndotreeFocus",
      "UndotreeHide",
      "UndotreePersistUndo",
      "UndotreeShow",
      "UndotreeToggle",
    },
  },
  {
    "mileszs/ack.vim",
    cmd = { "Ack", "AckAdd", "AckFile", "AckFromSearch", "AckHelp", "AckWindow" },
    init = function()
      require "configs.ack"
    end,
  },
  { "Olical/vim-enmasse", event = "BufEnter" },
  { "PeterRincker/vim-argumentative", event = "BufEnter" },
  -- { "sheerun/vim-polyglot", event = "BufEnter" },
  { "tmhedberg/indent-motion", event = "BufEnter" },
  {
    "tpope/vim-abolish",
    -- cmd = { "Abolish", "Subvert" },
    event = { "BufEnter" },
    keys = { "crs", "crm", "crc", "cru", "cr-", "cr." },
    config = function()
      require "configs.abolish"
    end,
  },
  { "tpope/vim-eunuch", event = "VimEnter" },
  { "tpope/vim-fugitive", event = "BufEnter" },
  -- { "tpope/vim-obsession", event = "VimEnter" },
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },
  { "tpope/vim-repeat", event = "BufEnter" },
  { "tpope/vim-sensible", event = "VimEnter" },
  { "tpope/vim-sleuth", event = "BufEnter" },
  { "tpope/vim-surround", event = "BufEnter" },
  { "tpope/vim-unimpaired", event = "VimEnter" },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    cmd = { "Neorg" },
    dependencies = {
      "luarocks.nvim",
      "nvim-neorg/neorg-telescope",
    },
    init = function()
      require "configs.neorg"
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      -- Your setup opts here
    },
  },
  -- copying over from default to disable cmd and override config
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    lazy = false,
    -- cmd = { "NvimTreeFocus" },
    -- event = { "NvimTreeSetup" },
    config = true,
  },
  {
    "rmagatti/goto-preview",
    keys = { "gpd", "gPd", "gpt", "gpi", "gP", "gpr" },
    config = function()
      require("goto-preview").setup {
        default_mappings = true,
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    cmd = { "Neotest" },
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run File",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true, auto_close = true }
        end,
        desc = "Show Output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop",
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-vitest",
          require "neotest-jest" {
            jestCommand = "npm test -- --maxWorkers=50% --expand",
            -- jestConfigFile = "jest.config.ts",
            env = {
              CI = true,
              TZ = "UTC",
            },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = {
      "TSContextEnable",
      "TSContextDisable",
      "TSContextToggle",
    },
    event = {
      "BufEnter",
    },
  },
  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
  },
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    event = "User FilePost",
    config = function()
      require("sonarlint").setup {
        connected = {
          -- client_id is the ID of the Sonar LSP
          -- url is the url it wants to connect to
          get_credentials = function(client_id, url)
            -- This must return a string (User token)
            -- This is the default function. You can just set the environment variable.
            -- return vim.fn.getenv("SONAR_TOKEN_NVIM")
          end,
        },
        server = {
          settings = {
            sonarlint = {
              connectedMode = {
                connections = {
                  sonarqube = {
                    {
                      -- connectionId = "<server id to use in projects>",
                      connectionId = "sonarqube-ihq",
                      -- this is the url that will go into get_credentials
                      serverUrl = "https://sonar.private.prod.teddy.k8s.intenthq.com/",
                      disableNotifications = false,
                    },
                  },
                  -- sonarcloud = {
                  --   {
                  --     connectionId = "<server id to use in projects>",
                  --     region = "US", -- or EU
                  --     organizationKey = "<organization key from sonarcloud>",
                  --     disableNotifications = false,
                  --   },
                  -- },
                },
              },
            },
          },
          before_init = function(params, config)
            -- Your personal configuration needs to provide a mapping of root folders and project keys
            --
            -- In the future a integration with https://github.com/folke/neoconf.nvim or some similar
            -- plugin, might be worthwhile.
            local project_root_and_ids = {
              ["/Users/ismaelperez/projects/insights-agent"] = "intenthq_insights-agent_62db8fdd-f2cd-4344-9509-5f6babd8ecf5",
              -- … further mappings …
            }

            -- disabling connected mode for now, as no rules are being revceived
            -- config.settings.sonarlint.connectedMode.project = {
            --   connectionId = "sonarqube-ihq",
            --   projectKey = project_root_and_ids[params.rootPath],
            -- }
          end,
          cmd = {
            "/Users/ismaelperez/.local/share/nvim/mason/packages/sonarlint-language-server/sonarlint-language-server",
            -- Ensure that sonarlint-language-server uses stdio channel
            "-stdio",
            "-analyzers",
            -- paths to the analyzers you need, using those for python and java in this example
            -- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
            -- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
            -- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
            -- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
            vim.fn.expand "/Users/ismaelperez/.local/share/nvim/mason/share/sonarlint-analyzers/sonar/sonarjs.jar",
            vim.fn.stdpath "data" .. "/mason/share/sonarlint-analyzers/sonarjava.jar",
            vim.fn.stdpath "data" .. "/mason/share/sonarlint-analyzers/sonarjs.jar",
          },
        },
        filetypes = {
          -- Tested and working
          -- 'python',
          -- 'cpp',
          -- 'java',
          "javascript",
          "typescript",
          "typescriptreact",
          "scala",
          "sbt",
          "java",
        },
      }
    end,
  },
  {
    "neomake/neomake",
    cmd = { "Neomake" },
  },
  -- {
  --   "folke/edgy.nvim",
  --   event= "VeryLazy",
  --   config = function()
  --     require("edgy").setup({
  --       right = {
  --         {ft = "neotest-summary", name = "Neotest"},
  --       }
  --     })
  --   end,
  -- },
  -- {
  --   "Exafunction/codeium.nvim",
  --   event = "BufEnter",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({ })
  --   end,
  -- },
  -- -- this is only needed if/when using codeium
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local options = require "plugins.configs.cmp"
  --     options.sources = {
  --       { name = "nvim_lsp" },
  --       { name = "codeium" },
  --       { name = "luasnip" },
  --       { name = "path" },
  --       { name = "buffer" },
  --       { name = "nvim_lua" },
  --     }
  --
  --     -- options.experimental = {
  --     -- disabled while codeium.nvim is not working that well
  --     -- ghost_text = true,
  --     -- }
  --
  --     return options
  --   end
  -- },
  -- codeium.vim gives far better suggestions
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  --   init = function ()
  --     vim.g.codeium_disable_bindings = 1
  --   end,
  --   config = function()
  --     vim.keymap.set('i', '<M-CR>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  --     vim.keymap.set('i', '<M-Tab>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
  --     vim.keymap.set('i', '<M-S-Tab>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  --     vim.keymap.set('i', '<M-Esc>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  --   end
  -- },
  -- {
  --   "github/copilot.vim",
  --   event = "BufEnter",
  --   init = function()
  --     vim.keymap.set('i', '<M-CR>', 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false
  --     })
  --     vim.g.copilot_no_tab_map = true
  --   end,
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "github/copilot.vim" },
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  --   cmd = {
  --     "CopilotChat",
  --     "CopilotChatNext",
  --     "CopilotChatPrev",
  --     "CopilotChatToggleAutoSuggest",
  --     "CopilotChatComplete",
  --     "CopilotChatDismiss",
  --   },
  --   keys = {
  --     { "<leader>ac", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
  --     { "<leader>ae", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
  --     { "<leader>ar", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
  --     { "<leader>af", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues" },
  --     { "<leader>ao", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
  --     { "<leader>ad", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
  --     { "<leader>at", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" },
  --     { "<leader>am", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
  --     { "<leader>as", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate Commit for Selections" },
  --   },
  -- },
  -- {
  --   url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git" ,
  --   lazy = false
  -- },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        inlayHints = {
          hintsInPatternMatch = { enable = true },
          implicitArguments = { enable = true },
          implicitConversions = { enable = false },
          inferredTypes = { enable = true },
          typeParameters = { enable = true },
          namedParameters = { enable = true },
          byNameParameters = { enable = true },
        },
      }
      metals_config.init_options.statusBarProvider = "off"
      metals_config.on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("AutoFormatting", {})
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
  -- {
  --   "j-hui/fidget.nvim",
  --   event = "User FilePost",
  --   opts = {
  --     notification = {
  --       window = {
  --         winblend = 0,
  --       },
  --     },
  --   }
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      --"nvim-telescope/telescope-ui-select.nvim"
    },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
      -- telescope.load_extension("ui-select")
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = function()
  --     -- conditionally use the correct build system for the current OS
  --     if vim.fn.has("win32") == 1 then
  --       return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  --     else
  --       return "make"
  --     end
  --   end,
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "openai",
  --     -- provider = "claude",
  --     providers = {
  --       openai = {
  --         model = "4o",
  --         disable_tools = {
  --           "web_search"
  --         },
  --       }
  --       -- claude = {
  --       --   endpoint = "https://api.anthropic.com",
  --       --   model = "claude-sonnet-4-20250514",
  --       --   timeout = 30000, -- Timeout in milliseconds
  --       --   extra_request_body = {
  --       --     temperature = 0.75,
  --       --     max_tokens = 20480,
  --       --   },
  --       -- },
  --     },
  --     suggestion = {
  --       debounce = 3000,
  --       throttle = 3000,
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "stevearc/dressing.nvim", -- for input provider dressing
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
}
