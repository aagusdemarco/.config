-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
    { '<leader>ff', function() require 'telescope.builtin'.find_files() end, mode = 'n' },
    { '<leader>fg', function() require 'telescope.builtin'.git_files() end, mode = 'n' },
    { '<leader>ps', function() require 'telescope.builtin'.grep_string({ search = vim.fn.input("Grep > ") })end , mode = 'n' }
  },

}


