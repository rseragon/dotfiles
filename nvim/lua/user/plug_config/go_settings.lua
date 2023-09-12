status_ok, govim = pcall(require, 'go')

if not status_ok then
	return
end

govim.setup()

