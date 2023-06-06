local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
    sources = {
        formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.diagnostics.fish,
        -- formatting.prettierd,
        formatting.black,
        formatting.gofmt,
        formatting.shfmt,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.dart_format,
        -- formatting.lua_format.with({
        --   extra_args = {
        --     '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        --     '--break-after-table-lb', '--indent-width=2'
        --   }
        -- })
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end
}

vim.api.nvim_create_user_command(
    'DisableLspFormatting',
    function()
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
    end,
    { nargs = 0 }
)
