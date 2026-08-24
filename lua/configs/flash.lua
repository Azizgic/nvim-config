return {
  labels = 'asdfghjklqwertyuiopzxcvbnm',
  label = {
    uppercase = true,
    exclude = '',
    current = true,
    alt = false,
    rainbow = {
      enabled = true,
      shade = 5,
    },
  },
  modes = {
    search = {
      enabled = true,
      highlight = {
        backdrop = true,
        matches = true,
      },
      jump = {
        offset = 0,
        autojump = false,
      },
    },
    char = {
      enabled = true,
      jump_labels = true,
      multi_line = true,
      highlight = {
        backdrop = true,
        matches = true,
      },
    },
    treesitter = {
      labels = 'asdfghjklqwertyuiopzxcvbnm',
      jump_labels = true,
      search = {
        wrap = true,
      },
    },
    remote = {
      remote_op = {
        restore = true,
      },
    },
  },
  highlight = {
    backdrop = 'Comment',
    matches = 'Search',
  },
}
