vim.g.rustaceanvim = {
  server = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
}

return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
}
