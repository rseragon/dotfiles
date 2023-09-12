local status_ok, lspconf = pcall(require, "lspconfig")
if not status_ok then
	return
end


-- require("user.lsp.lsp-installer")
require('user.lsp.mason')
require('user.lsp.mason-lspconfig')
require("user.lsp.handlers").setup()

require('user.lsp.mason-nullls')
require('user.lsp.nullls')
require('user.lsp.colors')
