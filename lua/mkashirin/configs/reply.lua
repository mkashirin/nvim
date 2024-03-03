local bind = require("mkashirin.remap").bind

bind("n", "<leader>rr", vim.cmd.Repl)
bind("n", "<leader>sr", vim.cmd.ReplStop)
bind("v", "<leader>vr", vim.cmd.ReplSend)
