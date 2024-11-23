# keybindings

<!--toc:start-->
- [keybindings](#keybindings)
  - [generic](#generic)
    - [window](#window)
    - [tab](#tab)
  - [plugin](#plugin)
    - [git](#git)
    - [terminal](#terminal)
    - [Lsp](#lsp)
    - [bufferline](#bufferline)
    - [flash](#flash)
    - [grug-far](#grug-far)
    - [mason](#mason)
    - [neo-tree](#neo-tree)
    - [nvim-treesitter](#nvim-treesitter)
    - [persistence](#persistence)
    - [telescope](#telescope)
    - [todo-comments](#todo-comments)
<!--toc:end-->

`sR`

## generic

1. `<leader>K` open the manual under the cursor
2. `<leader>l` Lazy
3. `gco gcO`
4. `<leader>fn`  New file
5. `<leader>xl` Location list
6. `<leader>xq` Location list
7. `<leader>cf` Format
8. `<leader>cd` diagnostic

### window

1. `<leader>w`  windows  
2. `<leader>|`  split windows Right
3. `<leader>-`  split windows Below
4. `<leader>wd`  Delete Window
5. `<leader>wm`  Toggle Maximize

### tab

prefix: `<leader><tab>`

1. `<prefix>l` Last Tab
2. `<prefix>o` close Other Tabs
3. `<prefix>f` First Tab
4. `<prefix><tab>` New Tab
5. `<prefix>d` Delete Tab

## plugin

### git

1. `<leader>gg` Lazygit (Root Dir)
2. `<leader>gG` lazygit (Cwd)
3. `<leader>gb` Git Blame Line
4. `<leader>gB` Git Browse
5. `<leader>gf`  Lazygit Current File History
6. `<leader>gl` Lazygit Log
7. `<leader>gL` Lazygit Log (Cwd)

### terminal

1. `<leader>ft`  Terminal (Root Dir)
2. `<leader>fT`  Terminal (Cwd)
3. `<C-/>`  Toggle Terminal (Root)
4. `<Esc><Esc>`  Enter Normal Mode

### Lsp

1. `<leader>cl`  Lsp Info
2. `gd gr gI gy gD K`
3. `gK <C-k>` Signature Help

### bufferline

prefix: `<leader>`

1. `bb bd bl br`  
2. `bo`  Delete Others Buffers
3. `bp bP` Toggle Pin | Delete Non-Pinned Buffers
4. `[b ]b <S-h> <S-l>`
5. `[B ]B`  Move Buffer

### flash

1. `s S`
2. `r`  o,x
3. `R`  o
4. `<C-s>` c

### grug-far

`<leader>sr` Search and Replace(n,v)

### mason

`<leader>cm`  Mason

### neo-tree

prefix: `<leader>`

1. `be`  Buffer Explorer
2. `e(fe) E(fE)` Explorer Neotree (Root | Cwd)
3. `ge` Git Explorer

### nvim-treesitter

1. `<bs>`  Decrement Selection x
2. `<c-space>` Increment Selection n

### persistence

prefix: `<leader>`

1. `qd` Don't Save Current Session
2. `ql` Restore Last Session
3. `qs` Restore Session

### telescope

prefix: `<leader>`

`ff fF sg sG fg fb`
`sh sH sj sk sl sm sM so sq ss sS sw sW sw(v) sW(v)`
`sR`

1. `<space>` Find Files (Root)
2. `,` Find Buffer
3. `/` Grep (Root)
4. `:`  Command History
5. `sd sD` [document Workspace] Diagnostics

`gc(commits) gs(status) s"(registers) sa(auto commands)`
`sb(buffer) sc(command history) sC(commands) f[rR](Recent [Cwd]`

### todo-comments

1. `<leader>st` Todo
2. `<leader>sT` Todo/Fix/Fixme
3. `<leader>xT` Todo (Trouble)
4. `<leader>xT` Todo/Fix/Fixme (Trouble)
5. `[t ]t` Previous/Next Todo Comment
