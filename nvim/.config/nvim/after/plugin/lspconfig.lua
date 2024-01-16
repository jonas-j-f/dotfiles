require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").tsserver.setup {on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
end
}
require("lspconfig").texlab.setup {}
