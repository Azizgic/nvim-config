vim.g.mapleader = ' '

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Set Python host
vim.g.python3_host_prog = "/data/data/com.termux/files/usr/bin/python"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', repo, '--branch=stable', lazypath })
end

-- Add to your init.lua (outside of lazy)
vim.opt.rtp:append(vim.fn.stdpath('data') .. '/site')

vim.opt.rtp:prepend(lazypath)

local lazy_config = require('configs.lazy')

-- load plugins
require('lazy').setup({
    {import = "plugins"},
}, lazy_config)


require('options')
require('autocmds')

vim.schedule(function()
  require('mappings')
end)
