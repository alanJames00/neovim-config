local M = {}

-- stores all the dap based keymappings
M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line"
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Run or continue the debugger"
		}
	}
}

-- stores all the custom keymappings
M.custom = {
	plugin = false,
	n = {
		["<leader>tt"] = {
			"<cmd> terminal <CR>",
			"Open Terminal in a new Tab"
		}
	}
}

-- stores all the custom keymappings for live-server.nvim
M.custom = {
	plugin = true,
	n = {
		["<leader>ls"] = {
			"<cmd> LiveServerToggle <CR>",
			"Toggle live-server on and off"
		}
	}
}

return M
