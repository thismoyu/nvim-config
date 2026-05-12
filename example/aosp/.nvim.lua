-- compdb:
-- aidegen libjni_custom_isphal_impl_aidl -s -n
-- or 
-- SOONG_GEN_COMPDB=1 m [something]
-- or 
-- SOONG_GEN_COMPDB=1 SOONG_GEN_RUST_PROJECT=1 m [something]

-- link:
-- ln -s out/full_a101k6989_dfl_tee-userdebug/out_hal/soong/development/ide/compdb/compile_commands.json compile_commands.json

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
  },

    -- 1. 定义如何识别项目的“根目录” (对于 AOSP 就是找 envsetup.sh)
  root_dir = function(fname)
    return lspconfig.util.root_pattern(
        "compile_commands.json",
        "build/envsetup.sh", -- 看到这个就知道是 AOSP 根目录了
    )(fname) or lspconfig.util.path.dirname(fname)
  end,

  -- 2. ⭐ 核心魔法：在 clangd 启动前，动态修改启动参数
  on_new_config = function(new_config, new_root_dir)
    if new_root_dir then
        -- 自动将探测到的根目录作为参数追加进去
        table.insert(new_config.cmd, "--compile-commands-dir=" .. new_root_dir)
    end
  end,
}
