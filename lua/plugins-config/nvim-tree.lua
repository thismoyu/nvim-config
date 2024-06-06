-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
	-- 是否显示 git 状态
	git = {
		enable = true,
	},
	-- 过滤文件
	filters = {
		dotfiles = true, -- 过滤 dotfile
		custom = { "node_modules" }, -- 其他过滤目录
	},
  view = {
	-- 文件浏览器展示位置，左侧：left, 右侧：right
	side = "left",
	-- 行号是否显示
	number = false,
	relativenumber = false,
	signcolumn = "yes", -- 显示图标
	width = 45,
  },
  renderer = {
    group_empty = true,
  },
})

-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)

-- 使用 space + e切换侧边栏
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opt) 
