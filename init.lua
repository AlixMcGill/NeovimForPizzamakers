-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup({
 spec = {
    { import = "plugins" }  
  }  
})

function SetBack(color)
 -- color = color or "catppuccin-frappe"
  --vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

  
  vim.api.nvim_set_hl(0, 'lineNrAbove', {fg="#7c7f93", bold=true})
  vim.api.nvim_set_hl(0, 'lineNr', {fg="#dc8a78"})
  vim.api.nvim_set_hl(0, 'lineNrBelow', {fg="#7c7f93"})
end
SetBack()
vim.cmd('Dashboard')
