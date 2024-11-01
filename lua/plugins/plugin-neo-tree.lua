-- 左侧的文件列表插件, 替代nvim-tree
return {
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim",
	      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	    },
	    config = function()
            require("neo-tree").setup {
            	sources = {
		        "filesystem",
		        "buffers",
		    },
			hide_root_node = true,
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			default_component_configs = {
			    indent = {
			        padding = 0,
			    },
			    type = {
			        enabled = false,
			    },
			    last_modified = {
			        enabled = false,
			    },
			},
			window = {
			    position = "left",
			    auto_expand_width = true,
			    mappings = {
			        ["<tab>"] = "toggle_node",
			        ["<esc>"] = "cancel",
			        ["r"] = "rename",
			    },
			},
			filesystem = {
			    follow_current_file = {
			        enabled = true,
			        leave_dirs_open = true,
			    },
			    hijack_netrw_behavior = "open_default",
			    window = {
			        mappings = {
			            ["<2-LeftMouse>"] = "open",
			            ["<cr>"] = "open",
			            ["a"] = "add",
			            ["."] = "toggle_hidden",
			            ["y"] = "copy_to_clipboard",
			            ["s"] = "open_split",
			            ["v"] = "open_vsplit",
			            ["x"] = "cut_to_clipboard",
			            ["p"] = "paste_from_clipboard",
			            ["d"] = "delete",
			        },
			    },
			},
			buffers = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--              -- the current file is changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				group_empty_dirs = true, -- when true, empty folders will be grouped together
				show_unloaded = true,
				window = {
					mappings = {
						["bd"] = "buffer_delete",
						["<bs>"] = "navigate_up",
						["."] = "set_root",
						["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
						["om"] = { "order_by_modified", nowait = false },
						["on"] = { "order_by_name", nowait = false },
						["os"] = { "order_by_size", nowait = false },
						["ot"] = { "order_by_type", nowait = false },
					}
				},
			},
			-- cmd = { "Neotree" },
            }
            
			-- 使用 space + e切换侧边栏
			vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>", opt) 
        end,
	}
}
