vim.g.mapleader = " "

local bind = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

bind("n", "<leader>tt", function()
  vim.cmd("vertical botright split term://pwsh")
end)

bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

-- System regiter copy
bind("x", "<leader>p", [["_dP]])

-- Replace
bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

return { bind = bind }
