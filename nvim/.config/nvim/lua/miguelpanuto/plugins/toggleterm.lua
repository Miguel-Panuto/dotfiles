return {
  src = 'https://github.com/akinsho/toggleterm.nvim',
  version = vim.version.range '*',
  setup = function()
    require('toggleterm').setup {}
  end,
}
