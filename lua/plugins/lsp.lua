return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    -- Configuración de tus keymaps aquí

    -- Configuración de mason.nvim
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "bashls", "clangd", "pyright", "lua_ls", "tailwindcss" },
    })

    -- Configuración de servidores de lenguaje
    local on_attach = function(_, bufnr)
      -- Configuración de tus keymaps para cada buffer aquí
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig").bashls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        }
      }
    })
    require("lspconfig").tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
}
