function Define_Colorschema(schema)
  vim.cmd 'syntax enable'
  vim.cmd.colorscheme(schema)

  vim.cmd.hi 'Comment gui=none'
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
