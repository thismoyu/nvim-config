-- compdb:
-- aidegen libjni_custom_isphal_impl_aidl -s -n
vim.lsp.config['clangd'] = {
  cmd = { 
  	'clangd',
  	'--background-index',
  	'-j=16',
  	'--header-insertion=never',
  	'--completion-style=bundled',
  	'-compile-commands-dir',
  	'/home2/develop/v0/alps/out/full_g71v78c2k_dfl_tee-userdebug/out_sys/soong/development/ide/compdb'
  },
}
