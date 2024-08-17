-- only store the lsp configuration.

-- 启用exrc特性。使neovim从当前工作目录中的.nvim.lua / .nvimrc /.exrc中读取局部属性，避免
-- lsp clangd等需要频繁修改nvim配置引起的不变。
vim.o.exrc = true

----- 在 QuickFix 中查看符号，例如变量、函数等
vim.lsp.buf.document_symbol() 
----- 查看光标所在位置的定义，可以跳转到符号的定义位置
vim.lsp.buf.definition()
----- 很多语言是不支持声明的，可以用定义替换
vim.lsp.buf.declaration()
----- 在 QuickFix 显示所有的引用
vim.lsp.buf.references()
----- 在 QuickFix 窗口中显示光标所在位置的实现，并不是所有语言都支持，例如 bash python 就不支持
vim.lsp.buf.implementation()
----- 显示帮助信息
vim.lsp.buf.hover()
----- 重命名当前光标下的符号
vim.lsp.buf.rename()
----- 当遇到报错时，可以用来查看如何进行修复 kosayoda/nvim-lightbulb
vim.lsp.buf.code_action()
----- 显示函数签名信息，需要快捷键，不过 hrsh7th/cmp-nvim-lsp-signature-help 更好用一些
vim.lsp.buf.signature_help()
----- 对文件进行格式化，不过不是所有LanguageServer都支持
-- vim.lsp.buf.formatting()
