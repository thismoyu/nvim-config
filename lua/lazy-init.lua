-- 1. install lazy.nvim or not.
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
-- 
-- 2. add lazy path to preload path.
-- rtp（runtime path）
vim.opt.rtp:prepend(lazypath)

-- 3. load lazy.nvim & plugins.
require("lazy").setup("plugins")
