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

local function find_godot_project_root()
    local cwd = vim.fn.getcwd()
    local search_paths = {'', '/..'}

    for _, relative_path in ipairs(search_paths) do
        local project_file = cwd .. relative_path .. '/project.godot'
        if vim.uv.fs_stat(project_file) then
            return cwd .. relative_path
        end
    end
    return nil
end

local function is_server_running(project_path)
    local server_pipe = project_path .. '/server.pipe'
    return vim.uv.fs_stat(server_pipe) ~= nil
end

local function start_godot_server_if_needed()
    local godot_project_path = find_godot_project_root()

    if godot_project_path and not is_server_running(godot_project_path) then
        vim.fn.serverstart(godot_project_path .. 'server.pipe')
        return true
    end
    return false
end

start_godot_server_if_needed()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdscript",
  callback = function()
    vim.treesitter.start()
  end,
})
