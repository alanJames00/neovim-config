local plugins = {
	{
		'barrett-ruth/live-server.nvim',
		build = 'pnpm add -g live-server',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
		config = true
	}
	, {
	"github/copilot.vim",
}
, {
	"nvim-neotest/nvim-nio"
},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require "custom.configs.dap"
			require("core.utils").load_mappings("dap")
		end
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require "custom.configs.null-ls"
		end
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint-lsp",
				"prettier",
				"js-debug-adapter",
				"typescript-language-server",
				"gopls"
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end
	},
	{
		"APZelos/blamer.nvim"
	},
	{
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup({
				auto_load = true,         -- whether to automatically load preview when
                            -- entering another markdown buffer
				close_on_bdelete = true,  -- close preview window on buffer delete

				syntax = true,            -- enable syntax highlighting, affects performance

				theme = 'dark',           -- 'dark' or 'light'

				update_on_change = true,

				app = 'browser',          -- 'webview', 'browser', string or a table of strings
                            -- explained below

				filetype = { 'markdown' },-- list of filetypes to recognize as markdown

  -- relevant if update_on_change is true
				throttle_at = 200000,     -- start throttling when file exceeds this
                            -- amount of bytes in size
				throttle_time = 'auto',   -- minimum amount of time in milliseconds
                            -- that has to pass before starting new render
		})
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
	},

}

return plugins
