local async = require("blueish.async")

local filetypes = {
	angular = { "htmlangular" },
	bash = { "sh" },
	bibtex = { "bib" },
	c_sharp = { "cs", "csharp" },
	commonlisp = { "lisp" },
	cooklang = { "cook" },
	devicetree = { "dts" },
	diff = { "gitdiff" },
	eex = { "eelixir" },
	elixir = { "ex" },
	embedded_template = { "eruby" },
	erlang = { "erl" },
	facility = { "fsd" },
	faust = { "dsp" },
	gdshader = { "gdshaderinc" },
	git_config = { "gitconfig" },
	git_rebase = { "gitrebase" },
	glimmer = { "handlebars", "html.handlebars" },
	godot_resource = { "gdresource" },
	haskell = { "hs" },
	haskell_persistent = { "haskellpersistent" },
	idris = { "idris2" },
	ini = { "confini", "dosini" },
	janet_simple = { "janet" },
	javascript = { "javascriptreact", "ecma", "ecmascript", "jsx", "js" },
	json = { "jsonc" },
	glimmer_javascript = { "javascript.glimmer" },
	latex = { "tex" },
	linkerscript = { "ld" },
	m68k = { "asm68k" },
	make = { "automake" },
	markdown = { "pandoc" },
	muttrc = { "neomuttrc" },
	ocaml_interface = { "ocamlinterface" },
	perl = { "pl" },
	poe_filter = { "poefilter" },
	powershell = { "ps1" },
	properties = { "jproperties" },
	python = { "py", "gyp" },
	qmljs = { "qml" },
	runescript = { "clientscript" },
	scala = { "sbt" },
	slang = { "shaderslang" },
	sqp = { "mysqp" },
	ssh_config = { "sshconfig" },
	starlark = { "bzl" },
	surface = { "sface" },
	systemverilog = { "verilog" },
	t32 = { "trace32" },
	tcl = { "expect" },
	terraform = { "terraform-vars" },
	textproto = { "pbtxt" },
	tlaplus = { "tla" },
	typescript = { "ts", "typescriptreact", "typescript.tsx" },
	glimmer_typescript = { "typescript.glimmer" },
	typst = { "typ" },
	udev = { "udevrules" },
	uxntal = { "tal", "uxn" },
	v = { "vlang" },
	vhs = { "tape" },
	xml = { "xsd", "xslt", "svg" },
	xresources = { "xdefaults" },
}

for lang, ft in pairs(filetypes) do
	vim.treesitter.language.register(lang, ft)
end

local parsers
local dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site")
local query_dir = vim.fs.joinpath(dir, "queries")
local parser_dir = vim.fs.joinpath(dir, "parser")
if not vim.uv.fs_stat(parser_dir) then
	vim.fn.mkdir(parser_dir, "p")
end

if not vim.uv.fs_stat(query_dir) then
	local temp_dir = vim.uv.os_tmpdir()
	vim.schedule(function()
		vim.notify("Copying nvim treesiter queries")
	end)
	async.async_run(function()
		local success, _, code = async.exec_async("git", {
			args = { "clone", "https://github.com/nvim-treesitter/nvim-treesitter" },
			cwd = temp_dir,
		})
		if not success then
			vim.schedule(function()
				vim.notify(
					"Failed to copy treesitter queries (clone phase): " .. (code or "git not found"),
					vim.log.levels.ERROR
				)
			end)
			return
		end

		success, _, code = async.exec_async(
			"cp",
			{ args = { "-r", vim.fs.joinpath(temp_dir, "nvim-treesitter", "runtime", "queries"), dir } }
		)
		if success then
			vim.schedule(function()
				vim.notify("Finished copying nvim treesiter queries")
			end)
		else
			vim.schedule(function()
				vim.notify(
					"Failed to copy treesitter queries (clone phase): " .. (code or "git not found"),
					vim.log.levels.ERROR
				)
			end)
		end
	end)
end

local function install_parser(buf, parser)
	local success, raw_output, code = async.exec_async("nix", {
		args = { "build", "nixpkgs#tree-sitter-grammars.tree-sitter-" .. parser, "--no-link", "--json" },
		stdout = true,
	})

	if not success then
		vim.schedule(function()
			vim.notify(
				"Failed to install treesitter parser (install phase): " .. (code or "nix not found"),
				vim.log.levels.ERROR
			)
		end)
		return
	end

	local output = vim.json.decode(raw_output.stdout)
	local build_dir = output[1].outputs.out
	local symlink_success, err = async.symlink(
		vim.fs.joinpath(build_dir, "parser"),
		vim.fs.joinpath(parser_dir, parser .. ".so"),
		{ force = true }
	)
	vim.schedule(function()
		if symlink_success then
			vim.treesitter.start(buf, parser)
			vim.notify("Installed " .. parser)
		else
			vim.notify("Failed to install treesitter parser (symlink phase): " .. err, vim.log.levels.ERROR)
		end
	end)
end

local function try_install_parser(buf, parser)
	if parsers[parser] then
		install_parser(buf, parser)
	end
end

local function get_parsers()
	local success, raw_output, code =
		async.exec_async("nix", { args = { "search", "nixpkgs#tree-sitter-grammars", ".*", "--json" }, stdout = true })
	if not success then
		parsers = {}
		vim.schedule(function()
			vim.notify("Failed to query nix grammar list: " .. (code or "nix not found"), vim.log.levels.ERROR)
		end)
		return
	end

	local output = vim.json.decode(raw_output.stdout)

	parsers = {}
	for _, value in pairs(output) do
		parsers[value.pname:match("tree%-sitter%-(.*)")] = true
	end
end

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local buf, filetype = args.buf, args.match

		local language = vim.treesitter.language.get_lang(filetype)
		if not language then
			return
		end

		if vim.treesitter.language.add(language) then
			vim.treesitter.start(buf, language)
			return
		end

		async.async_run(function()
			if parsers == nil then
				get_parsers()
			end
			try_install_parser(buf, language)
		end)
	end,
})
