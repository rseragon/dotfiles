---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<CR>"] = {":nohlsearch<CR><CR>"},

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["H"] = {":bp<CR>"},
    ["L"] = {":bn<CR>"},
    ["D"] = {":lua require('nvchad.tabufline').close_buffer()<CR>"},
    ["<C-f>"] = {":Telescope find_files<CR>"},
    ["<C-g>"] = {":Telescope live_grep<CR>"},


    ["<C-\\>"] = {":lua require('nvterm.terminal').toggle 'horizontal'<CR>"},


    -- Trouble.nvim
    ["<leader>q"] = {"<cmd>TroubleToggle<cr>"},
    ["<leader>tt"] = {"<cmd>TroubleToggle<cr>"},
    ["<leader>tw"] = {"<cmd>TroubleToggle workspace_diagnostics<cr>"},
    ["<leader>td"] = {"<cmd>TroubleToggle document_diagnostics<cr>"},
    ["<leader>tq"] = {"<cmd>TroubleToggle quickfix<cr>"},
    ["<leader>tl"] = {"<cmd>TroubleToggle loclist<cr>"},
    ["gR"] = {"<cmd>TroubleToggle lsp_references<cr>"}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
