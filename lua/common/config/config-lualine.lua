-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

-- lualine 中，显示区域被分成了 6 个部分，分被用 A,B,C,X,Y,Z 组成。
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
lualine.setup({
	options = {
		-- theme = "auto",
		-- need dracula theme.
		theme = 'dracula-nvim'
		component_separators = { left = "|", right = "|" },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " < ", right = " > " },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			"filename",
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = 'Linux',
					dos = 'Windows',
					mac = "Mac",
				},
			},
			"encoding",
			"filetype",
		},
	},
})