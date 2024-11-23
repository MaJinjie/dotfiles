return {
   {
      "nvim-neo-tree/neo-tree.nvim",
      opts = function(_, opts)
         local command = require("neo-tree.command")

         local function open_and_close(state)
            state.commands.open(state)
            command.execute({ action = "close" })
         end

         return vim.tbl_deep_extend("force", opts, {
            commands = {
               open_and_close = open_and_close,
            },
            window = { width = 30, mappings = { ["<CR>"] = "open_and_close" } },
            filesystem = { window = { mappings = { f = "fuzzy_sorter", F = "fuzzy_sorter_directory" } } },
         })
      end,
   },
}
