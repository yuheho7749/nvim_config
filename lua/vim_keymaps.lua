-- keymaps --
vim.g.mapleader = " "


-- Window Manipulation --
-- vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>ve", vim.cmd.Vex)
-- vim.keymap.set("n", "<leader>se", vim.cmd.Sex)
vim.keymap.set("n", "<leader>vs", vim.cmd.vs)
vim.keymap.set("n", "<leader>sp", vim.cmd.sp)

vim.keymap.set("n", "<leader>vs", vim.cmd.vs)
vim.keymap.set("n", "<leader>sp", vim.cmd.sp)
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wr", "<C-w>r")

-- Visual Mode --
-- vim.keymap.set("n", "v", "V")
-- vim.keymap.set("n", "V", "v")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "H", "b")
-- vim.keymap.set("v", "L", "w")
-- vim.keymap.set("v", "<a-h>", "0")
-- vim.keymap.set("v", "<a-l>", "$")


-- Cursor Movement --
vim.keymap.set({"n", "v"}, "H", "b")
vim.keymap.set({"n", "v"}, "L", "w")
vim.keymap.set({"n", "v"}, "<a-h>", "0")
vim.keymap.set({"n", "v"}, "<a-l>", "$")


-- Delete word --
-- vim.keymap.set("n", "D", "diw")

