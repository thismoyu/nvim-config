-- only store the lsp configuration.
-- LSP, qi dong!
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')

-- 启用exrc特性。使neovim从当前工作目录中的.nvim.lua / .nvimrc /.exrc中读取局部属性，避免
-- lsp clangd等需要频繁修改nvim配置引起的不便。
vim.o.exrc = true

-- 需要nvim exrc特性
-- 使neovim从当前工作目录中的.nvim.lua / .nvimrc /.exrc中读取局部属性，避免
-- lsp clangd等 需要频繁修改nvim配置引起的不变。
-- 使用方式：
-- 在工作目录创建.nvim.lua文件。写入如下配置，修改compile-commands-dir配置
-- 例如：/home2/develop/v0/alps/vendor/agold/apps/ACamera2/agui/jni/isphal/aidl/.nvim.lua 

-- step 0.  0.9+ nvim使用exrc特性。需要将.nvim.lua文件加入trust列表，否则会报错：
-- 通过nvim打开 .nvim.lua 然后执行 :trust , 回车即可，不需要参数

-- step 1. 通过命令生成 compile_commands.json
-- aidegen libjni_custom_isphal_impl_aidl -s -n

-- step 2. 添加以下内容，修改对应的路径（参考example中的对应文件）
-- vim.lsp.config['clangd'] = {
--   cmd = { 
--      'clangd',
--      '-compile-commands-dir',
--      '/home2/develop/v0/alps/out/full_g71v78c2k_dfl_tee-userdebug/out_sys/soong/development/ide/compdb'
--   },
-- }


----- 在 QuickFix 中查看符号，例如变量、函数等
-- vim.lsp.buf.document_symbol()
-- ----- 查看光标所在位置的定义，可以跳转到符号的定义位置
-- vim.lsp.buf.definition()
-- ----- 很多语言是不支持声明的，可以用定义替换
-- vim.lsp.buf.declaration()
-- ----- 在 QuickFix 显示所有的引用
-- vim.lsp.buf.references()
-- ----- 在 QuickFix 窗口中显示光标所在位置的实现，并不是所有语言都支持，例如 bash python 就不支持
-- vim.lsp.buf.implementation()
-- ----- 显示帮助信息
-- vim.lsp.buf.hover()
-- ----- 重命名当前光标下的符号
-- vim.lsp.buf.rename()
-- ----- 当遇到报错时，可以用来查看如何进行修复 kosayoda/nvim-lightbulb
-- vim.lsp.buf.code_action()
-- ----- 显示函数签名信息，需要快捷键，不过 hrsh7th/cmp-nvim-lsp-signature-help 更好用一些
-- vim.lsp.buf.signature_help()
----- 对文件进行格式化，不过不是所有LanguageServer都支持
-- vim.lsp.buf.formatting()


-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local keymap = vim.keymap
        local lsp = vim.lsp
        local bufopts = { noremap = true, silent = true }

        keymap.set("n", "gr", lsp.buf.references, vim.tbl_extend("force", bufopts, { desc = "References" }))
        keymap.set("n", "gu", lsp.buf.references, vim.tbl_extend("force", bufopts, { desc = "Find usages" }))
        keymap.set("n", "gd", lsp.buf.definition, vim.tbl_extend("force", bufopts, { desc = "Goto definition" }))
        keymap.set("n", "gD", lsp.buf.type_definition, vim.tbl_extend("force", bufopts, { desc = "Goto type definition" }))
        keymap.set("n", "gi", lsp.buf.implementation, vim.tbl_extend("force", bufopts, { desc = "Goto implementation" }))
        keymap.set("n", "gh", lsp.buf.incoming_calls, vim.tbl_extend("force", bufopts, { desc = "Call hierarchy" }))
        keymap.set("n", "<leader>rn", lsp.buf.rename, vim.tbl_extend("force", bufopts, { desc = "Rename" }))
        keymap.set("n", "<leader>ca", lsp.buf.code_action, vim.tbl_extend("force", bufopts, { desc = "Code action" }))
        keymap.set("n", "K", lsp.buf.hover, vim.tbl_extend("force", bufopts, { desc = "Hover" }))
        keymap.set("n", "<leader>fm", function()
            vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", bufopts, { desc = "Format" }))
    end,
})