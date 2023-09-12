local status_ok, mnls = pcall(require, "mason-null-ls")
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

mnls.setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
	},
	automatic_installation = false,
	automatic_setup = true, -- Recommended, but optional
	handlers = {

		function() end, -- disables automatic setup of all null-ls sources
		stylua = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
		shfmt = function(source_name, methods)
			-- custom logic
			mnls.default_setup(source_name, methods) -- to maintain default behavior
		end,
	}
})
