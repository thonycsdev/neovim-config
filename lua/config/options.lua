vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- indentation: 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- always show the sign column so diagnostics don't shift the text
vim.opt.signcolumn = "yes"

-- case-insensitive search unless the pattern has an uppercase letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep undo history after closing the file
vim.opt.undofile = true

-- use the system clipboard for yank/paste
vim.opt.clipboard = "unnamedplus"
