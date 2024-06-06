-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 lspconfig")
	return
end

-- 配置启动并连接TypeScript的语言服务器
-- typescript-language-server --stdio
-- filetypes
-- lspconfig['tsserver'].setup({})


-- 需要nvim exrc特性
-- 使neovim从当前工作目录中的.nvim.lua / .nvimrc /.exrc中读取局部属性，避免
-- lsp clangd等需要频繁修改nvim配置引起的不变。
-- 使用方式：
-- 在工作目录创建.nvim.lua文件。考入如下配置，修改compile-commands-dir配置
-- 例如：/home5/develop/u0/alps/vendor/agold/apps/ACamera2/agold/jni_isphal_aidl/.nvim.lua
-- 其中 --compile-commands-dir 指定为： /home5/develop/u0/alps/out/full_g78v78c2k_dfl_eea-userdebug/out_sys/soong/development/ide/compdb
-- 该文件夹下： 有compile_commands.json文件

-- local status, lspconfig = pcall(require, "lspconfig")
-- if not status then
-- 	vim.notify("没有找到 lspconfig")
-- 	return
-- end
-- lspconfig['clangd'].setup({
-- 	cmd = {
-- 		"clangd",
-- 		"--compile-commands-dir=*compile-commands-dir*",
-- 	},
-- })
