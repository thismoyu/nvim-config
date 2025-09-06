### How to Install
`git clone git@github.com:brettzhang/nvim-config.git  ~/.config/nvim`

### Pugins

| 功能 | 插件 |
| ---- | ---- |
|      |      |
|      |      |
|      |      |

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
