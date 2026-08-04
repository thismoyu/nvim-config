vim.g.mapleader = " " -- leader key is space

local map = vim.keymap.set
-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)



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
map("n", "<S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("v", "<S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

