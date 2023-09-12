status_ok, lens = pcall(require, "session-lens")

if not status_ok then
	return
end

lens.setup {
	path_display = {'shorten'},
	theme_conf = { border = true },
	previewer = true,
	prompt_title = 'Sessions!',

} 
