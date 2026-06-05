return {
  src = 'https://github.com/L3MON4D3/LuaSnip',
  build = function(data)
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    vim.system({ 'make', 'install_jsregexp' }, { cwd = data.path }):wait()
  end,
}
