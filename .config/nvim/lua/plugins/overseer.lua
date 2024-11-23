return {
   "stevearc/overseer.nvim",
   cmd = {
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearCache",
   },
   keys = {
      { "<leader>oe", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>ol", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>oL", "<cmd>OverseerQuickAction<cr>", desc = "Actions recent task" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
      { "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Recent Task" },
      { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
   },
   opts = {
      task_list = {
         direction = "right",
         bindings = {
            ["J"] = "NextTask",
            ["K"] = "PrevTask",
            ["<C-h>"] = false,
            ["<C-j>"] = false,
            ["<C-k>"] = false,
            ["<C-l>"] = false,
         },
      },
   },
}
