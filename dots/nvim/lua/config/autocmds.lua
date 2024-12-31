-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
  vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

autocmd("LspAttach", {
  callback = function()
    require("config.lsp-settings")
  end,
})

vim.api.nvim_set_hl(0, "CursorLine", { bg = nil })
vim.api.nvim_command("redraw")

-- java indent
autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- relative number
local cmdgroup = augroup("CmdlineLineNr")
local cmdline_debuonce_timer

autocmd("CmdLineEnter", {
  group = cmdgroup,
  callback = function()
    cmdline_debuonce_timer = vim.uv.new_timer()
    ---@diagnostic disable-next-line: need-check-nil
    cmdline_debuonce_timer:start(
      100,
      0,
      vim.schedule_wrap(function()
        if vim.o.number then
          vim.o.relativenumber = false
          vim.api.nvim__redraw({ statuscolumn = true })
        end
      end)
    )
  end,
})

autocmd("CmdLineLeave", {
  group = cmdgroup,
  callback = function()
    if cmdline_debuonce_timer then
      cmdline_debuonce_timer:stop()
      cmdline_debuonce_timer = nil
    end
    if vim.o.number then
      vim.o.relativenumber = true
    end
  end,
})
