-- only store the global keymap configuration.

-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)

-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
-- Ctrl + [ 映射到Esc
-- vim.keymap.set("n", "<C-[>", "Esc", opt)

-- 设置空格为leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- 切换窗口
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- visual默认下 < , > 缩进
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- terminal
-- vim.keymap.set("n", "<leader>t", ":sp | terminal<CR>", opt)
-- vim.keymap.set("n", "<leader>vt", ":vsp | terminal<CR>", opt)
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opt)
