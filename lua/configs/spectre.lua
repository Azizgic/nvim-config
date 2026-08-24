return {
  mapping = {
    ['toggle_line'] = {
      map = 'dd',
      cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
      desc = 'toggle item',
    },
    ['enter_file'] = {
      map = '<cr>',
      cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
      desc = 'goto file',
    },
    ['send_to_qf'] = {
      map = 'q',
      cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
      desc = 'send all to quickfix',
    },
    ['replace_cmd'] = {
      map = 'c',
      cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
      desc = 'input replace command',
    },
    ['run_replace'] = {
      map = 'R',
      cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
      desc = 'replace all',
    },
    ['change_view_mode'] = {
      map = 'v',
      cmd = "<cmd>lua require('spectre').change_view()<CR>",
      desc = 'change view mode',
    },
    ['change_replace_sed'] = {
      map = 's',
      cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
      desc = 'use sed to replace',
    },
    ['change_replace_oxi'] = {
      map = 'o',
      cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
      desc = 'use oxi to replace',
    },
    ['toggle_live_update'] = {
      map = 'u',
      cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
      desc = 'update change when toggle',
    },
    ['quit'] = {
      map = 'q',
      cmd = "<cmd>lua require('spectre').close()<CR>",
      desc = 'quit',
    },
  },
  default = {
    color_devicons = true,
    border = 'rounded',
    find = {
      cmd = 'rg',
      options = { 'ignore-case', 'hidden', '--glob', '!**/.git/*' },
    },
    replace = {
      cmd = 'sed',
    },
  },
}
