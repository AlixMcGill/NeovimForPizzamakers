return {
    {
      "catppuccin/nvim",
      --lazy = false,
      name = "catppuccin",
      priority = 1000,
      config = function()
        require('catppuccin').setup({
          transparent_background = true,
          color_overrides = {
              all = {
                  text = '#f5e0db',
                  subtext1 = '#e5c890',
                  subtext0 = '#babbf1'
              }
          },
          integrations = {
              gitsigns = true,
              nvimtree = true,
              treesitter = true
          }
        })
        vim.cmd.colorscheme "catppuccin-frappe"
      end
    },
}
