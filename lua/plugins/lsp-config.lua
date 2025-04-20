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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.ts_ls.setup({capabilities = capabilities})
      lspconfig.csharp_ls.setup({capabilities = capabilities})
      lspconfig.cssls.setup({ capabilities = capabilities})
      --lspconfig.eslint.setup({})
      lspconfig.html.setup({capabilities = capabilities})
      lspconfig.omnisharp.setup({capabilities = capabilities})
      lspconfig.harper_ls.setup({capabilities = capabilities})
      lspconfig.clangd.setup({
            capabilities = capabilities,
          cmd = { "clangd" },
          filetypes = {"c", "cpp", "objc", "objcpp"},
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
