return {
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = true,
    cmd = 'Neogit',
  },
}
