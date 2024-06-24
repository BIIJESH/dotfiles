local lsp = require("plugins.lspconfig")
local capabilities = require("plugins.lspconfig").capabilities

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  cmd = {
    "/usr/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-noverify",
    "-Xms1G",
    "-jar",
    "/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.300.v20210813-1054.jar",
    "-configuration",
    "/home/Java/myapp/",
    "-data",
    "/home/dnehrig/code/work/" .. workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root({ ".git", "pom.xml" }),
  on_attach = function(client, bufnr)
    lsp:on_attach(client, bufnr)
  end,
}
require("jdtls").start_or_attach(config)
