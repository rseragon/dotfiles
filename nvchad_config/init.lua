-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.cmd [[
  set nowrap
  set relativenumber
  set number
  set mouse+=a
  set ignorecase
  set smartcase
  set smartindent
  set cursorline
  set cursorcolumn

  set undofile

  " To remove the underline
  set guicursor=
]]
