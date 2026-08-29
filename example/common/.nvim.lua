-- compdb:
-- aidegen libjni_custom_isphal_impl_aidl -s -n
-- or 
-- SOONG_GEN_COMPDB=1 m [something]
-- or 
-- SOONG_GEN_COMPDB=1 SOONG_GEN_RUST_PROJECT=1 m [something]
vim.lsp.config['clangd'] = {
  cmd = { 
    "clangd",
    "--background-index",      -- 后台建立索引，提供全局引用等功能
    "-j=6",                    -- ⭐ 限制并发线程数。根据你的 CPU 核心数调整，不要写满！
    "--header-insertion=never",-- ⭐ AOSP 中千万别让 clangd 自动插头文件，大概率插错路径
    "--pch-storage=memory",    -- 将预编译头文件放在内存中，提高响应速度
    "--limit-references=1000", -- 限制查找引用的数量，防止在 AOSP 中查找爆内存
    "--limit-results=500",     -- 限制代码补全的结果数量
    "--fallback-style=Google", -- AOSP 默认风格
    "--compile-commands-dir=/home2/u0-vendor/alps/out/full_a101k6989_dfl_tee-userdebug/out_hal/soong/development/ide/compdb/",
  },
}
