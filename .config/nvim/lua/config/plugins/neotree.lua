return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{"3rd/image.nvim", opts = {}},
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
    		close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        	popup_border_style = "rounded",
        	enable_git_status = true,
        	enable_diagnostics = true,
        	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        	open_files_using_relative_paths = false,
        	sort_case_insensitive = false, -- used when sorting files and directories in the tree
        	sort_function = nil, -- use a custom function for sorting files and directories in the tree
        	-- sort_function = function (a,b)
        	--       if a.type == b.type then
        	--           return a.path > b.path
        	--       else
        	--           return a.type > b.type
        	--       end
        	--   end , -- this sorts files and directories descendantly
        	default_component_configs = {
          		container = {
            		enable_character_fade = true,
          		},
          		indent = {
            		indent_size = 2,
            		padding = 1, -- extra padding on left hand side
            		-- indent guides
            		with_markers = true,
            		indent_marker = "│",
            		last_indent_marker = "└",
            		highlight = "NeoTreeIndentMarker",
            		-- expander config, needed for nesting files
            		with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            		expander_collapsed = "",
            		expander_expanded = "",
            		expander_highlight = "NeoTreeExpander",
          		},
          		icon = {
            		folder_closed = "",
            		folder_open = "",
            		folder_empty = "󰜌",
            		provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
              			if node.type == "file" or node.type == "terminal" then
                			local success, web_devicons = pcall(require, "nvim-web-devicons")
                			local name = node.type == "terminal" and "terminal" or node.name
	                		if success then
    	              			local devicon, hl = web_devicons.get_icon(name)
        	          			icon.text = devicon or icon.text
            	      			icon.highlight = hl or icon.highlight
                			end
              			end
            		end,
            		-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            		-- then these will never be used.
	            	default = "",
    	        	highlight = "NeoTreeFileIcon",
        	  	},
          		modified = {
            		symbol = "󰽃",
            		highlight = "NeoTreeModified",
          		},
          		name = {
            		trailing_slash = false,
            		use_git_status_colors = true,
            		highlight = "NeoTreeFileName",
          		},
          		git_status = {
            		symbols = {
              			-- Change type
            	  		added = "✚",
              			modified = "",
              			deleted = "✖",
              			renamed = "󰁕",
              			-- Status type
              			untracked = "",
              			ignored = "",
              			unstaged = "󰄱",
              			staged = "",
              			conflict = "",
            		},
          		},
  			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false
				}
			},
		},
	}
}
