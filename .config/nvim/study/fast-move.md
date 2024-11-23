# fast-move

<!--toc:start-->
- [fast-move](#fast-move)
  - [file jump](#file-jump)
  - [context jump](#context-jump)
  - [operator](#operator)
<!--toc:end-->

## file jump

1. 你所要打开的文件已存在buffer列表中
  
    - 在视觉范围中，它接近你所在位置。使用 H L
    - 否则,  `<leader>, <leader>fb`

2. 如果不在buffer列表中，使用 `<leader><space> / <leader>ff / <leader>fF`

## context jump

1. 如果你所要跳转的位置接近你所在位置

    - 先使用大跨度动作 `p m f c a [[ ]] ]) ]}`
    - 再使用中跨度动作 `% f t W B E gE`
    - 最后使用小跨度动作 `j k h l w e ge b`

2. 使用文档符号跳转 `<leader>ss`
3. 如果只是模糊知道其大致文本`<leader>sb`

## operator

1. 对于不再使用的buffer

    - 如果它是唯一的窗口，使用`<leader>bd`
    - 如果它是不是唯一窗口，使用`<leader>bD`

2. 我们可以pin某些buffer,来删除其他buffer
3. 如果不想移动位置，上一个或下一个可以使用ln, 远程使用r
