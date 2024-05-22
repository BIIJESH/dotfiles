-- local config = {
--     cmd = {vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls')},
--     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- }
-- require('jdtls').start_or_attach(config)

-- Ensure jdtls is available
local jdtls = require('jdtls')

-- Define the jdtls configuration
local config = {
    cmd = {vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls')},  -- Adjust the path if necessary
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),  -- Find the project root
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    },
}

-- Start or attach the jdtls server
jdtls.start_or_attach(config)
