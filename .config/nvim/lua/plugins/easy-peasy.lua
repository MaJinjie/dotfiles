return {
   {
      "mg979/vim-visual-multi",
      init = function()
         vim.g.VM_theme = "sand"
         vim.g.VM_silent_exit = 1
         vim.g.VM_show_warnings = 0
         vim.g.VM_mouse_mappings = 1
         vim.g.VM_maps = {
            ["Select h"] = "<S-A-h>",
            ["Select l"] = "<S-A-l>",
            ["Select Cursor Down"] = "<S-A-j>",
            ["Select Cursor Up"] = "<S-A-k>",
            ["Add Cursor Down"] = "<S-A-n>",
            ["Add Cursor Up"] = "<S-A-p>",
            ["Find Under"] = "<C-n>",
         }
      end,
      event = "LazyFile",
   },
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "LazyFile",
      opts = {
         keymaps = {
            normal = "gsy",
            normal_cur = "gsyy",
            normal_line = "gsY",
            normal_cur_line = "gsYY",
            visual = "gs",
            visual_line = "gS",
            delete = "gsd",
            change = "gsc",
            change_line = "gsC",
         },
      },
   },
   {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      opts = { default_mappings = false, mappings = { i = { j = { k = "<Esc>" }, J = { K = "<Esc>" } } } },
   },
   {
      "folke/twilight.nvim",
      cmd = "Twilight",
      keys = { { "<leader>ut", "<cmd> Twilight <cr>", desc = "Toggle Twilight" } },
   },
   {
      "Wansmer/treesj",
      cmd = "TSJToggle",
      keys = { { "<leader>j", "<cmd> TSJToggle <cr>", desc = "Toggle Treesitter Join" } },
      opts = { use_default_keymaps = false },
   },
   { "keaising/im-select.nvim", event = "InsertEnter", opts = {} },
}
