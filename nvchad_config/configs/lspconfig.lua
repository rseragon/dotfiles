local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pyright", "clangd", "gopls", "autotools_ls", "tsserver", "java_language_server"}

-- Refer this 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
