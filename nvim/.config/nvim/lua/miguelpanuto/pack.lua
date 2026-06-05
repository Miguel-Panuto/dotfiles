local module_names = {
  -- libraries / deps (no setup of their own)
  'plenary',
  'nvim_web_devicons',
  'mason',
  'mason_lspconfig',
  'mason_tool_installer',
  'cmp_nvim_lsp',
  'cmp_luasnip',
  'cmp_path',
  'luasnip',
  'telescope_fzf_native',
  'telescope_ui_select',
  'sleuth',

  -- features
  'telescope',
  'lsp',
  'cmp',
  'oil',
  'harpoon',
  'autopairs',
  'undotree',
  'vim_tmux_navigator',
  'treesitter',
  'gitsigns',
  'mini',
  'conform',
  'lualine',
  'fidget',
  'comment',
  'todo_comments',
  'codecompanion',
  'toggleterm',

  -- colorschemes
  'tokyodark',
  'tokyo_night',
  'rose_pyne',
  'catppuccin',
  'kanagawa',
  'cyberdream',
}

local specs = {}
local pack_specs = {}

for _, name in ipairs(module_names) do
  local s = require('miguelpanuto.plugins.' .. name)
  if s then
    table.insert(specs, s)
    table.insert(pack_specs, { src = s.src, name = s.name, version = s.version })
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end
    for _, s in ipairs(specs) do
      if s.src == ev.data.spec.src and s.build then
        s.build(ev.data)
        return
      end
    end
  end,
})

vim.pack.add(pack_specs, { confirm = false })

for _, s in ipairs(specs) do
  if s.setup then
    s.setup()
  end
end
