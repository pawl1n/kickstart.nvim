require('which-key').register {
  ['<leader>x'] = { name = 'Trouble', _ = 'which_key_ignore' },
}

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
  { desc = "Toggle workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
  { desc = "Toggle document diagnostics" })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Toggle quickfix" })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Toggle loclist" })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Toggle lsp references" })

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
  },
}
