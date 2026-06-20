local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

-- Only define once
if not configs.odoo_lsp then
  configs.odoo_lsp = {
    default_config = {
      name = 'odoo-lsp',
      cmd = { 'odoo-lsp' },
      filetypes = { 'python', 'xml', 'javascript' },
      root_dir = lspconfig.util.root_pattern('.odoo_lsp', '.odoo_lsp.json', '.git'),
    },
  }
end

lspconfig.odoo_lsp.setup {}

return {}
