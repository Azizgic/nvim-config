    local harpoon = require("harpoon")
    harpoon:setup()
    local map = vim.keymap.set

    map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon Add File" })
    map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
    map("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
    map("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
    map("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
    map("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
    map("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon Next File" })
    map("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon Prev File" })
