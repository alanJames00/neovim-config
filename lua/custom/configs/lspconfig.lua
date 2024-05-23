-- this config file stores all the lspconfigs for the all the lsp installed in the neovim


local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities


local lspconfig = require("lspconfig")

local util = require("lspconfig/util")

lspconfig.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		}
	}
}

lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true
		}
	}
}
