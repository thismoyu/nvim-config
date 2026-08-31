local opt = vim.opt

opt.number = true

-- tables
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- expand tab to spaces.
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line
opt.grepprg = "rg --vimgrep" --using ripgrep if available
opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content


-- 字母功能描述实用建议
-- j 智能删除注释符。合并两行注释时，自动删掉多余的注释符号（如 //）。强烈推荐，现代编辑必备。
-- c 注释自动折行。当注释超过 textwidth 限制时自动换行，并自动补全注释符。推荐，保持注释整齐。
-- r 回车自动延续注释。在注释行按 Enter 键换行时，新行会自动插入注释符。推荐，写多行注释很方便。
-- o O键自动延续注释。在普通模式下按 o 或 O 开辟新行时，自动插入注释符。视个人习惯而定。很多人觉得烦，经常会将其删除。
-- q 允许使用 gq 格式化。允许使用 gq 快捷键对文本或注释进行段落重排。推荐。
-- n 识别数字列表。格式化时能识别 1.、2. 等数字列表，换行时会自动对齐缩进。写 Markdown 强烈推荐。
-- l 长行不自动折行。如果在插入模式下某一行的长度已经超过了 textwidth，不会强制将其折断。适合不希望代码被强制换行的人。
-- t 文本自动折行。标准文本（非注释）超过 textwidth 时自动换行。代码编写不建议加，写文章可以加。
-- 注意：ftplugin 会覆盖本项并加回 o；真正生效靠 autocmds.lua 里 FileType 后再 remove("o")
opt.formatoptions = "jcrq"

opt.cmdheight = 1 -- Command line height

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

opt.termguicolors = true -- 24 真彩色

--
-- opt.signcolumn = "yes" -- Always show sign column
-- opt.colorcolumn = "140" -- Show column at 100 characters

-- windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swap file
opt.swapfile = false

-- 系统剪贴板
opt.clipboard = 'unnamedplus'

opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- 启用鼠标
opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- mode在statusbar显示了
opt.showmode = false

-- 系统有带nerd图标字体
vim.g.have_nerd_font = true

-- disble nvim netrw. use neo-tree instead of this.
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- 命令的修改在prview中显示
-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

vim.o.winborder = 'rounded'
opt.winblend = 0 -- Floating window transparency

opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket

vim.cmd [[ set iskeyword+=-]]

-- files
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't backup before overwriting
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.updatetime = 300 -- Time in ms to trigger CursorHold
opt.timeoutlen = 300 -- Time in ms to wait for mapped sequence
opt.ttimeoutlen = 0 -- No wait for key code sequences
opt.autoread = true -- Auto-reload file if changed outside
opt.autowrite = false -- Don't auto-save on some events
opt.diffopt:append("vertical") -- Vertical diff splits
opt.diffopt:append("algorithm:patience") -- Better diff algorithm
opt.diffopt:append("linematch:60") -- Better diff highlighting (smart line matching)
-- Set undo directory and ensure it exists
local undodir = "~/.local/share/nvim/undodir" -- Undo directory path
vim.opt.undodir = vim.fn.expand(undodir) -- Expand to full path
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p") -- Create if not exists
end

-- Folding Settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Keep all folds open by default

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