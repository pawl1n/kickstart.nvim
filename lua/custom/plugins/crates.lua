return {
  'saecki/crates.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local cmp = require('cmp')

    vim.api.nvim_create_autocmd("BufRead", {
      group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
      pattern = "Cargo.toml",
      callback = function()
        cmp.setup.buffer({ sources = { { name = "crates" } } })
      end,
    })
    require('crates').setup {
      src = {
        cmp = {
          enabled = true,
        }
      }
    }
  end,
}
