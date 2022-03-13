-- C/C++
require'lspconfig'.clangd.setup{}

-- Lua
require'lspconfig'.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
        }
    }
}

-- HTML, CSS, JSON
--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- require'lspconfig'.html.setup {
--   capabilities = capabilities,
-- }
--
-- require'lspconfig'.cssls.setup {
--   capabilities = capabilities,
-- }
--
-- require'lspconfig'.jsonls.setup {
--   capabilities = capabilities,
-- }
--
-- -- PHP
-- require'lspconfig'.intelephense.setup{}
