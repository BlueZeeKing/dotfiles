local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', 'mvnw' }, { upward = true })[1]),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "FRC-11",
                        path = "/Users/braydenzee/wpilib/2023/jdk/"
                    }
                }
            }
        }
    }
}
require('jdtls').start_or_attach(config)
