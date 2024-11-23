local set = vim.keymap.set

set("n", "<localleader>r", "<cmd>RustLsp run<cr>", { buffer = true })
set("n", "<localleader>R", "<cmd>RustLsp runables<cr>", { buffer = true })
set("n", "<localleader>t", "<cmd>RustLsp testables<cr>", { buffer = true })
set("n", "<localleader>lr", "<cmd>RustLsp! run<cr>", { buffer = true })
set("n", "<localleader>lR", "<cmd>RustLsp! runables<cr>", { buffer = true })
set("n", "<localleader>lt", "<cmd>RustLsp! testables<cr>", { buffer = true })

set("n", "<localleader>oc", "<cmd>RustLsp openCargo<cr>", { buffer = true })
set("n", "<localleader>op", "<cmd>RustLsp parentModule<cr>", { buffer = true })
