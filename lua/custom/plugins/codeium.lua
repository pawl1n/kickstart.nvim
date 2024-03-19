return {
  'Exafunction/codeium.vim',
  config = function()
    -- Disable tab default mapping
    vim.g.codeium_no_map_tab = 1

    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true })
  end,
}
