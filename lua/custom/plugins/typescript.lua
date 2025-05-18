return {
  'pmizio/typescript-tools.nvim',
  opts = {
    settings = {
      -- Provide any other default format options you want
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        quotePreference = 'auto',
      },
    },
    on_attach = function(client, bufnr)
      -- Apply buffer-local indentation settings to tsserver
      local function apply_buffer_indent_settings()
        local shiftwidth = vim.bo[bufnr].shiftwidth
        local tabstop = vim.bo[bufnr].tabstop
        local expandtab = vim.bo[bufnr].expandtab

        local indent = shiftwidth > 0 and shiftwidth or tabstop

        client.config.settings.tsserver_format_options = {
          insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
          convertTabsToSpaces = expandtab,
          tabSize = indent,
          indentSize = indent,
        }

        client.notify('workspace/didChangeConfiguration', {
          settings = client.config.settings,
        })
      end

      -- Apply settings on attach
      apply_buffer_indent_settings()

      vim.api.nvim_create_autocmd('OptionSet', {
        pattern = 'shiftwidth,tabstop,expandtab',
        callback = apply_buffer_indent_settings,
      })
    end,
  },
}
