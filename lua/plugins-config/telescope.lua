-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.setup({

})


-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- 查找文件(整个文件夹 fd)
vim.keymap.set("n", "<C-t>", ":Telescope find_files<CR>", opt)
-- 全局搜索(整个文件夹 rg)
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", opt)