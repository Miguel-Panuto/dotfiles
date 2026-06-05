return {
  src = 'https://github.com/olimorris/codecompanion.nvim',
  setup = function()
    require('codecompanion').setup {
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
