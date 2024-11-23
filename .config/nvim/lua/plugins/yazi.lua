return {
   "mikavilpas/yazi.nvim",
   keys = {
      {
         "<leader>fy",
         "<cmd>Yazi<cr>",
         desc = "Explorer Yazi (Dir Now)",
      },
      {
         "<leader>fY",
         "<cmd>Yazi cwd<cr>",
         desc = "Explorer Yazi (Cwd)",
      },
   },
   opts = {
      keymaps = { show_help = "g?" },
      integrations = {
         grep_in_directory = function(directory)
            _G.Grep({ cwd = directory })
         end,
         grep_in_selected_files = function(selected_files)
            local search_dirs = vim.tbl_map(function(value)
               return value.filename
            end, selected_files)
            _G.Grep({ search_dirs = search_dirs })
         end,
      },
   },
}
