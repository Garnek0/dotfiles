require("config.lazy")

vim.cmd "TSEnable highlight"
vim.cmd "TSEnable indent"

-- OPTIONS

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- KEYMAPS

local map = vim.keymap.set

map("n", "<Leader>ff", ":lua require'telescope.builtin'.find_files()<cr>", { desc = "Find Files"} )
map("n", "<Leader>fs", ":lua require'telescope.builtin'.live_grep()<cr>", { desc = "Find String"} )
map("n", "<Leader>sh", ":sv<cr>", { desc = "Split Horizontally"} )
map("n", "<Leader>sv", ":vs<cr>", { desc = "Split Vertically"} )
map("n", "<C-h>", ":wincmd h<cr>", { desc = "Activate Left Split"} )
map("n", "<C-l>", ":wincmd l<cr>", { desc = "Activate Right Split"} )
map("n", "<C-j>", ":wincmd j<cr>", { desc = "Activate Above Split"} )
map("n", "<C-k>", ":wincmd k<cr>", { desc = "Activate Below Split"} )

local ntapi = require "nvim-tree.api"

map("n", "a", ntapi.fs.create)
map("n", "d", ntapi.fs.remove)
map("n", "r", ntapi.fs.rename)
