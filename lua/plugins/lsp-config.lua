return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "ts_ls",
            "csharp_ls",
            "cssls",
            --"eslint", 
            "html",
            "omnisharp",
            "clangd",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.cssls.setup({})
      --lspconfig.eslint.setup({})
      lspconfig.html.setup({})
      lspconfig.omnisharp.setup({})
      lspconfig.harper_ls.setup({})
      lspconfig.clangd.setup({
          cmd = { "clangd" },
          filetypes = {"c", "cpp", "objc", "objcpp"},
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
