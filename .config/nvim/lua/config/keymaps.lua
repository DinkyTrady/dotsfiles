-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

map("i", "<C-h>", "<LEFT>", { desc = "Move cursor to left" })
map("i", "<C-j>", "<DOWN>", { desc = "Move cursor to down" })
map("i", "<C-k>", "<Up>", { desc = "Move cursor to up", remap = true })
map("i", "<C-l>", "<RIGHT>", { desc = "Move cursor to right" })

map({ "n", "x" }, "<leader>h", ":noh<cr>", { desc = "Remove search highlight" })

map("n", "<leader>r", ":set rnu!<cr>", { desc = "Relative Number toggle" })

-- open mini files
-- map("n", ",", function()
--   require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
-- end, { desc = "Open mini.files in current dir files" })

-- Scrolling
map("n", "<ScrollWheelUp>", "<C-y><C-y><C-y><C-y><C-y>")
map("n", "<ScrollWheelDown>", "<C-e><C-e><C-e><C-e><C-e>")

-- n/N to zz
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- vim.keymap.del("n", "<leader>gg")
-- vim.keymap.d;el("n", "<leader>gG")
