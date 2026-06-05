return {
  src = 'https://github.com/echasnovski/mini.nvim',
  setup = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup()

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    local minifiles = require 'mini.files'
    minifiles.setup {
      mappings = {
        close = 'q',
        go_in = '<CR>',
        go_in_plus = 'l',
        go_out = 'h',
        go_out_plus = 'H',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
    }

    vim.keymap.set('n', '<leader>pb', minifiles.open, { desc = '[F]ile [F]inder' })
  end,
}
