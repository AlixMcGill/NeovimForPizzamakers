vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.cmd("set formatoptions-=t")
vim.bo.autoindent = true
vim.bo.smartindent = true
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
    vim.bo.autoindent = true
    vim.bo.smartindent = true
    vim.opt_local.formatoptions:remove("t")
    vim.bo.indentexpr = ""
  end,
})
