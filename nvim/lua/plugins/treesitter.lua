return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  opts = {
      ensure_installed = { "rust", "javascript", "zig", "c", "python", "typescript", "help", "lua", "cpp", "haskell", "html", "css", "bash" },
      autoinstall = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
}
