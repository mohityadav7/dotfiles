local lsp_installer = require('nvim-lsp-installer')
local utils = require('mohit.lsp.utils')
local lsp_keymaps = require('mohit.lsp.lsp-keymaps')

-- Register a callback that will be called for all installed servers, to be executed each time a server is ready to be initiated..
-- Alternatively, you may also register callbacks on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  -- common options
	local opts = {
    on_attach = function(client, bufnr)
      lsp_keymaps.set_lsp_keymaps(bufnr)
      utils.set_lsp_highlighting(client)
      if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
      end
    end,
		capabilities = utils.get_updated_capabilities()
	}

  -- lsp server specific options
	if server.name == "jsonls" then
		local jsonls_opts = require("mohit.lsp.server-settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("mohit.lsp.server-settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("mohit.server-settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
