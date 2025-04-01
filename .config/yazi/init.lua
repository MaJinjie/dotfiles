local colors = {
  backdrop = "#545C7E",

  normal_bg = "#1A1B26",
  normal_fg = "#C0CAF5",
  visual_bg = "#283457",

  red = "#F7768E",
  blue = "#7AA2F7",
  cyan = "#1ABC9C",
  grey = "#C0CAF5",
  azure = "#0DB9D7",
  green = "#9ECE6A",
  orange = "#FF9E65",
  purple = "#9D7CDB",
  yellow = "#E0AF68",
  gray = "#565F89",

  bright_red = "#FF007C",

  min = "#000000",
  max = "#FFFFFF",
}

------------------------------------ builtin-plugins ------------------------------------
-- This plugin provides cross-instance yank ability
require("session"):setup { sync_yanked = true }

------------------------------------ full-border.yazi ------------------------------------
require("full-border"):setup()

------------------------------------ yatline.yazi ------------------------------------
require("yatline"):setup {
  theme = require("yatline-tokyo-night"):setup("night"),
  section_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },
  inverse_separator = { open = "", close = "" },
  header_line = {
    left = {
      section_a = { { type = "line", custom = false, name = "tabs", params = { "left" } } },
      section_b = {},
      section_c = {},
    },
    right = {
      section_a = {
        { type = "coloreds", custom = true, name = { { " 󰇥 ", "#3c3836" } } },
      },
      section_b = {
        { type = "string", custom = true, name = "Task" },
      },
      section_c = {
        { type = "coloreds", custom = false, name = "task_workload" },
        { type = "coloreds", custom = false, name = "task_states" },
      },
    },
  },
  status_line = {
    left = {
      section_a = {
        { type = "string", custom = false, name = "tab_mode" },
      },
      section_b = {
        {
          type = "string",
          custom = false,
          name = "tab_path",
          params = { trimed = true, max_length = 24, trim_length = 12 },
        },
      },
      section_c = {
        { type = "coloreds", custom = false, name = "count", params = { "true" } },
      },
    },
    right = {
      section_a = {
        { type = "string", custom = false, name = "cursor_percentage" },
      },
      section_b = {
        { type = "string", custom = false, name = "hovered_size" },
      },
      section_c = {
        { type = "coloreds", custom = false, name = "permissions" },
      },
    },
  },
}

------------------------------------ git.yazi ------------------------------------
local git = {
  added = { sign = "A" },
  modified = { sign = "M" },
  deleted = { sign = "D" },
  ignored = { sign = "I" },
  updated = { sign = "U" },
}

th.git = th.git or {}
for k, v in pairs(git) do
  for kk, vv in pairs(v) do
    th.git[("%s_%s"):format(k, kk)] = vv
  end
end
require("git"):setup()

------------------------------------ searchjump.yazi ------------------------------------
require("searchjump"):setup({
  unmatch_fg = colors.backdrop,
  match_str_fg = colors.backdrop,
  match_str_bg = colors.normal_bg,
  first_match_str_fg = colors.backdrop,
  first_match_str_bg = colors.normal_bg,
  label_fg = colors.bright_red,
  label_bg = colors.normal_bg,
  only_current = true,
  show_search_in_statusbar = false,
  auto_exit_when_unmatch = true,
  enable_capital_lable = true,
})

------------------------------------ bookmarks.yazi ------------------------------------
require("bookmarks"):setup({
  last_directory = { enable = true, persist = false, mode = "jump" },
  persist = "vim",
  desc_format = "full",
  file_pick_mode = "hover",
  custom_desc_input = false,
  notify = {
    enable = true,
    timeout = 1,
    message = {
      new = "New bookmark '<key>' -> '<folder>'",
      delete = "Deleted bookmark in '<key>'",
      delete_all = "Deleted all bookmarks",
    },
  },
})
