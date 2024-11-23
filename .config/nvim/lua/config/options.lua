-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = "JetBrainsMono Nerd Font,Hack Nerd Font"
vim.opt.swapfile = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.g.autoformat = false

-- python
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- neovide
if vim.g.neovide then
   vim.g.neovide_scale_factor = 0.75
   vim.g.neovide_padding_top = 5
   vim.g.neovide_padding_bottom = 0
   vim.g.neovide_padding_right = 0
   vim.g.neovide_padding_left = 0
   vim.g.neovide_transparency = 0.8
   vim.g.neovide_window_blurred = true
   vim.g.neovide_hide_mouse_when_typing = true
   -- vim.g.neovide_flatten_floating_zindex = "20"
   -- vim.g.neovide_floating_shadow = false
   vim.g.neovide_remember_window_size = true
end

vim.filetype.add({
   pattern = {
      [".*ignore"] = "gitignore",
   },
})

-- Custom Variables

-- Custom Functions

--- 文件查找
---
--- @param opts table 传递的选项
function Find(opts)
   if opts.gitdir then
      if not opts.toplevel then
         opts.toplevel = vim.fs.dirname(opts.gitdir)
      end
      local gitdir, toplevel = vim.env.GIT_DIR, vim.env.GIT_WORK_TREE
      vim.env.GIT_DIR = opts.gitdir
      vim.env.GIT_WORK_TREE = opts.toplevel
      require("telescope.builtin").git_files(opts)
      vim.env.GIT_DIR = gitdir
      vim.env.GIT_WORK_TREE = toplevel
   else
      require("telescope.builtin").find_files(opts)
   end
end

--- 文本内容查找
---
--- @param opts table 传递的选项
function Grep(opts)
   require("telescope").extensions.egrepify.egrepify(opts)
end
