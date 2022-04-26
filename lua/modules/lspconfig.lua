-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- The following example advertise capabilities to `clangd`.
require("lspconfig").tsserver.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = function(...) end,
	},
})
