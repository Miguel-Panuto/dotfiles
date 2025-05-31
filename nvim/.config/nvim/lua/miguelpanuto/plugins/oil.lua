return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
      },
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      lsp_file_methods = {
        timeout_ms = 1000,
        autosave_changes = false,
      },
      keymaps_help = {
        border = 'rounded',
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
    }
    vim.keymap.set('n', '<leader>pv', '<cmd>Oil<cr>')
  end,
}
