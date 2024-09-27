-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local map = LazyVim.safe_keymap_set
local map = vim.keymap.set
local unmap = vim.keymap.del
-- vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" }),

-- unmap
-- map("n", "<C-k>", "<Nop>")
-- map("n", "<C-j>", "<Nop>")
-- map("n", "<C-h>", "<Nop>")
-- map("n", "<C-l>", "<Nop>")
-- unmap("n", "<leader>fn")
map("n", "<leader>ww", "<Nop>")
map("n", "<leader>q", "<Nop>")

-- Quit
map("n", "<leader>q", "<cmd>q<cr><esc>", { desc = "[q]uit" })
-- Write
map("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "Write Buf" })
map("n", "<leader>wa", "<cmd>wa<cr><esc>", { desc = "Write All" })

-- Splits
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

map("v", ">", ">gv", { desc = "Persist select" })
map("v", "<", "<gv", { desc = "Persist select" })

local files = require("config.files")
map("n", "<leader>fn", files.new_file, { desc = "New File" })
map("n", "<leader>fr", files.rename_file, { desc = "Rename File" })

-- Git
