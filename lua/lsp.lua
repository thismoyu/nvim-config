-- only store the lsp configuration.
-- LSP, qi dong!
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
-- vim.lsp.enable("pylsp")
vim.lsp.enable('pyright')
vim.lsp.enable('rust-analyzer')

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
--   	'clangd',
--   	'-compile-commands-dir',
--   	'/home2/develop/v0/alps/out/full_g71v78c2k_dfl_tee-userdebug/out_sys/soong/development/ide/compdb'
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

---------------------------- lsp keymap -------------------------
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

-- rename
-- vim.keymap.set("n", "<leader>cr", ":lua vim.lsp.buf.rename<CR>", opt)
-- -- code action
-- vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
-- -- go to defintion
-- vim.keymap.set("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", opt)
-- -- go to implementation
-- vim.keymap.set("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>", opt)
-- -- go to reference
-- vim.keymap.set("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", opt)
-- -- show help docs
-- vim.keymap.set("n", "<leader>gh", ":lua vim.lsp.buf.hover()<CR>", opt)
-- -- format
-- vim.keymap.set("n", "<leader>cf", ":lua vim.lsp.buf.format { async = true }<CR>", opt)

-- Define LSP-related keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		vim.keymap.set("n", "gd", function()
			local params = vim.lsp.util.make_position_params(0, "utf-8")
			vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, _, _)
				if not result or vim.tbl_isempty(result) then
					vim.notify("No definition found", vim.log.levels.INFO)
				else
					require("snacks").picker.lsp_definitions()
                    -- vim.lsp.buf.definition()
				end
			end)
		end, { buffer = event.buf, desc = "LSP: Goto Definition" })

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: Goto Declaration" })
		vim.keymap.set("n", "gr", function()
			require("snacks").picker.lsp_references()
            -- vim.lsp.buf.references()
		end, { buffer = event.buf, desc = "LSP: Goto References" })

		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Lsp Action" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: Rename" })

		-- Diagnostics
		vim.keymap.set("n", "<leader>ld", function()
			vim.diagnostic.open_float({ source = true })
		end, { buffer = event.buf, desc = "LSP: Show Diagnostic" })
		vim.keymap.set(
			"n",
			"<leader>td",
			(function()
				local diag_status = 1 -- 1 is show; 0 is hide
				return function()
					if diag_status == 1 then
						diag_status = 0
						vim.diagnostic.config({
							underline = false,
							virtual_text = false,
							signs = false,
							update_in_insert = false,
						})
					else
						diag_status = 1
						vim.diagnostic.config({
							underline = true,
							virtual_text = true,
							signs = true,
							update_in_insert = true,
						})
					end
				end
			end)(),
			{ buffer = event.buf, desc = "LSP: Toggle diagnostics display" }
		)

		-- folding
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end

		-- Inlay hint
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			-- vim.lsp.inlay_hint.enable()
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, { buffer = event.buf, desc = "LSP: Toggle Inlay Hints" })
		end

		-- Highlight words under cursor
		if
			client
			and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
			and vim.bo.filetype ~= "bigfile"
		then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
					-- vim.cmd 'setl foldexpr <'
				end,
			})
		end
	end,
})

-- diagnostic UI touches
-- local icons = require 'custom.ui.icons'
-- vim.diagnostic.config {
--   virtual_lines = { current_line = true },
--   -- virtual_text = {
--   --   spacing = 4,
--   --   prefix = '',
--   -- },
--   float = { severity_sort = true },
--   severity_sort = true,
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
--       [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
--       [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
--       [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
--     },
--   },
-- }

