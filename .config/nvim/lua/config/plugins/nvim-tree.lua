return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			highlight_git = true,
			icons = {
				show = {
					git = false,
				},
			},
		},
		filters = {
			enable = false
		},
		git = {
			enable = true
		},
	}
}
