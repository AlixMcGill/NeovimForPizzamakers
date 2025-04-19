vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.cmd("set formatoptions-=t")
vim.o.termguicolors = true
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true

vim.keymap.set('n', 'C-l', ':TSDisable lua')

vim.keymap.set('n', '<leader>b', ':Ex<cr>')

vim.keymap.set('n', '<leader>t', ':ToggleTerm size=10 direction=horizontal<cr>')

vim.keymap.set('n', '<leader>vs', ':vsplit<cr>')

vim.keymap.set('n', '<leader>hs', ':split<cr>')

vim.keymap.set('n', '<leader>lt', function() require('live-server-nvim').toggle() end)
