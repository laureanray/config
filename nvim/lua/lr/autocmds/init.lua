if vim.fn.has "nvim-0.7" then
  local api = vim.api

  local fmt = api.nvim_create_augroup("fmt", { clear = true })
  api.nvim_create_autocmd(
    "BufWritePre",
    {
      command = "undojoin | Neoformat",
      group = fmt
    }
  )


end
