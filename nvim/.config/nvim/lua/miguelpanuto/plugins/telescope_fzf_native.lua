if vim.fn.executable 'make' == 0 then
  return nil
end

return {
  src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  build = function(data)
    vim.system({ 'make' }, { cwd = data.path }):wait()
  end,
}
