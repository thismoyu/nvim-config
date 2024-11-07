-- only store the global keymap configuration.

-- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
-- mode: n(normal),i(insert),v(view)等
-- lhs : 对应的按键
-- rhs : 对应的功能
-- opts: 相应的设置
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)

-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
-- Ctrl + [ 映射到Esc
-- vim.keymap.set("n", "<C-[>", "Esc", opt)

-- 设置空格为leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
-----------------
-- Normal mode --
-----------------

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- 打开快速修改列表 Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Hint: see `:h vim.map.set()`
-- 切换窗口
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w><C-h>", { desc = "Go to Left Window", noremap = true })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Go to Lower Window", noremap = true })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Go to Upper Window", noremap = true })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Go to Right Window", noremap = true })

-- windows(todo: no effect)
-- map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Resize with arrows
-- delta: 2 lines
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-----------------
-- Visual mode --
-----------------

-- visual默认下 < , > 缩进
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 单行或多行移动
-- Move Lines
map("n", "<S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- terminal
-- map("n", "<leader>t", ":sp | terminal<CR>", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
-- map("t", "<Esc>", "<C-\\><C-n>", opt)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- commenting(need plugin Commnet)
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
