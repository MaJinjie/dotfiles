-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("i", "<C-e>", "<End>", { desc = "Jump to Current line end" })
map("i", "<C-CR>", "<Esc>o", { desc = "Jump to Next line" })
map({ "i", "x", "n", "s" }, "<C-s>", function()
   LazyVim.format.format({ force = true })
   vim.cmd("w")
end, { desc = "Save File And Format File" })

-- lazygit
map("n", "<leader>g.", function()
   LazyVim.lazygit({ args = { "--git-dir", vim.env.DOT_GIT_DIR, "--work-tree", vim.env.DOT_GIT_WORK_TREE } })
end, {desc = "Lazygit (Dotfiles)"})
