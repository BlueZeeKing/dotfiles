local config = {
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "~/java/amazon-corretto-21.jdk/Contents/Home",
					},
					{
						name = "JavaSE-17",
						path = "~/java/amazon-corretto-17.jdk/Contents/Home",
					},
					{
						name = "JavaSE-11",
						path = "~/java/amazon-corretto-11.jdk/Contents/Home",
					},
					{
						name = "JavaSE-8",
						path = "~/java/amazon-corretto-8.jdk/Contents/Home",
					},
				},
			},
		},
	},
}

require("jdtls").start_or_attach(config)
