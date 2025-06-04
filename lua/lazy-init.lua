-- https://lazy.folke.io/spec/examples

-- 1. 准备lazy.nvim模块（存在性检测）
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    -- os.exit(1)
  end
end
-- 
-- 2. 将 lazypath 设置为运行时路径
-- rtp（runtime path）
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
-- 否则，下面 require("lazy") 是找不到的
vim.opt.rtp:prepend(lazypath)

-- 3. 加载lazy.nvim模块
-- require("lazy").setup({"lsp.plugins"})

-- 3. 加载lazy.nvim模块
require("lazy").setup({
  spec = {
    { import = "colorscheme"},
    { import = "plugins" },
  },
  defaults = {
        lazy = false,
  },
  performance = {
      rtp = {
          disabled_plugins = {
              "2html_plugin",
              "tohtml",
              "getscript",
              "getscriptPlugin",
              "gzip",
              "logipat",
              "netrw",
              "netrwPlugin",
              "netrwSettings",
              "netrwFileHandlers",
              "matchit",
              "matchparen",
              "man",
              "tar",
              "tarPlugin",
              "rrhelper",
              "spellfile_plugin",
              "shada",
              "vimball",
              "vimballPlugin",
              "zip",
              "zipPlugin",
              "tutor",
              "rplugin",
              "syntax",
              "synmenu",
              "spellfile",
              "optwin",
              "compiler",
              "bugreport",
              "ftplugin",
              "editorconfig",
          },
      },
  },
})
