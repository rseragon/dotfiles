local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').clangd.setup{
	capabilities = capabilities,
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--completion-style=bundled",
      "--header-insertion=iwyu"
    },
    flags = {debounce_text_changes = 150},
	single_file_support = true,
}
