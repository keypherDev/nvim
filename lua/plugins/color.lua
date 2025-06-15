return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000, -- Asegura que se cargue primero
        config = function()
            -- Configuración mínima: solo elige el estilo (variante)
            require("rose-pine").setup({
                variant = "auto", -- Opciones: "auto" (según sistema), "main", "moon", "dawn"
                dark_variant = "main",
                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },
            })

            vim.cmd.colorscheme("rose-pine") -- Aplica el tema
            -- Paleta de colores de rose-pine
            -- local palette = require("rose-pine.palette")
            -- Personalización de colores
            -- vim.api.nvim_set_hl(0, "Comment", { fg = "#699558", italic = true })
            -- vim.api.nvim_set_hl(0, "String", { fg = "#bd8672" })

            -- Cambiar color de fondo general
            vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1e1e1e" })
            vim.api.nvim_set_hl(0, "Float", { bg = "#1e1e1e" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1e1e1e" })

            -- COMENTARIOS VERDES COMO VS CODE
            vim.api.nvim_set_hl(0, "Comment", { fg = "#6a9955", italic = true })
            vim.api.nvim_set_hl(0, "@comment", { fg = "#6a9955", italic = true })
            vim.api.nvim_set_hl(0, "SpecialComment", { fg = "#6a9955", italic = true })
            -- COLORES SUAVIZADOS (strings, constantes, números)
            -- Strings más suaves
            vim.api.nvim_set_hl(0, "String", { fg = "#bd8672" })
            vim.api.nvim_set_hl(0, "@string", { fg = "#bd8672" })
            vim.api.nvim_set_hl(0, "@string.escape", { fg = "#bd8672" }) -- Mantiene gold para escapes
            -- HIGHLIGHTS VISIBLES para mejor contraste
            vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3a4f" })
            vim.api.nvim_set_hl(0, "Search", { fg = "#191724", bg = "#524f67" })
            vim.api.nvim_set_hl(0, "IncSearch", { fg = "#191724", bg = "#f6c177" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2837" })

            -- Highlights adicionales para mejor visibilidad
            vim.api.nvim_set_hl(0, "MatchParen", { fg = "#f6c177", bg = "#3e3a4f", bold = true })
            vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#191724", bg = "#9ccfd8" })
        end
    },
    -- Iconos
    { "nvim-tree/nvim-web-devicons", lazy = true },

}
