-- 检查-> 网络 -> search "graphql" + copy cookie
---@type LazyPluginSpec
return {
   "kawre/leetcode.nvim",
   lazy = "leetcode" ~= vim.fn.argv()[1],
   cmd = "Leet",
   opts = {
      arg = "leetcode",
      lang = "python3",
      cn = { enabled = true, translator = false, translate_problems = false },
      injector = {
         ["rust"] = { before = { "struct Solution {}" }, after = "fn main() {}" },
         ["cpp"] = { before = { "#include <bits/stdc++.h>", "using namespace std;" }, after = "int main() {}" },
         -- ["python3"] = { before = { "from typing import List" } },
      },
      hooks = {
         ["question_enter"] = {
            -- 设置选项
            function()
               local opt = vim.opt_local
               -- LazyVim.format.enable(false, true) -- 取消自动格式化

               opt.shiftwidth = 4
               opt.tabstop = 4
               vim.cmd("LspStop")
            end,
            -- 设置映射键
            function()
               local map = vim.keymap.set

               map("n", "<localleader>t", "<cmd> Leet test <cr>", { desc = "leetcode test", buffer = true })
               map("n", "<localleader>r", "<cmd> Leet submit <cr>", { desc = "leetcode submit", buffer = true })
               map("n", "<localleader>R", "<cmd> Leet reset <cr>", { desc = "leetcode reset", buffer = true })
               map("n", "<localleader>l", "<cmd> Leet list <cr>", { desc = "leetcode list", buffer = true })
               map(
                  "n",
                  "<localleader>L",
                  "<cmd> Leet last_submit <cr>",
                  { desc = "leetcode last_submit", buffer = true }
               )
               map("n", "<localleader>q", "<cmd> Leet exit <cr>", { desc = "leetcode exit", buffer = true })
               map("n", "<localleader>c", "<cmd> Leet console <cr>", { desc = "leetcode console", buffer = true })
               map("n", "<localleader>i", "<cmd> Leet info <cr>", { desc = "leetcode info", buffer = true })
               map(
                  "n",
                  "<localleader>e",
                  "<cmd> Leet desc toggle <cr>",
                  { desc = "leetcode desc toggle", buffer = true }
               )
            end,
            -- 特定于语言的配置
            function()
               local ft = vim.bo.filetype

               if ft == "rust" then
                  -- vim.cmd.RustAnalyzer({ "stop" })
               end
            end,
         },
      },
   },
   dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
   },
}
