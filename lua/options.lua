-- only store the options configuration.
-- 默认UTF-8编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- 24 真彩色
vim.opt.termguicolors = true

-- 系统剪贴板
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- 启用鼠标
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- tab字符的显示宽度
vim.opt.softtabstop = 4 -- tab为4个字符
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- 使用空格替代tab

-- UI config
vim.opt.relativenumber = true -- 相对行号
vim.opt.number = true -- show absolute number
vim.opt.cursorline = false -- highlight cursor line underneath the cursor horizontally
-- 新窗口右下
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- 真彩色
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI

vim.opt.signcolumn = "yes"
-- mode在statusbar显示了
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- indent
vim.opt.autoindent = true --自动缩进
-- Enable break indent
vim.opt.breakindent = true


-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- file
vim.opt.autoread = true -- 自动加载外部修改
vim.opt.backup = false -- 关闭自动自动备份

-- 防止包裹
vim.opt.wrap = false

-- lurarocks 关闭自动的rocks插件管理，
-- vim.rocks.hererocks = false
-- opts.rocks.enable = false

-- 系统有带nerd图标字体
vim.g.have_nerd_font = true

-- disble nvim netrw. use neo-tree instead of this.
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- 命令的修改在prview中显示
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.cmd [[ set iskeyword+=-]]
