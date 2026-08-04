local opt = vim.opt

opt.number = true

-- tables
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- expand tab to spaces.
opt.autoindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping.

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true -- hightlight current line

-- 默认UTF-8编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- 24 真彩色
vim.opt.termguicolors = true

-- windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swap file
opt.swapfile = false

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

-- mode在statusbar显示了
vim.opt.showmode = false

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

vim.o.winborder = 'rounded'

vim.cmd [[ set iskeyword+=-]]


-- 自动加载当前工作目录（项目根目录）下的特定配置文, 一般用于项目集配置
-- 使用 neoconf.nvim 替代？
vim.o.exrc = true


-- an experimental feature intended to replace the builtin message + cmdline presentation layer.
require("vim._core.ui2").enable()


-- Set up diagnostics
vim.diagnostic.config({
  virtual_text = {
    spacing = 4, -- Distance between error text and the end of the code
    current_line = true
  },
  severity_sort = true, -- Order Errors before Warnings

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})