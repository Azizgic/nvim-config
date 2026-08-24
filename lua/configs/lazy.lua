return {
  defaults = { lazy = true },
  install = {
    timeout = 600, -- 10 minutes
    colorscheme = { 'catppuccin' },
  },

  git = {
    timeout = 600, -- 10 minutes
    submodules = true,
    -- Use shallow clone to speed up
    depth = 1, -- Only clone the latest commit
  },

  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'getscript',
        'getscriptPlugin',
        --  "gzip",
        'logipat',
        --  "netrw",
        --  "netrwPlugin",
        --  "netrwSettings",
        --  "netrwFileHandlers",
        --  "matchit",
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        --  "zip",
        --  "zipPlugin",
        -- "tutor",
        'rplugin',
        --  "syntax"r763
        'synmenu',
        --  "optwin",
        --  "compiler",
        'bugreport',
        'ftplugin',
      },
    },
  },
}
