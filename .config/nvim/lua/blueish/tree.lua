local function open_buf()
    local function log(value)
        io.popen('echo "' .. value .. '\n" >> "/Users/braydenzee/test.log"')
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'acwrite')
    vim.api.nvim_buf_set_name(buf, 'file-browser')

    local window
    local confirmopen = false

    vim.api.nvim_create_autocmd("BufWriteCmd", {
        buffer = buf,
        callback = function(data)
            if confirmopen then
                return
            end

            confirmopen = true

            local buf_data = vim.api.nvim_buf_get_lines(buf, 0, -1, false);
            local file = io.popen('file-browser --path "' ..
                vim.loop.cwd() .. '" --after "' ..
                table.concat(buf_data, "\n") .. '" write')

            local lines = {}

            for line in file:lines() do
                table.insert(lines, line)
            end

            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

            vim.keymap.set("n", "<Return>", function()
                vim.api.nvim_win_close(window, false)
                vim.api.nvim_buf_delete(buf, {
                    force = true
                })
                io.popen('file-browser --path "' ..
                    vim.loop.cwd() .. '" --after "' ..
                    table.concat(buf_data, "\n") .. '" --confirm write')
            end, { buffer = buf })

            vim.keymap.set("n", "<Esc>", function()
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, buf_data)
            end, { buffer = buf })
        end,
    })

    local file = io.popen('file-browser --path "' .. vim.loop.cwd() .. '" read')

    local lines = {}

    for line in file:lines() do
        table.insert(lines, line)
    end

    vim.api.nvim_buf_set_lines(buf, 0, 1, false, lines)

    window = vim.api.nvim_open_win(buf, true, {
        relative = 'win',
        row = 3,
        col = 3,
        width = 100,
        height = 30,
        border = "rounded"
    })
end

vim.keymap.set("n", "<leader>te", open_buf)
