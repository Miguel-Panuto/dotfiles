return {
  src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  version = 'master',
  build = function(data)
    if not data.active then
      vim.cmd.packadd(data.spec.name)
    end
    vim.cmd 'TSUpdate'
  end,
  setup = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
