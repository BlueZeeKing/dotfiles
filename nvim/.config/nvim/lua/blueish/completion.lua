--- @module 'blink.cmp'
--- @class blink.cmp.Source
local source = {}

-- `opts` table comes from `sources.providers.your_provider.opts`
-- You may also accept a second argument `config`, to get the full
-- `sources.providers.your_provider` table
function source.new(opts)
	local self = setmetatable({}, { __index = source })
	self.opts = opts
	return self
end

-- (Optional) Enable the source in specific contexts only
function source:enabled()
	return vim.bo.filetype == "gitcommit"
end

-- (Optional) Non-alphanumeric characters that trigger the source
function source:get_trigger_characters()
	return { "#" }
end

function return_completions(callback)
	local items = {}
	for index, issue in ipairs(source["result"]) do
		local item = {
			label = "#" .. issue["number"] .. " - " .. issue["title"],
			kind = require("blink.cmp.types").CompletionItemKind.Text,

			insertText = "#" .. issue["number"],

			documentation = {
				kind = "markdown",
				value = "# " .. issue["title"] .. "\n\n" .. issue["body"],
			},
			insertTextFormat = vim.lsp.protocol.InsertTextFormat.PlainText,
		}
		table.insert(items, item)
	end

	callback({
		items = items,
		is_incomplete_backward = false,
		is_incomplete_forward = false,
	})
end

function source:get_completions(ctx, callback)
	if source["result"] == nil then
		local job = vim.system(
			{ "gh", "issue", "list", "--json", "number,title,body" },
			{ text = true },
			function(raw_output)
				source["result"] = vim.json.decode(raw_output["stdout"])
				return_completions(callback)
			end
		)

		return function()
			job:kill("sigint")
		end
	else
		return_completions(callback)
		return function() end
	end
end

-- Called immediately after applying the item's textEdit/insertText
function source:execute(ctx, item, callback, default_implementation)
	-- By default, your source must handle the execution of the item itself,
	-- but you may use the default implementation at any time
	default_implementation()

	-- The callback _MUST_ be called once
	callback()
end

return source
