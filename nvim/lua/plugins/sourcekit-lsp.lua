if vim.fn.executable("sourcekit-lsp") then
  vim.lsp.enable("sourcekit", true)
  return {}
end
