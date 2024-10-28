vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.nu = true
vim.wo.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 750

vim.keymap.set("n", "<leader>nh", ":noh<CR>", {desc = "no highlights"})

vim.keymap.set("n", "<C-d>", "<C-d>zz") --scrollear para abajo
vim.keymap.set("n", "<C-u>", "<C-u>zz") --scrollear para arriba
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"})
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"})
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab"})
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Go to previous tab"})
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew%<CR>", {desc = "Open current buffer in new tab"})
vim.keymap.set("n", "<leader>tg", ":BufferLinePick<CR>", {desc = "Pick tab"})

vim.keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split window vertically"})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split window horizontally"})
vim.keymap.set("n", "<leader>se", "<C-w>=", {desc = "Make splits equal size"})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close current split"})
