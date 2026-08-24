-- 1. Setup Mason core
require('mason').setup({
  ui = {
    icons = {
      package_pending = ' ',
      package_installed = ' ',
      package_uninstalled = ' ',
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = { 'svelte', 'glsl_analyzer' },
  automatic_enable = true,
})
