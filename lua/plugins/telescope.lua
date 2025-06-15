-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    -- Archivos y texto
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Archivos recientes" },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Buscar texto (grep interactivo)"
    },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buscar buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buscar ayuda" },

    -- Git
    { "<leader>fs", "<cmd>Telescope git_files<cr>", desc = "Buscar archivos Git" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits del repo" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Ramas de Git" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "%.git/" },
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        sorting_strategy = "descending",
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
      },
      pickers = {
        find_files = { hidden = true },
        oldfiles = { only_cwd = true },
      },
    })
  end,
}

