-- Configuración del líder
vim.g.mapleader = ' '                          -- Usa Espacio como líder
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opts = { noremap = true, silent = true } -- Evita recursividad y mensajes no deseados

--GUARDAR ARCHIVO RÁPIDO
vim.keymap.set('n', '<leader>w', function()
    print("Guardando archivo...")
    vim.cmd.w()
    print("¡Guardado!")
end, opts)
-- Atajo: Espacio + w
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Media página abajo + centrar" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Media página arriba + centrar" })

--COPIAR/PEGAR AL PORTAPAPELES DEL SISTEMA
vim.keymap.set('v', '<leader>y', '"+y', opts) -- Copiar selección
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Atajos: Espacio + y (modo visual) | Espacio + p (modo normal)

-- EXPLORADOR DE ARCHIVOS (netrw)
-- vim.keymap.set('n', '<leader>e', vim.cmd.Ex, opts) -- Abrir explorador

--MOVER ARRIBA O ABAJO LAS LINEAS
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<ESC>", {noremap = false})
vim.keymap.set("i", "jk", "<ESC>", {noremap = false})

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
end, { desc = "Source solo archivos compatibles"})
--REEMPLAZO INTELIGENTE
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- UNE LA LINEA SIGUIENTE A LA ANTERIOR
vim.keymap.set("n", "J", "mzJz")
-- IDENTACION SIMPLE
vim.keymap.set("n", "=ap", "ma=ap'a")
--INDENTACION MEJORADA
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
--plugin undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

