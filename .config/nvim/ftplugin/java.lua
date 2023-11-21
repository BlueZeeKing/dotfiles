local config = {
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "FRC-11",
						path = "/Users/braydenzee/wpilib/2023/jdk",
					},
					{
						name = "Java-21",
						path = "/Users/braydenzee/amazon-corretto-21.jdk/Contents/Home",
					},
				},
			},
		},
	},
}

require("jdtls").start_or_attach(config)

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
