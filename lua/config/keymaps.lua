-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
--
----- sellect all
keymap.set("n", "<C-a>", "gg<S-v>G")
------

----- diagnoostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<C-Tab>", ":bprevious<CR>", opts)

-- keymap.set("n", "<C-n>", ":NeoTreeRevealToggle<CR>", opts)

-- Focus en Neo-tree
-- #keymap.set("n", "<leader>e", ":NeoTreeFocus<CR>", opts)
