-- Este archivo contiene configuraciones fundamentales ajenas a plugins o remaps.

-- Plugin Manager
require('config.lazy')

-- Remaps
require('config.remap')

-- Numeros de linea
vim.opt.number = true
vim.opt.relativenumber = true

-- Resalta la linea donde esta el cursor
vim.opt.cursorline = true

-- Agrega mensajes de error de LSP
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true
})

-- Config de indentacion y tabulado
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Config de LSP
vim.lsp.enable({ "lua_ls", "eslint", "hls", "pylsp" })

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})

vim.lsp.config('hls', {
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
})

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
    on_attach = function(client, bufnr)
        if not base_on_attach then return end

        base_on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
        })
    end,
})
