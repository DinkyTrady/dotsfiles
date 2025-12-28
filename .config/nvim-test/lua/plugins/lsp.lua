return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<C-k>", false, mode = "i" }
    end,
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        pylsp = {},
        html = {},
        emmet_language_server = {},
        cssls = {},
        nixd = {},
        nil_ls = {
          settings = {
            nix = {
              flake = {
                autoArchive = true,
              },
            },
          },
        },
        jdtls = {},
        tinymist = {},
      },
      setup = {
        jdtls = function()
          return true
        end,
      },
    },
  },
  {
    "jmbuhr/otter.nvim",
    event = "LazyFile",
    opts = {},
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.4.5",
    event = "LazyFile",
    opts = {
      notification = {
        window = {
          winblend = 0,
          align = "top",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    -- event = "BufReadPre",
    dependencies = {
      "mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
      "ibhagwan/fzf-lua", -- 可选
    },
    opts = {},
  },
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:indika-dev/personal-mason-registry",
        "github:mason-org/mason-registry",
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {

        slash_commands = {
          ["file"] = {
            opts = {
              provider = "telescope",
              contains_code = true,
            },
          },
        },
      },
      display = {
        action_pallete = {
          provider = "telescope",
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            title = "CodeCompanionactions", -- The title of the action palette
          },
        },
      },
      prompt_library = {
        ["Typescript Developer"] = {
          opts = {
            index = 1,
            ignore_sytem_prompt = true,
          },
          strategy = "chat",
          prompts = {
            {
              role = "system",
              content = [[
                You are expert senior fullstack typescript developer that uses bunjs for the runtime, postgresql, Honojs for the server, drizzle for the orm (use bun-sql), and uses zod for validation.
                you always explaining like a teacher that teach their students who doesn't know anything about programming.

                you always use the best practice to give code example of user prompt.
              ]],
            },
            {
              role = "user",
              content = "",
            },
          },
        },
      },
      adapters = {
        gemini = {},
        -- copilot = function()
        --   return require("codecompanion.adapters").extend("copilot", {
        --     schema = {
        --       model = {
        --         default = "claude-3.7-sonnet",
        --       },
        --     },
        --   })
        -- end,
      },
    },
  },
  { "zbirenbaum/copilot.lua", cmd = "Copilot", opts = {} },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  -- {
  --   "danymat/neogen",
  --   cmd = "Neogen",
  --   opts = {},
  -- },
}
