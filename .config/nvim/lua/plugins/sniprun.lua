---@type LazyPluginSpec
return {
   "michaelb/sniprun",
   cmd = { "SnipInfo", "SnipRun", "SnipReset", "SnipClose", "SnipLive" },
   branch = "master",
   build = "sh install.sh",
   opts = {
      selected_interpreters = { "Python3_fifo" },
      repl_enable = { "Python3_fifo" },
      interpreter_options = {
         Python3_fifo = {
            interpreter = "python3.12",
            venv = {},
         },
      },
      display = {
         "TempFloatingWindow",
      },

      live_mode_toggle = "on",
      live_display = { "VirtualTextOk" }, -- displayed only for live mode
   },
}
