local M = {}

---@class ExecOpts
---@field args string[]
---@field stdout boolean?
---@field stderr boolean?
---@field cwd string?
---
---@class ExecOutput
---@field stdout string?
---@field stderr string?

---@param command string
---@param opts ExecOpts
---@param on_success fun(output: ExecOutput)
---@param on_failure fun(code?: integer, output: ExecOutput)
---@return boolean
function M.exec(command, opts, on_success, on_failure)
	local stdout
	if opts.stdout then
		stdout = vim.uv.new_pipe()
	end

	local stderr
	if opts.stderr then
		stderr = vim.uv.new_pipe()
	end

	---@type ExecOutput
	local output = {}
	local failed = true

	local result = vim.uv.spawn(
		command,
		{ stdio = { nil, stdout, stderr }, args = opts.args, cwd = opts.cwd },
		function(code, signal)
			if code ~= 0 then
				on_failure(code, output)
			elseif code == 0 and (output.stdout or not opts.stdout) and (output.stderr or not opts.stderr) then
				on_success(output)
			end
		end
	)

	if result == nil then
		return false
	end

	if opts.stdout then
		local stdout_str = ""
		vim.uv.read_start(stdout, function(err, data)
			assert(not err, err)
			if data then
				stdout_str = stdout_str .. data
			else
				output.stdout = stdout_str
				if (output.stdout or not opts.stdout) and (output.stderr or not opts.stderr) and not failed then
					on_success(output)
				end
			end
		end)
	end
	if opts.stderr then
		local stderr_str = ""
		vim.uv.read_start(stderr, function(err, data)
			assert(not err, err)
			if data then
				stderr_str = stderr_str .. data
			else
				output.stderr = stderr_str
				if (output.stdout or not opts.stdout) and (output.stderr or not opts.stderr) and not failed then
					on_success(output)
				end
			end
		end)
	end

	return true
end

---@param command string
---@param opts ExecOpts
---@return boolean, ExecOutput, integer?
function M.exec_async(command, opts)
	local current = coroutine.running()
	local command_exists = M.exec(command, opts, function(output)
		coroutine.resume(current, true, output, nil)
	end, function(code, output)
		coroutine.resume(current, false, output, code)
	end)

	if command_exists then
		return coroutine.yield()
	else
		return false, {}, nil
	end
end

function M.async_run(cb)
	local co = coroutine.create(cb)
	coroutine.resume(co)
end

---@param path string
---@return uv.fs_stat.result?, string?
function M.stat(path)
	local current = coroutine.running()
	vim.uv.fs_stat(path, function(err, stat)
		coroutine.resume(current, stat, err)
	end)
	return coroutine.yield()
end

---@param path string
---@return uv.fs_stat.result?, string?
function M.lstat(path)
	local current = coroutine.running()
	vim.uv.fs_lstat(path, function(err, stat)
		coroutine.resume(current, stat, err)
	end)
	return coroutine.yield()
end

---@param path string
---@return boolean?, string?
function M.unlink(path)
	local current = coroutine.running()
	vim.uv.fs_unlink(path, function(err, success)
		coroutine.resume(current, success, err)
	end)
	return coroutine.yield()
end

---@class SymlinkOpts
---@field force boolean

---@return boolean?, string?
local function symlink_raw(path, new_path)
	local current = coroutine.running()
	vim.uv.fs_symlink(path, new_path, function(err, success)
		coroutine.resume(current, success, err)
	end)
	return coroutine.yield()
end

---@param path string
---@param new_path string
---@param opts SymlinkOpts
---@return boolean?, string?
function M.symlink(path, new_path, opts)
	local success, err = symlink_raw(path, new_path)

	if err ~= nil and err:sub(1, ("EEXIST"):len()) == "EEXIST" and opts.force then
		success, err = M.unlink(new_path)
		if err then
			return success, err
		end
		success, err = symlink_raw(path, new_path)
	end

	return success, err
end

return M
