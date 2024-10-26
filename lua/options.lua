-- only store the options configuration.
-- 默认UTF-8编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- 24 真彩色
vim.opt.termguicolors = true

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- tab字符的显示宽度
vim.opt.softtabstop = 4 -- tab为4个字符
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- 使用空格替代tab

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = false -- add numbers to each line on the left side
vim.opt.cursorline = false -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- indent
vim.opt.autoindent = true --自动缩进

-- file
vim.opt.autoread = true -- 自动加载外部修改
vim.opt.backup = false -- 关闭自动自动备份

-- lurarocks 关闭自动的rocks插件管理，
-- vim.rocks.hererocks = false
-- opts.rocks.enable = false
