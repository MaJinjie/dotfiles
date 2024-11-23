return {
   {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "bash" } },
   },
   {
      "neovim/nvim-lspconfig",
      opts = {
         servers = {
            bashls = {},
         },
      },
   },
   {
      "mfussenegger/nvim-lint",
      opts = {
         linters_by_ft = {
            sh = { "shellcheck" },
         },
      },
   },
   {
      "stevearc/conform.nvim",
      opts = {
         formatters_by_ft = {
            zsh = { "shfmt" },
         },
      },
   },
   {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "shellcheck", "bash-debug-adapter" } },
   },
}
