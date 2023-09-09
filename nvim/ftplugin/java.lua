local path
if vim.fn.has("mac") == 1 then
    path = '/Users/laureanray.bahala'
elseif vim.fn.has("unix") == 1 then
    path = '/home/lr'
else
  print("Unsupported system for sumneko")
end
local config = {
    cmd = { path .. '/.local/lib/jdtls/bin/jdtls'
    },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    settings = {
        java = {
        }
    },
    init_options = {
        bundles = {}
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
