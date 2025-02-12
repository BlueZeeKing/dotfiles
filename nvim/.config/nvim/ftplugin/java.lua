local config = {
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk/",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk/",
					},
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk/",
					},
					{
						name = "JavaSE-1.8",
						path = "/usr/lib/jvm/java-8-openjdk/",
					},
				},
			},
		},
	},
}

require("jdtls").start_or_attach(config)
