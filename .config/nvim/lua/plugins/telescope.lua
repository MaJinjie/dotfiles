return {
   "nvim-telescope/telescope.nvim",
   dependencies = { "fdschmidt93/telescope-egrepify.nvim" },
   keys = {
      { "<leader>s:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>s<enter>", "<cmd>Telescope resume<cr>", desc = "Resume" },
      {
         "<leader>sc",
         function()
            _G.Grep({ cwd = vim.fn.stdpath("config") })
         end,
         desc = "Grep (Cwd)",
      },
      {
         "<leader>sg",
         function()
            _G.Grep({ cwd = LazyVim.root() })
         end,
         desc = "Grep (Root Dir)",
      },
      {
         "<leader>sG",
         function()
            _G.Grep({ cwd = vim.uv.cwd() })
         end,
         desc = "Grep (Cwd)",
      },
      {
         "<leader>sB",
         function()
            _G.Grep({ grep_open_files = true })
         end,
         desc = "Grep Buffers",
      },
      {
         "<leader>s/",
         function()
            local opts = { cwd = LazyVim.root() }
            if vim.bo.filetype ~= "" then
               local vimgrep_arguments = LazyVim.get_plugin("telescope.nvim").opts.defaults.vimgrep_arguments
               vimgrep_arguments = vim.deepcopy(vimgrep_arguments)
               opts.vimgrep_arguments = vim.list_extend(vimgrep_arguments, { "--type", vim.bo.filetype })
            end
            _G.Grep(opts)
         end,
      },
      {
         "<leader>f/",
         function()
            local opts = { cwd = LazyVim.root() }
            if vim.bo.filetype ~= "" then
               local find_command = LazyVim.get_plugin("telescope.nvim").opts.defaults.find_command
               find_command = vim.deepcopy(find_command)
               opts.find_command = vim.list_extend(find_command, { "--type", vim.bo.filetype })
            end
            _G.Find(opts)
         end,
      },
      {
         "<leader>f.",
         function()
            _G.Find({
               prompt_title = "Dot Files",
               gitdir = vim.env.DOT_GIT_DIR,
               toplevel = vim.env.DOT_GIT_WORK_TREE,
            })
         end,
         desc = "Find Dot Files"
      },
   },
   opts = {
      defaults = {
         layout_strategy = "flex",
         sorting_strategy = "ascending",
         dynamic_preview_title = true,
         file_ignore_patterns = { ".git/", ".github/" },
         git_worktrees = {
            {
               gitdir = vim.env.DOT_GIT_DIR,
               toplevel = vim.env.DOT_GIT_WORK_TREE,
            },
         },
         layout_config = {
            prompt_position = "top",
            bottom_pane = { height = 13, preview_cutoff = 120 },
            center = { height = 14, width = 60, preview_cutoff = 150 },
            horizontal = { height = 0.8, width = 0.9, preview_width = 0.6, preview_cutoff = 120 },
            vertical = { height = 0.95, width = 0.85, preview_height = 0.3, preview_cutoff = 15 },
            flex = {
               flip_columns = 120,
               flip_lines = 15,
               horizontal = { height = 0.8, width = 0.9, preview_width = 0.6, preview_cutoff = 120 },
               vertical = { height = 0.95, width = 0.85, preview_height = 0.3, preview_cutoff = 15 },
            },
         },
         mappings = {
            i = {
               ["<C-u>"] = false,
               ["<C-Tab>"] = function(prompt_bufnr)
                  require("telescope.actions").select_tab(prompt_bufnr)
               end,
            },
         },
      -- stylua: ignore
      vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
         find_command = { "rg", "--files", "--color", "never" },
      },
      pickers = {
         buffers = { layout_strategy = "center" },
         find_files = { layout_strategy = "center" },
         git_files = { layout_strategy = "center" },
         oldfiles = { layout_strategy = "center" },
         current_buffer_fuzzy_find = { layout_strategy = "vertical", preview = { hide_on_startup = true } },
      },
      extensions = {
         fzf = {
            fuzzy = false, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
         },
         egrepify = {
            layout_strategy = "vertical",

            prefixes = {
               ["##"] = {
                  -- in the above example #lua,md -> input: lua,md -> output: --glob="*.{lua,md}"
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[*.{%s}]], input)
                  end,
               },
               ["#!"] = {
                  -- in the above example #lua,md -> input: lua,md -> output: --glob="!*.{lua,md}"
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[!*.{%s}]], input)
                  end,
               },
               -- filter for (partial) folder names
               ["<>"] = {
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[**/%s*/**]], input)
                  end,
               },
               [">>"] = {
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[%s*/**]], input)
                  end,
               },
               ["<<"] = {
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[**/%s*/*]], input)
                  end,
               },
               ["@@"] = {
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[%s]], input)
                  end,
               },
               ["@!"] = {
                  flag = "iglob",
                  cb = function(input)
                     return string.format([[!%s]], input)
                  end,
               },
            },
         },
      },
   },
}
