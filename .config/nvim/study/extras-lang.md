# languages

<!--toc:start-->
- [languages](#languages)
  - [sql](#sql)
    - [sql-keybindings](#sql-keybindings)
  - [cpp](#cpp)
    - [cpp-keybindings](#cpp-keybindings)
  - [rust](#rust)
    - [rust-keybindings](#rust-keybindings)
<!--toc:end-->

## sql

The setup below will automatically configure connections without the need for manual input each time.

Example configuration using dictionary with keys:

```lua
vim.g.dbs = {
  dev = "Replace with your database connection URL.",
  staging = "Replace with your database connection URL.",
}
```

or
Example configuration using a list of dictionaries:

```lua
vim.g.dbs = {
  { name = "dev", url = "Replace with your database connection URL." },
  { name = "staging", url = "Replace with your database connection URL." },
}

```

or
Create a `.lazy.lua` file in your project and set your connections like this:

```lua
    vim.g.dbs = {...}

    return {}
```

Alternatively, you can also use other methods to inject your environment variables.

Finally, please make sure to add `.lazy.lua` to your `.gitignore` file to protect your secrets.

### sql-keybindings

`<leader>D`

```lua
{ "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
```

`<leader>S`

```lua
-- NOTE: The default behavior of auto-execution of queries on save is disabled
-- this is useful when you have a big query that you don't want to run every time
-- you save the file running those queries can crash neovim to run use the
-- default keymap: <leader>S
vim.g.db_ui_execute_on_save = false
```

## cpp

### cpp-keybindings

`<leader>ch`

```lua
{ "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
```

## rust

### rust-keybindings

`<leader>cR <leader>dr`

```lua
on_attach = function(_, bufnr)
  vim.keymap.set("n", "<leader>cR", function()
    vim.cmd.RustLsp("codeAction")
  end, { desc = "Code Action", buffer = bufnr })
  vim.keymap.set("n", "<leader>dr", function()
    vim.cmd.RustLsp("debuggables")
  end, { desc = "Rust Debuggables", buffer = bufnr })
end,
```

## typescript

### typescript-keybindings

```lua
{
  "gD",
  function()
    local params = vim.lsp.util.make_position_params()
    LazyVim.lsp.execute({
      command = "typescript.goToSourceDefinition",
      arguments = { params.textDocument.uri, params.position },
      open = true,
    })
  end,
  desc = "Goto Source Definition",
},
{
  "gR",
  function()
    LazyVim.lsp.execute({
      command = "typescript.findAllFileReferences",
      arguments = { vim.uri_from_bufnr(0) },
      open = true,
    })
  end,
  desc = "File References",
},
{
  "<leader>co",
  LazyVim.lsp.action["source.organizeImports"],
  desc = "Organize Imports",
},
{
  "<leader>cM",
  LazyVim.lsp.action["source.addMissingImports.ts"],
  desc = "Add missing imports",
},
{
  "<leader>cu",
  LazyVim.lsp.action["source.removeUnused.ts"],
  desc = "Remove unused imports",
},
{
  "<leader>cD",
  LazyVim.lsp.action["source.fixAll.ts"],
  desc = "Fix all diagnostics",
},
{
  "<leader>cV",
  function()
    LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
  end,
  desc = "Select TS workspace version",
},
```
