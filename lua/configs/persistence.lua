return {
  options = {
    'buffers',
    'curdir',
    'tabpages',
    'winsize',
    'help',
    'globals',
    'skiprtp',
    'folds',
  },
  pre_save = function()
    -- Close any floating windows or temporary buffers
    vim.cmd('silent! lua require("trouble").close()')
    vim.cmd('silent! lua require("spectre").close()')
  end,
  save = {
    -- Save session automatically when leaving Neovim
    auto_save = true,
  },
  load = {
    -- Restore session automatically when opening Neovim
    auto_load = true,
  },
}

