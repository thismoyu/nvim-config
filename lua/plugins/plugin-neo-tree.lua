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
			-- cmd = { "Neotree" },
            }
            
			-- 使用 space + e切换侧边栏
			vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>", opt) 
        end,
	}
}
