return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    vim.opt.termguicolors = true;
    vim.keymap.set('n', '[b', function() bufferline.cycle(-1) end, { desc = 'Previous buffer' })
    vim.keymap.set('n', ']b', function() bufferline.cycle(1) end, { desc = 'Next buffer' })
    vim.keymap.set('n', '<leader>pc', function() bufferline.close_with_pick() end, { desc = 'Pick buffer and close' })
    require('which-key').register {
      ['<leader>p'] = { name = '[P]ick', _ = 'which_key_ignore' },
    }


    bufferline.setup {
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        }
      }
    };
  end,
}
