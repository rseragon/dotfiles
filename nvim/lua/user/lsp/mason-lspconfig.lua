local status_ok, mason_lspconf = pcall(require, "mason-lspconfig")
lspconfig = require("lspconfig")


local DEFAULT_SETTINGS = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {"clangd"},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
}

mason_lspconf.setup(DEFAULT_SETTINGS)

mason_lspconf.setup_handlers({
  function(server)

	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "grammerly" then
		local init_options = { clientId = "client_[redacted]" }
		opts = vim.tbl_deep_extend("force", init_options, opts)
	end

    lspconfig[server].setup(opts)
  end,

  ['tsserver'] = function()
    lspconfig.tsserver.setup({
      settings = {
        completions = {
          completeFunctionCalls = true
        }
      }
    })
  end

})

-- lspconf.sumneko_lua.setup {}
-- lspconf.tsserver.setup {}
-- lspconf.clangd.setup {}
-- lspconf.volar.setup {}
