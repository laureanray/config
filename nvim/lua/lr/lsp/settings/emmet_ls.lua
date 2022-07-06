-- https://github.com/pedro757/emmet
-- npm i -g ls_emmet
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
  capabilities = capabilities,
  filetypes = {
    "htm",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "haml",
    "xml",
    "xsl",
    "pug",
    "slim",
    "sass",
    "stylus",
    "less",
    "sss",
    "hbs",
    "handlebars",
  },
}
