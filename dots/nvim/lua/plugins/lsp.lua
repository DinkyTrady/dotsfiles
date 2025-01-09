return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<C-k>", false, mode = "i" }
    end,
    opts = {
      servers = {
        html = {},
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
        },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
}
