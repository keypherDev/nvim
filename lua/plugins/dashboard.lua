return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Citypop-style ASCII Art
        dashboard.section.header.val = {
            "                                                                    ",
            "                ██╗  ██╗██████╗ ██████╗ ███████╗██╗   ██╗         ",
            "                ██║ ██╔╝██╔══██╗██╔══██╗██╔════╝██║   ██║         ",
            "                █████╔╝ ██████╔╝██║  ██║█████╗  ██║   ██║         ",
            "                ██╔═██╗ ██╔═══╝ ██║  ██║██╔══╝  ╚██╗ ██╔╝         ",
            "                ██║  ██╗██║     ██████╔╝███████╗ ╚████╔╝          ",
            "                ╚═╝  ╚═╝╚═╝     ╚═════╝ ╚══════╝  ╚═══╝           ",
            "                                                                    ",
            "                                                                    ",
            "            🌴                                               🌴      ",
            "         🌴     ┌──────────────────────────────────────┐     🌴   ",
            "      🌴        │ ████████ NEON NIGHTS 1986 ████████ │        🌴  ",
            "   🌴           │ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ │           🌴",
            "      🏎️💨      └──────────────────────────────────────┘              ",
            "                                                                    ",
            "                              by Jeison V.M.                       ",
            "                                                                    ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Buscar archivo", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Archivos recientes", ":Telescope oldfiles<CR>"),
            dashboard.button("n", "  Nuevo archivo", ":ene <BAR> startinsert<CR>"),
            dashboard.button("c", "  Configuración", function()
                vim.cmd("cd ~/.config/nvim")
                vim.cmd(":e init.lua")
            end),
            dashboard.button("q", "  Salir", ":qa<CR>"),
        }

        dashboard.section.footer.val = {
            "🎵  Neon nights, electric dreams. Powered by Neovim + Citypop vibes 🌆",
        }

        -- Citypop theme colors
        vim.cmd([[
      hi AlphaHeader guifg=#ff6ec7
      hi AlphaButtons guifg=#8be9fd
      hi AlphaFooter guifg=#bd93f9
    ]])

        alpha.setup(dashboard.opts)
    end,
}
