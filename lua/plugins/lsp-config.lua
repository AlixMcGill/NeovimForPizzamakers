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
            --"csharp_ls",
            "cssls",
            --"eslint", 
            "html",
            "omnisharp",
            "clangd",
            "gopls",
            "intelephense"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
          local opts = {buffer = bufnr, noremap = true, silent = true}
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
          vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      end


      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.ts_ls.setup({capabilities = capabilities})
      --lspconfig.csharp_ls.setup({capabilities = capabilities})
      lspconfig.cssls.setup({ capabilities = capabilities})
      lspconfig.gopls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = {"gopls"},
          filetypes = {"go", "gomod", "gowork", "gotmpl" },
          root_dir = util.root_pattern("gowork", "go.mod", ".git"),
      })
      --lspconfig.eslint.setup({})
      lspconfig.html.setup({capabilities = capabilities})
      lspconfig.omnisharp.setup({capabilities = capabilities})
      --lspconfig.harper_ls.setup({capabilities = capabilities})
      lspconfig.clangd.setup({
            capabilities = capabilities,
          cmd = { "clangd" },
          filetypes = {"c", "cpp", "objc", "objcpp"},
      })
      lspconfig.intelephense.setup({
          capabilities = capabilities,
          on_attach = function (client)
              if client.name == "intelephense" then
                  client.server_capabilities.documentFormattingProvider = false
              end
          end
      })

    end
  }
}
