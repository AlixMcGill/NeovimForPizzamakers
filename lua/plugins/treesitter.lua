return {
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      conifg = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
          ensure_installed = {
            "lua",
            "javascript",
            "c_sharp",
            "css",
            "html",
            "json",
            "markdown",
            "typescript",
            "cpp",
            "c",
            "go",
            "php",
            "phpcs",
            "glsl",
            "clangd",
            "gdscript",
            "godot_resource"
          },
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = true
          },
          indent = {
              enable = true,
              disable = {"php"},
          }
        })
      end
    }
}
