if LazyVim.has("vim-dadbod-ui") then
   if lazyvim_docs then
      -- The setup below will automatically configure connections without the need for manual input each time.

      -- Example configuration using dictionary with keys:
      --    vim.g.dbs = {
      --      dev = "Replace with your database connection URL.",
      --      staging = "Replace with your database connection URL.",
      --    }
      -- or
      -- Example configuration using a list of dictionaries:
      --    vim.g.dbs = {
      --      { name = "dev", url = "Replace with your database connection URL." },
      --      { name = "staging", url = "Replace with your database connection URL." },
      --    }

      -- or
      -- Create a `.lazy.lua` file in your project and set your connections like this:
      -- ```lua
      --    vim.g.dbs = {...}
      --
      --    return {}
      -- ```

      -- Alternatively, you can also use other methods to inject your environment variables.

      -- Finally, please make sure to add `.lazy.lua` to your `.gitignore` file to protect your secrets.
   end
   vim.g.db_ui_winwidth = 30
   vim.g.db_ui_show_help = 0
   vim.g.db_ui_table_helpers = {
      sqlite = {
         Count = "select count(*) from {table}",
      },
   }
   vim.api.nvim_create_autocmd("FileType", {
      pattern = "dbui",
      callback = function()
         vim.keymap.set("n", "l", "<Plug>(DBUI_SelectLine)", { desc = "Open/Toggle Drawer options", buffer = true })
         vim.keymap.set("n", "h", "<Plug>(DBUI_GotoParentNode)", { buffer = true })
         vim.keymap.set("n", "<", "<Plug>(DBUI_GotoFirstSibling)", { buffer = true, noremap = true })
         vim.keymap.set("n", ">", "<Plug>(DBUI_GotoLastSibling)", { buffer = true, noremap = true })
         -- vim.keymap.set("n", "J", "<Plug>(DBUI_GotoNextSibling)", { buffer = true, noremap = true })
         -- vim.keymap.set("n", "K", "<Plug>(DBUI_GotoPrevSibling)", { buffer = true, noremap = true })
      end,
   })
end
