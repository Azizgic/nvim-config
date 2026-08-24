local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = 'LSP ' .. desc }
  end

  map('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
  map('n', 'gd', vim.lsp.buf.definition, opts('Go to definition'))
  map('n', 'gr', vim.lsp.buf.references, opts('Get references'))
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts('Add workspace folder'))
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts('Remove workspace folder'))
  map('n', 'K', vim.lsp.buf.hover, opts('Hover'))

  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts('List workspace folders'))

  map('n', '<leader>D', vim.lsp.buf.type_definition, opts('Go to type definition'))

  -- Diagnostics
  map('n', '<leader>de', vim.diagnostic.open_float, opts('Diagnostics'))
end

-- disable semanticTokens
M.on_init = function(client, _)
  client.server_capabilities.semanticTokensProvider = nil
end

-- Remove the root_dir override - lspconfig handles this better
-- Delete M.root_dir function

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

M.defaults = function()
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      M.on_attach(_, args.buf)
    end,
  })
end

M.root_dir = function(bufnr, on_dir)
  local fname = vim.api.nvim_buf_get_name(bufnr)
  on_dir(require('lspconfig.util').root_pattern('.git', '.')(fname))
end

local lua_lsp_settings = {
  Lua = {
    runtime = { version = 'LuaJIT' },
    workspace = {
      library = {
        vim.fn.expand('$VIMRUNTIME/lua'),
        vim.fn.stdpath('data') .. '/lazy/lazy.nvim/lua/lazy',
        '${3rd}/luv/library',
      },
    },
  },
}

vim.lsp.config('*', { capabilities = M.capabilities, on_init = M.on_init, root_dir = M.root_dir })

vim.lsp.config('lua_ls', { settings = lua_lsp_settings })
vim.lsp.enable('lua_ls')

vim.lsp.enable('clangd')

vim.lsp.config('svelte', {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = { '*.js', '*.ts' },
      callback = function(ctx)
        client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.file })
      end,
    })
  end,
})
vim.lsp.enable('svelte')

-- Add this to your existing lspconfig
vim.lsp.config('glsl_analyzer', {
  cmd = { 'glsl_analyzer' },
  filetypes = { 'glsl', 'javascript', 'typescript' }, -- Include JS/TS for Otter
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern('.git', 'package.json')(fname)
  end,
})
vim.lsp.enable('glsl_analyzer')

return M
