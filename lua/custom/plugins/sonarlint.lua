return {
  'https://gitlab.com/schrieveslaach/sonarlint.nvim',
  config = function()
    local is_windows = vim.fn.has 'win32' == 1
    require('sonarlint').setup {
      server = {
        cmd = {
          vim.fn.expand '$MASON/bin/sonarlint-language-server' .. (is_windows and '.cmd' or ''),

          -- Ensure that sonarlint-language-server uses stdio channel
          '-stdio',
          '-analyzers',
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarpython.jar',
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarcfamily.jar',
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarjava.jar',
        },
      },
      filetypes = {
        -- Tested and working
        'python',
        'cpp',
        'java',
      },
    }
  end,
}
