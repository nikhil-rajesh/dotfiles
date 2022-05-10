-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'angularls', 'intelephense', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Lua
require'lspconfig'.sumneko_lua.setup{
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
        }
    }
}


-- Java
require'lspconfig'.jdtls.setup{
    cmd = { "jdtls" },
    init_options = {
        workspace = "/home/bee/workspace"
    },
    root_dir = function(fname)
        return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
    end,
    flags = {
      debounce_text_changes = 150,
    },
}

-- HTML, CSS, JSON
local webservers = { 'jsonls', 'cssls', 'html' }
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
for _, lsp in pairs(webservers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
