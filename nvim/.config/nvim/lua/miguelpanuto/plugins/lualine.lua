return {
  src = 'https://github.com/nvim-lualine/lualine.nvim',
  setup = function()
    require('lualine').setup {
      option = {
        theme = 'modus-vivendi',
      },
    }
  end,
}
