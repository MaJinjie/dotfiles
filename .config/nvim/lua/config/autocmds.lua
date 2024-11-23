-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- neovide
autocmd({ "InsertEnter", "InsertLeave", "CmdlineEnter", "CmdlineLeave", "TermRequest", "TermLeave" }, {
   pattern = "*",
   group = augroup("Ime-input", { clear = true }),
   callback = function(ev)
      if ev.event:match("Leave$") then
         vim.g.neovide_input_ime = false
      else
         vim.g.neovide_input_ime = true
      end
   end,
})
