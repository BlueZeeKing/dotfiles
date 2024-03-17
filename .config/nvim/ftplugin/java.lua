local config = {
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/Users/braydenzee/wpilib/2024/jdk/",
					},
					{
						name = "JavaSE-11",
						path = "/Users/braydenzee/wpilib/2023/jdk/",
					},
				},
			},
		},
	},
}

require("jdtls").start_or_attach(config)
