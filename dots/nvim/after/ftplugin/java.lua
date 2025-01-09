local status, jdtls = pcall(require, "jdtls")

if not status then
  return
end

local jdtls_path = os.getenv("JDTLS")
local config_dir = vim.fn.expand("~/.cache/jdtls/config")
local data_dir = vim.fn.expand("~/.cache/jdtls/workspace/") .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local lombok = os.getenv("LOMBOK") .. "/share/java/lombok.jar"

local capabilites = vim.lsp.protocol.make_client_capabilities()
capabilites.textDocument.completion.completionItem = {
  snippetSupport = true,
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- capabilites = require("cmp_nvim_lsp").default_capabilities(capabilites)
capabilites = require("blink-cmp").get_lsp_capabilities()

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    jdtls_path .. "/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
    "-configuration",
    config_dir,
    "-data",
    data_dir,
    -- "-javaagent",
    -- lombok,
  },

  root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
  settings = {
    java = {},
  },
  capabilites = capabilites,
  -- capabilites = require("cmp_nvim_lsp").default_capabilities(capabilites),
  -- not using it for now since it need other plugin
  -- init_options = {
  --   bundles = {}
  -- }
}

jdtls.start_or_attach(config)
