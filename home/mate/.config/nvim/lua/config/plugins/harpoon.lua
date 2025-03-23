return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    opts = {
        global_settings = {
            save_on_toggle = true,
            save_on_ui_close = true,
        },
    },
    keys = function()
        local keys = {
            {
                "<leader>ha",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Add to harpoon list",
                silent = true,
            },
            {
                "<leader>hm",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Show harpoon list",
                silent = true,
            },
        }

        for i = 1, 9 do
            table.insert(keys, {
                "<A-" .. i .. ">",
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Go to harpoon " .. i,
                silent = true,
            })
        end

        return keys
    end,
}
