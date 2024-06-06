-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline")
	return
end

bufferline.setup({
	options = {
		-- 以下两个命令需要 moll/vim-bbye 插件
		-- close_command = "bdelete! %d",       -- 点击关闭按钮关闭
		-- right_mouse_command = "bdelete! %d", -- 右键点击关闭

		-- indicator = {
		-- 	icon = ' | ', -- 分割线
		-- 	style = 'underline',
		-- },
		-- buffer_close_icon = '󰅖',
		-- modified_icon = '●',
		-- close_icon = '',
		-- bufferline 标签页不要显示到左侧的NvimTree上边去
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer" ,
				text_align = "left",
				separator = true,
			}
		},
	}
})

-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
