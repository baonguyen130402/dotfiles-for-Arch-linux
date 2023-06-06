local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
        layout_config = {
            bottom_pane = {
                height = 0.5,
                preview_width = 0.6,
                preview_cutoff = 120,
                prompt_position = 'top',
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = 'top',
                width = 0.9,
            },
            cursor = {
                height = 0.9,
                preview_cutoff = 40,
                preview_width = 0.6,
                width = 0.9,
            },
            horizontal = {
                height = 0.9,
                preview_width = 0.6,
                preview_cutoff = 120,
                prompt_position = 'bottom',
                width = 0.9,
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = 'bottom',
                width = 0.9,
            },
            -- other layout configuration here
        },
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
        prompt_prefix = "🔍",
        selection_caret = ' ',
        path_display = { 'smart' },
    },
    pickers = {
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
        -- fzf = {
        --     fuzzy = true,                   -- false will only do exact matching
        --     override_generic_sorter = true, -- override the generic sorter
        --     override_file_sorter = true,    -- override the file sorter
        --     case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
        -- },
    },
}

telescope.load_extension("file_browser")
telescope.load_extension("notify")

vim.keymap.set('n', ';f',
    function()
        builtin.find_files({
            no_ignore = false,
            hidden = true
        })
    end)
vim.keymap.set('n', ';r', function()
    builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
    builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
    builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
    builtin.resume()
end)
vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }
    })
end)
