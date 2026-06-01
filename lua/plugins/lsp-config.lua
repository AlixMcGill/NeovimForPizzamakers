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
            "cssls",
            "eslint",
            "html",
            "omnisharp",
            "clangd",
            "gopls",
            "intelephense",
            "glsl_analyzer",
        }
      })
    end
  },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local util = require("lspconfig/util")

        local on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, noremap = true, silent = true }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        vim.lsp.config("lua_ls", { capabilities = capabilities })
        vim.lsp.config("ts_ls", { capabilities = capabilities })
        vim.lsp.config("cssls", { capabilities = capabilities })
        vim.lsp.config("eslint", { capabilities = capabilities })
        vim.lsp.config("html", { capabilities = capabilities })
        vim.lsp.config("omnisharp", {
            capabilities = capabilities,
            root_dir = util.root_pattern("*.sln", "*.csproj")
        })
        vim.lsp.config("csharp_ls", {
            autostart = false
        })
        vim.lsp.config("clangd", {
          capabilities = capabilities,
          cmd = { "clangd", "--background-index" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
        })
        vim.lsp.config("intelephense", {
          capabilities = capabilities,
          on_attach = function(client)
            if client.name == "intelephense" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end,
        })
        vim.lsp.config("gopls", {
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        })
        vim.lsp.config("glsl_analyzer", {
            capabilities = capabilities,
            filetypes = {"glsl", "vert", "frag", "geom", "comp"},
        })
        require("lspconfig").gdscript.setup({
            capabilities = capabilities,
            root_dir = util.root_pattern("project.godot", ".git"),
        })
      end,
    },
}
