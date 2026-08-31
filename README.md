### How to Install

无需手动 `git clone`。本仓库由 [dotfiles](https://github.com/thismoyu/dotfiles) 中 [chezmoi](https://www.chezmoi.io/) 的 `.chezmoiexternal.toml` 拉取到 `~/.config/nvim`：

```toml
[".config/nvim"]
    type = "git-repo"
    url = "https://github.com/thismoyu/nvim-config.git"
    refreshPeriod = "168h"
```

执行 `chezmoi apply`（或定期 refresh）即可同步。

### Plugins

| 插件 | 功能 |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [`alpha-nvim`](https://github.com/goolord/alpha-nvim) | 启动页 |
| [`aerial.nvim`](https://github.com/stevearc/aerial.nvim) | 代码大纲 / 符号跳转 |
| [`blink.cmp`](https://github.com/Saghen/blink.cmp) | 自动补全，支持 `LSP` 等 |
| [`bufferline.nvim`](https://github.com/akinsho/bufferline.nvim) | buffer 标签页 |
| [`catppuccin`](https://github.com/catppuccin/nvim) | 配色主题 |
| [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) | git 状态 |
| [`im-select.nvim`](https://github.com/keaising/im-select.nvim) | `normal` 模式自动切换输入法，**windows/linux/mac 配置不一样，不同分支** |
| [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [`mason.nvim`](https://github.com/mason-org/mason.nvim) | 安装管理外部工具（LSP / formatter 等） |
| [`mason-tool-installer.nvim`](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | 自动安装 mason 工具 |
| [`nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua) | 左侧文件树 |
| [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) | 代码高亮，需要安装 [treesitter](https://github.com/tree-sitter/tree-sitter/releases) |
| [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) | 文件图标 |
| [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) | 模糊查找 |
| [`todo-comments.nvim`](https://github.com/folke/todo-comments.nvim) | 高亮 `TODO` 等标签 |
| [`which-key.nvim`](https://github.com/folke/which-key.nvim) | 快捷键提示窗口 |

### Keymaps

Leader 键为 `Space`。完整列表也可在 Neovim 中按 `<leader>?` 查看。

多数快捷键与 `~/.ideavimrc` 对齐，便于 Neovim / JetBrains IdeaVim 共用肌肉记忆。

#### 通用

| 快捷键 | 说明 |
| ------ | ---- |
| `<C-s>` | 保存文件 |
| `<leader>w` | 保存全部 |
| `<leader>q` | 关闭当前窗口 |
| `<leader>qq` | 退出全部 |
| `<Esc>` | 清除搜索高亮 |
| `<C-/>` | 切换注释（Normal 当前行 / Visual 选区；底层为 `gcc` / `gc`） |
| `<leader>p` | 粘贴且不覆盖寄存器（Visual） |
| `<leader>x` | 删除且不 yank |
| `n` / `N` | 下一个 / 上一个搜索结果（居中） |
| `<C-d>` / `<C-u>` | 半页下 / 上滚动（居中） |
| `J` | 合并行并保持光标位置 |
| `Alt-j` / `Alt-k` | 下移 / 上移行（或选区） |
| `<` / `>` | Visual 缩进并保持选区 |
| 鼠标侧键后退 / 前进 | 跳转历史后退 / 前进 |

#### 窗口

| 快捷键 | 说明 |
| ------ | ---- |
| `<C-h/j/k/l>` | 切换到左 / 下 / 上 / 右窗口 |
| `<C-Left/Right>` | 减小 / 增大窗口宽度 |
| `<C-Up/Down>` | 增大 / 减小窗口高度 |

#### 文件树 (nvim-tree)

| 快捷键 | 说明 |
| ------ | ---- |
| `<C-n>` | 开关文件树 |
| `<leader>e` | 聚焦文件树 |
| `<leader>\`` | 在文件树中定位当前文件 |

#### Buffer (bufferline)

| 快捷键 | 说明 |
| ------ | ---- |
| `<leader>bn` | 下一个 buffer |
| `<leader>bp` | 上一个 buffer |
| `<leader>bd` | 关闭当前 buffer |
| `<leader>bo` | 关闭其他 buffer |
| `<leader>bb` | 选择 buffer |
| `<leader>bl` | Telescope buffer 列表 |
| `<leader>b` | Telescope 浏览已加载 buffer |

#### 搜索 (Telescope)

| 快捷键 | 说明 |
| ------ | ---- |
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全文搜索（live grep） |
| `<leader>fb` | 查找 buffer |
| `<leader>fr` | 最近打开的文件 |
| `<leader>fs` | 文档符号 |
| `<leader><space>` | 查找文件（Search Everywhere 风格） |

#### 代码大纲 (aerial)

| 快捷键 | 说明 |
| ------ | ---- |
| `<leader>o` | 开关大纲（选中跳转后自动关闭） |
| `{` / `}` | 大纲窗口内上 / 下一个符号（buffer-local） |

#### LSP / 诊断

| 快捷键 | 说明 |
| ------ | ---- |
| `gd` | 跳转定义 |
| `gD` | 跳转类型定义 |
| `gi` | 跳转实现 |
| `gr` / `gu` | 查找引用 |
| `gh` | 调用层次（Call Hierarchy） |
| `K` | Hover 文档 |
| `<leader>rn` | 重命名 |
| `<leader>ca` | Code Action |
| `<leader>fm` | 格式化 |
| `[d` / `]d` | 上一个 / 下一个诊断 |
| `<leader>d` | 显示当前诊断浮窗 |

#### 补全 (blink.cmp)

| 快捷键 | 说明 |
| ------ | ---- |
| `<Tab>` / `<S-Tab>` | 下一个 / 上一个候选项 |
| `<CR>` | 确认补全 |

#### 其他

| 快捷键 | 说明 |
| ------ | ---- |
| `<leader>?` | 打开 WhichKey 快捷键提示 |

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

**lsp 服务通过系统 / mason 等方式安装，配置使用原生 `lsp/*.lua` + `vim.lsp.enable`，不再依赖 `nvim-lspconfig` / `mason-lspconfig` 启动。**

可通过`:checkhealth vim.lsp`检查lsp服务状态

### IM-select插件说明（配合rime输入法）

1. 由于rime输入法自带ascii_mode模式（即输入法内通过shift切换中英文），内部控制输入法状态，外部无法获取，因此不要使用该模式，转而使用多个输入法
   即`fcitx`中配置多个输入法，默认为英文
2. 对应的配置文件，默认改为中文，例如（`double_pinyin_flypy.schema.yaml`）reset改为0，表示中文
3. linux默认`ctrl + space`快捷键用于切换键盘布局，需要关闭，否则无法使用该快捷键：
   键盘→布局→选项→切换至另一布局→Win+空格键取消勾选
4. 上述修改之后，可以在`fcitx5 configure`工具中配置切换输入法为`ctrl+space`
5. 如果rofi工具需要使用`super + space`，`fcitx5`中需要取消 method group切换
