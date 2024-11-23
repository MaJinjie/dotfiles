-- Not all LSP servers add brackets when completing a function.
-- To better deal with this, LazyVim adds a custom option to cmp,
-- that you can configure. For example:
--
-- ```lua
-- opts = {
--   auto_brackets = { "python" }
-- }
-- ```
local function get_specified_source_id(sources, source_name)
   for id, source in pairs(sources) do
      if source.name == source_name then
         return id
      end
   end
end
return {
   {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
         local cmp = require("cmp")
         local default = require("cmp.config.default")()
         local compare = require("cmp.config.compare")

         local keymappings = {}
         -- local auto_select = true

         -- keymappings["<C-e>"] = function(fallback)
         --    if LazyVim.cmp.visible() then
         --       cmp.abort()
         --    else
         --       fallback()
         --    end
         -- end
         -- keymappings["<CR>"] = LazyVim.cmp.confirm({ select = auto_select })

         -- keymappings = vim.tbl_map(function(value)
         --    return cmp.mapping(value, { "i" })
         -- end, keymappings)

         -- opts.completion = { completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect") }
         -- opts.preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None
         -- opts.mapping = vim.tbl_extend("force", opts.mapping, keymappings)
      end,
   },
   {
      "hrsh7th/cmp-cmdline",
      keys = { ":", "/", "?" },
      event = "CmdLineEnter",
      dependencies = { "hrsh7th/nvim-cmp" },
      config = function()
         local cmp = require("cmp")
         local keymappings = {}

         -- keymappings["<C-e>"] = function(fallback)
         --    if LazyVim.cmp.visible() then
         --       cmp.abort()
         --    else
         --       fallback()
         --    end
         -- end
         --
         -- keymappings = vim.tbl_map(function(value)
         --    return cmp.mapping(value, { "c" })
         -- end, keymappings)
         -- keymappings = cmp.mapping.preset.cmdline(keymappings)

         keymappings = cmp.mapping.preset.cmdline()

         -- `/` cmdline setup.
         cmp.setup.cmdline({ "/", "?" }, {
            completion = { completeopt = "menu,menuone,noinsert,noselect" },
            preselect = cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = "buffer" },
            },
         })
         -- `:` cmdline setup.
         cmp.setup.cmdline(":", {
            completion = { completeopt = "menu,menuone,noinsert,noselect" },
            preselect = cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
               { name = "path" },
            }, {
               {
                  name = "cmdline",
                  option = {
                     ignore_cmds = { "Man", "!" },
                  },
               },
            }),
         })
      end,
   },
   -- disable snippets
   {
      "garymjr/nvim-snippets",
      init = function()
         -- 排除某些文件类型的snippets
         vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql" },
            callback = function(ev)
               local cmp = require("cmp")

               -- global sources
               ---@param source cmp.SourceConfig
               local sources = vim.tbl_map(function(source)
                  return { name = source.name }
               end, cmp.get_config().sources)

               local snippets_id = get_specified_source_id(sources, "snippets")

               table.remove(sources, snippets_id)

               cmp.setup.buffer({ sources = sources })
            end,
         })
      end,
   },
}
