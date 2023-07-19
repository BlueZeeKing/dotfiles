require("lualine").setup {
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', {'diagnostics', symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' }}},
		lualine_c = {'filename'},
		lualine_x = {
            {
                'tabs',
                mode = 3,

                fmt = function(name, context)
                    -- Show + if buffer is modified in tab
                    local buflist = vim.fn.tabpagebuflist(context.tabnr)
                    local winnr = vim.fn.tabpagewinnr(context.tabnr)
                    local bufnr = buflist[winnr]
                    local mod = vim.fn.getbufvar(bufnr, '&mod')

                    return name .. (mod == 1 and ' +' or '')
                end
            }
        },
		lualine_y = {'encoding', 'filetype'},
		lualine_z = {'location'}
	},
	extensions = {
		'nvim-tree'
	},
}
