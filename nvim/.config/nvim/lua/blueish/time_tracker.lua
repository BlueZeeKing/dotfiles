local entered = false

local exit = function()
	vim.notify("Exited neovim")
end

local enter = function()
	vim.notify("Entered neovim")
end

local exit_wrapper = function()
	if entered then
		entered = false
		exit()
	end
end

local enter_wrapper = function()
	if not entered then
		entered = true
		enter()
	end
end

enter_wrapper()

local autocommand_group = vim.api.nvim_create_augroup("TimeTracker", {})

vim.api.nvim_create_autocmd("VimLeave", {
	group = autocommand_group,
	callback = function(ev)
		exit_wrapper()
	end,
})

local focus_timer = vim.uv.new_timer()

vim.api.nvim_create_autocmd("FocusLost", {
	group = autocommand_group,
	callback = function(ev)
		focus_timer:start(
			30000,
			0,
			vim.schedule_wrap(function()
				exit_wrapper()
			end)
		)
	end,
})

vim.api.nvim_create_autocmd("FocusGained", {
	group = autocommand_group,
	callback = function(ev)
		if focus_timer:get_due_in() == 0 then
			enter_wrapper()
		else
			focus_timer:stop()
		end
	end,
})

local activity_timer = vim.uv.new_timer()
activity_timer:start(
	1000 * 60 * 15,
	0,
	vim.schedule_wrap(function()
		exit_wrapper()
	end)
)

vim.api.nvim_create_autocmd({
	"CursorMoved",
	"CursorMovedI",
	"TextChanged",
	"TextChangedI",
	"TextChangedP",
	"TextChangedT",
	"TextYankPost",
	"ModeChanged",
}, {
	group = autocommand_group,
	callback = function(ev)
		if activity_timer:get_due_in() == 0 then
			enter_wrapper()
		else
			activity_timer:stop()
		end

		activity_timer:start(
			1000 * 60 * 15,
			0,
			vim.schedule_wrap(function()
				exit_wrapper()
			end)
		)
	end,
})
