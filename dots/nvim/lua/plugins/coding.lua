return {
  {
    "saghen/blink.cmp",
    enabled = true,
    ---@module 'blink-cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        documentation = { auto_show_delay_ms = 100 },
      },
      keymap = {
        preset = "none",
        -- tab for snippet
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

        -- completion window
        ["<C-n>"] = { "show", "show_documentation", "fallback" },
        ["<C-e>"] = { "hide", "hide_documentation" },

        -- accept
        ["<CR>"] = { "select_and_accept", "fallback" },

        -- documentation
        ["<A-b>"] = { "scroll_documentation_up", "fallback" },
        ["<A-f>"] = { "scroll_documentation_down", "fallback" },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    -- enabled = true,
    dependencies = { "hrsh7th/cmp-nvim-lsp-signature-help" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local function has_words_before()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      opts.formatting = vim.tbl_extend("force", opts.formatting, {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          item.abbr = string.sub(item.abbr, 1, 15)
          return item
        end,
      })

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { --[[ { name = "emoji", insert = true }, ]]
        { name = "nvim_lsp_signature_help" },
      }))
    end,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recomended as each new version will have breaking changes
    opts = {},
  },
}
