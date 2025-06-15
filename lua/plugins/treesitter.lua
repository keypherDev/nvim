return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                -- Lenguajes
                ensure_installed = {
                    "lua", "javascript", "query", "typescript", "php", "go", "python", "html", "css", "json", "bash",
                    "dockerfile", "yaml", "toml", "markdown",
                },

                -- Instalación automática al abrir un archivo, requiere treesitter cli
                auto_install = false,

                -- Habilita el resalto
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                -- Indentación mejorada
                indent = {
                    enable = true,
                    disable = { "yaml" }, -- YAML puede dar problemas con indentación
                },
                -- Colores para niveles por ejemplo ((()))
            })
        end
    }
}
