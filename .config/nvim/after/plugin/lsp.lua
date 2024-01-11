local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'golangci_lint_ls', 'tsserver', 'clangd', 'svelte'},
  handlers = {
    lsp_zero.default_setup,
    tsserver = function()
      require('lspconfig').tsserver.setup({
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        }
      })
    end,
    golangci_lint_ls = function()
      require('lspconfig').golangci_lint_ls.setup({
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        }
      })
    end,

  },
})
