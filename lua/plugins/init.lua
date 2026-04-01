return {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',

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

  -- formatting
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = { lua = { 'stylua' } },
    },
  },

  -- lsp stuff
  {
    'mason-org/mason.nvim',
    event = 'User FilePost',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
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
  },

  -- load luasnips + cmp related in insert mode only
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        -- snippet plugin
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
        config = function(_, opts)
          require('luasnip').config.set_config(opts)
          require('configs.luasnip')
        end,
      },

      -- autopairing of (){}[] etc
      {
        'windwp/nvim-autopairs',
        opts = {
          fast_wrap = {},
          disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        config = function(_, opts)
          require('nvim-autopairs').setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require('nvim-autopairs.completion.cmp')
          require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
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

  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function()
      require('configs.telescope')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate | TSInstallAll',
    opts = function()
      return require('configs.treesitter')
    end,
  },

  -- git stuff
  {
    'lewis6991/gitsigns.nvim',
    event = 'User FilePost',
    opts = function()
      return require('configs.gitsigns')
    end,
  },

  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 5,
      },
    },
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

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = 'ToggleTerm',
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter', -- lazy load like cmp
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { 'html', 'javascript', 'typescript', 'svelte', 'tsx' }, -- include Svelte and scripts
      })
    end,
  },
}
