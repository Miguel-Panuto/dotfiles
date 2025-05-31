return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local codecompanion = require 'codecompanion'
    codecompanion.setup {
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = 'Prompt ',
          provider = 'default',
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
    }
  end,
}
