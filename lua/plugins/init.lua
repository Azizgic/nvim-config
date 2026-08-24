return {
  -- ═══════════════════════════════════════════════════════
  --  Core Dependencies
  -- ═══════════════════════════════════════════════════════
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',

  -- ═══════════════════════════════════════════════════════
  --  UI & Appearance
  -- ═══════════════════════════════════════════════════════
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'User FilePost',
    opts = {
      indent = { char = '│', highlight = 'IblIndent' },
      scope = { char = '│', highlight = 'IblScope' },
    },
    config = function(_, opts)
      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require('ibl').setup(opts)
    end,
  },

  {
    'folke/which-key.nvim',
    keys = { '<leader>', '<c-w>', '"', "'", '`', 'c', 'v', 'g' },
    cmd = 'WhichKey',
  },

  -- ═══════════════════════════════════════════════════════
  --  Editing & Navigation
  -- ═══════════════════════════════════════════════════════
  {
    'numToStr/Comment.nvim',
    keys = {
      { '<leader>/', 'gcc', desc = 'Toggle comment', mode = 'n' },
      { '<leader>/', 'gc', desc = 'Toggle comment', mode = 'v' },
    },
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'echasnovski/mini.surround',
    version = false,
    opts = {},
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = function()
      return require('configs.flash')
    end,
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash Jump',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },

  -- ═══════════════════════════════════════════════════════
  --  File Explorer & Navigation
  -- ═══════════════════════════════════════════════════════
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = function()
      return require('configs.oil')
    end,
    config = function(_, opts)
      -- Define CustomOilBar globally
      _G.CustomOilBar = function()
        local path = vim.fn.expand('%')
        path = path:gsub('oil://', '')
        return '  ' .. vim.fn.fnamemodify(path, ':.')
      end

      require('oil').setup(opts)

      -- Keymaps
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Explorer' })
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ha', desc = 'Harpoon Add File' },
      { '<leader>hh', desc = 'Harpoon Menu' },
      { '<leader>h1', desc = 'Harpoon File 1' },
      { '<leader>h2', desc = 'Harpoon File 2' },
      { '<leader>h3', desc = 'Harpoon File 3' },
      { '<leader>h4', desc = 'Harpoon File 4' },
      { '<leader>hn', desc = 'Harpoon Next File' },
      { '<leader>hp', desc = 'Harpoon Prev File' },
    },
    config = function()
      require('configs.harpoon')
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Fuzzy Finder
  -- ═══════════════════════════════════════════════════════
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function()
      require('configs.telescope')
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Search & Replace
  -- ═══════════════════════════════════════════════════════
  -- {
  --   'windwp/nvim-spectre',
  --   cmd = 'Spectre',
  --   keys = {
  --     {
  --       '<leader>sr',
  --       function()
  --         require('spectre').open()
  --       end,
  --       desc = 'Replace in files (Spectre)',
  --     },
  --     {
  --       '<leader>sw',
  --       function()
  --         require('spectre').open_visual({ select_word = true })
  --       end,
  --       desc = 'Search current word (Spectre)',
  --     },
  --     {
  --       '<leader>sp',
  --       function()
  --         require('spectre').open_file_search({ select_word = true })
  --       end,
  --       desc = 'Search in current file (Spectre)',
  --     },
  --   },
  --   opts = function()
  --     return require('configs.spectre')
  --   end,
  -- },

  -- ═══════════════════════════════════════════════════════
  --  LSP & Completion
  -- ═══════════════════════════════════════════════════════
  {
    'mason-org/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    opts = function()
      return require('configs.mason')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = 'User FilePost',
    config = function()
      require('configs.lspconfig').defaults()
    end,
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
        config = function(_, opts)
          require('luasnip').config.set_config(opts)
          require('configs.luasnip')
        end,
      },
      {
        'windwp/nvim-autopairs',
        opts = {
          fast_wrap = {},
          disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        config = function(_, opts)
          require('nvim-autopairs').setup(opts)
          local cmp_autopairs = require('nvim-autopairs.completion.cmp')
          require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
      },
      {
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'https://codeberg.org/FelipeLema/cmp-async-path.git',
      },
    },
    opts = function()
      return require('configs.cmp')
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Diagnostics
  -- ═══════════════════════════════════════════════════════
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>cs', '<cmd>Trouble symbols toggle<CR>', desc = 'Symbols (Trouble)' },
      { '<leader>cl', '<cmd>Trouble lsp toggle<CR>', desc = 'LSP Definitions/References (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<CR>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<CR>', desc = 'Quickfix List (Trouble)' },
    },
    opts = function()
      return require('configs.trouble')
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Syntax Highlighting & Parsing
  -- ═══════════════════════════════════════════════════════
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    priority = 1000,
    opts = {
      ensure_installed = {
        'lua', 'python', 'javascript', 'typescript', 'svelte',
        'html', 'css', 'json', 'yaml', 'markdown', 'vim', 'vimdoc',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = '<C-s>',
          node_decremental = '<C-d>',
        },
      },
    },
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { 'html', 'javascript', 'typescript', 'svelte', 'tsx' },
      })
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Git
  -- ═══════════════════════════════════════════════════════
  {
    'lewis6991/gitsigns.nvim',
    event = 'User FilePost',
    opts = function()
      return require('configs.gitsigns')
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Formatting
  -- ═══════════════════════════════════════════════════════
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
      },
    },
  },

  -- ═══════════════════════════════════════════════════════
  --  Terminal
  -- ═══════════════════════════════════════════════════════
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = 'ToggleTerm',
  },

  -- ═══════════════════════════════════════════════════════
  --  Filetype Specific
  -- ═══════════════════════════════════════════════════════
  {
    'evanleck/vim-svelte',
    ft = 'svelte',
    config = function()
      vim.cmd('helptags ALL')
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Markdown & Notes
  -- ═══════════════════════════════════════════════════════
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    opts = {},
  },

  {
    'zk-org/zk-nvim',
    ft = { 'markdown' },
    config = function()
      require('zk').setup({
        picker = 'telescope',
      })
    end,
  },

  -- ═══════════════════════════════════════════════════════
  --  Session Management
  -- ═══════════════════════════════════════════════════════
  -- {
  --   'folke/persistence.nvim',
  --   event = 'BufReadPre',
  --   opts = function()
  --     return require('configs.persistence')
  --   end,
  --   keys = {
  --     {
  --       '<leader>qs',
  --       function()
  --         require('persistence').load()
  --       end,
  --       desc = 'Restore Session',
  --     },
  --     {
  --       '<leader>qS',
  --       function()
  --         require('persistence').select()
  --       end,
  --       desc = 'Select Session',
  --     },
  --     {
  --       '<leader>ql',
  --       function()
  --         require('persistence').load({ last = true })
  --       end,
  --       desc = 'Restore Last Session',
  --     },
  --     {
  --       '<leader>qd',
  --       function()
  --         require('persistence').stop()
  --       end,
  --       desc = "Don't Save Current Session",
  --     },
  --   },
  -- },
}
