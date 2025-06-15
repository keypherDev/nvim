local conf = require('telescope.config').values
local themes = require('telescope.themes')

-- helper function to use telescope on harpoon list.
-- change get_ivy to other themes if wanted
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    local opts = themes.get_ivy({
        promt_title = "Working List"
    })

    require("telescope.pickers").new(opts, {
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),
    }):find()
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>fl", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
        vim.keymap.set("n", "<A-[>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<A-]>", function() harpoon:list():next() end)
        vim.keymap.set("n", "<leader>hc", function()
            harpoon:list():clear()
            print("Harpoon list cleared")
        end, { desc = "Clear Harpoon list" })
        vim.keymap.set("n", "<leader>hr", function()
            local current_buf = vim.api.nvim_buf_get_name(0)
            harpoon:list():remove(current_buf)
            print("Removed from Harpoon: " .. current_buf)
        end, { desc = "Remove current file from Harpoon" })
    end
}
