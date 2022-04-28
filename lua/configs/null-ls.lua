local null_ls = require "null-ls"

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  with_root_file(null_ls.builtins.diagnostics.eslint_d, ".eslintrc.js"),
  with_root_file(null_ls.builtins.diagnostics.eslint_d, ".eslintrc.json"),
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.stylua,
}

null_ls.setup {
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
							augroup LspFormatting
									autocmd! * <buffer>
									autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
							augroup END
							]]
    end
  end,
  sources = sources,
}
