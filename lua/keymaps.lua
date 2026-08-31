vim.g.mapleader = " " -- leader key is space

local map = vim.keymap.set
-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)

-- 侧键后退 -> Ctrl + o (跳转回上一个位置)
vim.keymap.set({'n', 'v'}, '<X1Mouse>', '<C-o>', { noremap = true, silent = true, desc = 'Jump Back' })
-- 侧键前进 -> Ctrl + i (跳转到下一个位置)
vim.keymap.set({'n', 'v'}, '<X2Mouse>', '<C-i>', { noremap = true, silent = true, desc = 'Jump Forward' })

-- clear hightlight search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search hightlight" })

-- Comment
map("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w><C-h>", { desc = "Go to Left Window", noremap = true })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Go to Lower Window", noremap = true })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Go to Upper Window", noremap = true })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Go to Right Window", noremap = true })

-- Resize with arrows
-- delta: 2 lines
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- visual默认下 < , > 缩进
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 单行或多行移动
-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- 搜索居中
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- 半页滚动居中（对齐 ideavim）
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- 合并行
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- paste & delete without yank, key 'd' reserved for diagnostic.
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>w", "<cmd>wa<cr>", { desc = "Save All" })

-- quit
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Window" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- 文件树定位到当前文件（对齐 ideavim <leader>`）
map("n", "<leader>`", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal in file tree" })

-- 诊断（对齐 ideavim [d ]d <leader>d）
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev diagnostic" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- buffer list（对齐 ideavim <leader>bl）
map("n", "<leader>bl", "<cmd>Telescope buffers<cr>", { desc = "Buffer list" })
