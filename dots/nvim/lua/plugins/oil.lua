return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	keys = {
		{
			"-",
			function()
				require("oil").open_float()
			end,
			desc = "Open Oil",
		},
	},
	opts = {
		columns = {
			"size",
			"mtime",
			"icon",
		},

		keymaps = {
			-- disable
			["<Cr>"] = "",
			["<C-c>"] = "",

			-- change to other
			["q"] = "actions.close",
			["gl"] = "actions.select",
		},
		view_options = {
			show_hidden = true,
		},
	},
}
