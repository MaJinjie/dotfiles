local is_win = ya.target_family() == "windows"
local sep = package.config:sub(1, 1)
local xdg_home = is_win and os.getenv("APPDATA") or os.getenv("HOME")
local yazi_config_home = (os.getenv("XDG_CONFIG_HOME") or xdg_home .. sep .. ".config") .. sep .. "yazi"
local yazi_data_home = (os.getenv("XDG_DATA_HOME") or xdg_home .. sep .. ".local") .. sep .. "yazi"
local yazi_cache_home = (os.getenv("XDG_CACHE_HOME") or xdg_home .. sep .. ".cache") .. sep .. "yazi"
local yazi_data = yazi_config_home .. sep .. "data"

----------------------------- git --------------------------------
THEME.git = THEME.git or {}
THEME.git.added = ui.Style():fg("green"):bold()
THEME.git.added_sign = "A"
THEME.git.modified = ui.Style():fg("orange"):bold()
THEME.git.modified_sign = "M"
THEME.git.deleted = ui.Style():fg("red"):bold()
THEME.git.deleted_sign = "D"
THEME.git.untracked = ui.Style():fg("white"):bold()
THEME.git.untracked_sign = "?"
THEME.git.ignored = ui.Style():fg("gray"):bold()
THEME.git.ignored_sign = "I"
THEME.git.updated = ui.Style():fg("blue"):bold()
THEME.git.updated_sign = "U"

require("git"):setup()

----------------------------- bookmarks --------------------------------
local bookmarks = {} ---@type {tag:string, path:string,key:string}[]

if is_win then
else
end

require("yamb"):setup({
	-- he path ending with path seperator represents folder.
	bookmarks = bookmarks,
	--recieve notification everytime you jump.
	jump_notify = true,
	--the cli of fzf.
	cli = "fzf",
	-- a string used for randomly generating keys, where the preceding characters have higher priority.
	keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	-- Optional, the path of bookmarks
	path = yazi_data .. sep .. "bookmarks",
})

require("full-border"):setup()
require("smart-visual"):setup()
