-- lua/configs/treesitter.lua
return function()
  local languages = { 'lua', 'python', 'javascript', 'typescript', 'svelte', 'html', 'css', 'vim', 'markdown' }
  
  vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
    end,
  })
end
