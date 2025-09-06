### How to Install
`git clone git@github.com:brettzhang/nvim-config.git  ~/.config/nvim`

### Pugins

| 插件                                                         | 功能                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [`mini.nvim`](https://github.com/nvim-mini/mini.nvim)        | 40+常用工具模块                                              |
| [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim) | 左侧文件管理界面                                             |
| [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs) | 括号自动补全                                                 |
| [`blink.cmp`](https://github.com/Saghen/blink.cmp)           | 自动补全插件，支持`LSP`等                                    |
| [`bufferline.nvim`](https://github.com/akinsho/bufferline.nvim) | `buffer`标签页                                               |
| [`conform.nvim`](https://github.com/stevearc/conform.nvim)   | 轻量格式化插件                                               |
| [`Comment.nvim`](https://github.com/numToStr/Comment.nvim)   | 注释插件                                                     |
| [`flash.nvim`](https://github.com/folke/flash.nvim)          | 字符搜索/跳转，支持`treesitter`,**不支持`lsp`**              |
| [`fzf-lua`](https://github.com/ibhagwan/fzf-lua)             | `fzf`继承，需要对应命令                                      |
| [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) | `git`状态                                                    |
| [`im-select.nvim`](https://github.com/keaising/im-select.nvim) | `normal`模式自动切换输入法，**windows/linux/mac配置不一样，不同分支** |
| [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim) | 缩进插件                                                     |
| [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim) | 状态栏插件                                                   |
| [`LuaSnip`](https://github.com/L3MON4D3/LuaSnip)             | `Snippet Engine`,供代码补全插件使用 **已关闭，`nvim-cmp`不再使用** |
| [`mason.nvim`](https://github.com/mason-org/mason.nvim)      | 用于自动安装各语言 `lsp` 服务器                              |
| [`noice.nvim`](https://github.com/folke/noice.nvim)          | 用于美化命令行，通知行，弹出界面                             |
| [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp)            | 自动补全插件，支持`lsp`，**已关闭，使用blink替换**           |
| [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) | 代码高亮插件，需要安装 [treesitter](https://github.com/tree-sitter/tree-sitter/releases) |
| [`outline.nvim`](https://github.com/hedyhli/outline.nvim)    | 右侧符号表，依赖`lsp`                                        |
| [`snacks.nvim`](https://github.com/folke/snacks.nvim)        | 也是工具合集,(与`mini`是否冲突？)                            |
| [`todo-comments.nvim`](https://github.com/folke/todo-comments.nvim) | 高亮`todo`等标签                                             |
| [`which-key.nvim`](https://github.com/folke/which-key.nvim)  | 快捷键提示窗口                                               |

### References
[详解nvim内建LSP体系与基于nvim-cmp的代码补全体系](https://www.cnblogs.com/w4ngzhen/p/17546969.html)

### LSP 配置更新

>   nvim 0.11 版本之后，官方简化了lsp配置
>
>   https://neovim.io/doc/user/lsp.html
>
>   https://gpanders.com/blog/whats-new-in-neovim-0-11/#simpler-lsp-setup-and-configuration

*   方案1: 通过`vim.lsp.config`配置对应语言的配置包，然后通过`vim.lsp.enable`启动配置
*   方案2: 通过创建`lsp/<config-name>.lua`文件，会自动导入该配置，然后通过`vim.lsp.enable`启动配置（目前方案）

**lsp服务依旧通过`mason`安装，不再使用`nvim-lspconfig` ，`mason-lspconfig`等插件**

可通过`:checkhealth lsp`检查lsp服务状态

### IM-select插件说明（配合rime输入法）

1. 由于rime输入法自带ascii_mode模式（即输入法内通过shift切换中英文），内部控制输入法状态，外部无法获取，因此不要使用该模式，转而使用多个输入法
   即`fcitx`中配置多个输入法，默认为英文
2. 对应的配置文件，默认改为中文，例如（`double_pinyin_flypy.schema.yaml`）reset改为0，表示中文
3. linux默认`ctrl + space`快捷键用于切换键盘布局，需要关闭，否则无法使用该快捷键：
   键盘→布局→选项→切换至另一布局→Win+空格键取消勾选
4. 上述修改之后，可以在`fcitx5 configure`工具中配置切换输入法为`ctrl+space`
5. 如果rofi工具需要使用`super + space`，`fcitx5`中需要取消 method group切换
