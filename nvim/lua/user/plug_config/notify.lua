local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup {
	background_colour =  "#000000";
	top_down = false;
}

-- notify("Foo bar test notification")

vim.notify = notify -- Cuite uwuite notifs :D

