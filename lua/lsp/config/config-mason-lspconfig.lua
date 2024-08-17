-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


local status, masonlspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

masonlspconfig.setup({
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    -- A list of servers to automatically install if they're not already installed
    
    -- bashls 安装不上？
    ensure_installed = { 'pylsp' },
})