return {
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
      return vim.tbl_contains(folder_skip, name)
    end,
  },
  float = {
    padding = 5,
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-k>"] = false,
    ["<C-j>"] = false,
    ["<M-h>"] = "actions.select_split",
  },
  win_options = {
    winbar = "%{v:lua.CustomOilBar()}",
  },
}
