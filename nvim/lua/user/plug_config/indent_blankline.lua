local status_ok, iblank = pcall(require, 'ibl')

if not status_ok then
    vim.notify("Failed to load indent-blankline")
    return
end


iblank.setup {


}
