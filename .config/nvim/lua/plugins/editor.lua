local Util = require("lazyvim.util")
return {
  {
    "SmiteshP/nvim-navic",
    enabled = false,
    lazy = true,
    event = "LazyFile",
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      _G.Winbar = {}

      local fn = vim.fn
      vim.api.nvim_set_hl(0, "edited", { fg = "#9ece6a" })
      vim.api.nvim_set_hl(0, "NavicSeparator", { bg = nil })

      local sep = function()
        ---@diagnostic disable-next-line: deprecated
        if require("nvim-navic").get_location() ~= "" then
          return "%#NavicSeparator#" .. " > " .. "%*"
        end

        return ""
      end

      local fileName = function()
        if vim.bo.filetype ~= "dashboard" then
          return "%#NavicText#" .. fn.expand("%:t")
        end

        return ""
      end

      local function modified()
        if vim.bo.modified then
          return "%#edited#" .. "● " .. "%*"
        elseif vim.bo.modifiable == false or vim.bo.readonly == true then
          return " "
        end

        return ""
      end

      _G.Winbar.setup = function()
        return table.concat({
          " ",
          modified(),
          fileName(),
          sep(),
          require("nvim-navic").get_location(),
        })
      end

      vim.opt.winbar = "%{%v:lua.Winbar.setup()%}"

      return {
        click = true,
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
        lazy_update_context = true,
      }
    end,
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { ";b", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { ";c", Util.pick.config_files(), desc = "Find Config File" },
      { ";C", Util.pick("colorschemes"), desc = "Change Colorschemes" },
      { ";f", Util.pick("files"), desc = "Find Files (root dir)" },
      -- stylua: ignore
      { ";F", Util.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { ";r", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
      { ";R", Util.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { ";E", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document diagnostics" },
      { ";e", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
      { ";w", Util.pick("live_grep"), desc = "Grep (root dir)" },
      { ";W", Util.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { ";h", Util.pick("helptags"), desc = "Help Pages" },
      { ";m", Util.pick("marks"), desc = "Jump to Mark" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_c)
      -- table.remove(opts.sections.lualine_c)
      -- table.remove(opts.sections.lualine_c)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = "   <author>, <author_time:%c> - <summary>",
    },
  },
}
