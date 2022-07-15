require'navigator'.setup({
  lsp = {
    format_on_save = true,
    disable_lsp = {'denols'},
    format_options = {async=true}
  },
   treesitter_analysis_max_num = 100
})
