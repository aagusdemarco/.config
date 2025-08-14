-- Asignar leader a espacio
vim.g.mapleader = ' '

-- Volver a netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Formatear documento con LSP
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
