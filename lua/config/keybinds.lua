-- Configuración del líder
vim.g.mapleader = ' ' -- Usa Espacio como líder
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opts = { noremap = true, silent = true } -- Evita recursividad y mensajes no deseados SALIR DE TODO
--CERRAR TODO
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("qa")
end, opts, { desc = "Salir de nvim" })

--GUARDAR ARCHIVO RÁPIDO
vim.keymap.set('n', '<leader>w', function()
    print("Guardando archivo...")
    vim.cmd.w()
    print("¡Guardado!")
end, opts, { desc = "Guardar cambios" })
-- Atajo: Espacio + w
vim.keymap.set("n", "n", "nzzzv", { desc = "buscar proximo y centrar" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "buscar anterior y centrar" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Media página abajo + centrar" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Media página arriba + centrar" })

--COPIAR/PEGAR AL PORTAPAPELES DEL SISTEMA
vim.keymap.set('v', '<leader>y', '"+y', opts, { desc = "Copiar al portapapeles" }) -- Copiar selección
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Pegar sobre texto sin afectar registros" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], {desc = "Eliminar lineas sin afectar lo copiado "})
-- CRTL + x PARA CORTAR
vim.keymap.set("n", "<C-x>", "dd", opts, { desc = "Cortar" })
-- SELECCIONAR TODO
vim.keymap.set("n", "<A-a>", "ggVG", opts) -- Alternar entre inicio (0) y final ($) de línea con la misma tecla (ej. <A-l>)
-- IR AL INICIO O FIN DE LA LINEA DINAMICAMENTE
vim.keymap.set('n', '<A-w>', function()
    local first_char = vim.fn.col('.') == 1 -- ¿Estás en la columna 1?
    if first_char then
        vim.cmd('normal! $')                -- Si ya estás al inicio, ve al final
    else
        vim.cmd('normal! 0')                -- Si no, ve al inicio
    end
end, { desc = 'Toggle inicio y fin de la linea' })

-- Versión para modo visual (selección)
vim.keymap.set('v', '<A-w>', function()
    local first_char = vim.fn.col('.') == 1
    if first_char then
        vim.cmd('normal! $')
    else
        vim.cmd('normal! 0')
    end
end, { desc = 'Visual inicio y fin de la linea' })

--MOVER ARRIBA O ABAJO LAS LINEAS
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--KEY PARA ESC
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<ESC>", { noremap = false })
vim.keymap.set("i", "jk", "<ESC>", { noremap = false })

vim.keymap.set("n", "<leader><leader>", function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local ext = buf_name:match("^.+(%..+)$") or ""

    local valid_exts = { ".vim", ".vimrc", ".lua" }

    local can_source = false
    for _, v in ipairs(valid_exts) do
        if ext == v then
            can_source = true
            break
        end
    end

    if can_source then
        vim.cmd("so")
        print("Source ejecutado correctamente.")
    end
end, { desc = "Source solo archivos compatibles" })
--REEMPLAZO INTELIGENTE
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- UNE LA LINEA SIGUIENTE A LA ANTERIOR
vim.keymap.set("n", "J", "mzJz", {desc = "Unir la currentLine con la sgte"})
-- IDENTACION SIMPLE
vim.keymap.set("n", "=ap", "ma=ap'a", {desc ="Identacion simple"})
--INDENTACION MEJORADA
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
--plugin undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "toogle undotree"})
--OIL explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Explorador" })
