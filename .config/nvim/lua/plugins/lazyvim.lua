return {
   {
      "folke/persistence.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").select() end, desc = "Select Session" },
      { "<leader>qS", function() require("persistence").save() end, desc = "Save Session" },
      { "<leader>ql", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>qL", function() require("persistence").load({last = true}) end, desc = "Restore Last Session" },
    },
   },
   {
      "echasnovski/mini.pairs",
      init = function()
         local map_bs = function(lhs, rhs)
            vim.keymap.set({ "i", "c" }, lhs, rhs, { expr = true, replace_keycodes = false })
         end

         map_bs("<C-h>", "v:lua.MiniPairs.bs()")
         map_bs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
         map_bs("<C-u>", 'v:lua.MiniPairs.bs("\21")')
      end,
      opts = {
         mappings = {
            [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
         },
      },
   },
   {
      "hedyhli/outline.nvim",
      opts = {
         outline_items = { show_symbol_lineno = true },
         preview_window = { open_hover_on_preview = true, live = true },
         keymaps = {
            show_help = "?",
            close = "q",
            peek_location = "o",
            goto_location = "O",
            goto_and_close = "<cr>",

            restore_location = "<C-g>",

            hover_symbol = "K",

            toggle_preview = "p",
            rename_symbol = "r",
            code_actions = "a",

            fold = "h",
            unfold = {},
            fold_all = "zM",
            unfold_all = "zR",
            fold_toggle = { "za", "<Tab>", "l" },
            fold_toggle_all = "zA",
            fold_reset = "R",

            down_and_jump = { "<C-j>", "<Up>" },
            up_and_jump = { "<C-k>", "Down" },
         },
         symbols = {
            -- stylua: ignore
            filter = {
               rust = { "Module", "Struct", "Field", "Enum", "EnumMember", "Object", "Function", "Method", "TypeParameter", "Constant" },
            },
         },
      },
   },
}
