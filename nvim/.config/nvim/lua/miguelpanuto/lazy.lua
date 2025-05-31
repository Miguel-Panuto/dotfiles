local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--
require('lazy').setup {
  require 'miguelpanuto.plugins.telescope',
  require 'miguelpanuto.plugins.lsp',
  require 'miguelpanuto.plugins.cmp',
  -- require 'miguelpanuto.plugins.oil',
  require 'miguelpanuto.plugins.harpoon',
  require 'miguelpanuto.plugins.autopairs',
  require 'miguelpanuto.plugins.undotree',
  require 'miguelpanuto.plugins.vim_tmux_navigator',
  require 'miguelpanuto.plugins.catppuccin',
  require 'miguelpanuto.plugins.treesitter',
  require 'miguelpanuto.plugins.gitsigns',
  require 'miguelpanuto.plugins.mini',
  require 'miguelpanuto.plugins.conform',
  require 'miguelpanuto.plugins.lualine',
  require 'miguelpanuto.plugins.tokyo_night',
  require 'miguelpanuto.plugins.tokyodark',
  require 'miguelpanuto.plugins.rose_pyne',
  require 'miguelpanuto.plugins.catppuccin',
  require 'miguelpanuto.plugins.kanagawa',
  require 'miguelpanuto.plugins.codecompanion',

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  'github/copilot.vim',
}
