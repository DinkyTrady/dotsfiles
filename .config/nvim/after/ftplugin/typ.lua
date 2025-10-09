local status, lspconf = pcall(require, "lspconfig")

if not status then
  return
end

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

lspconf["typ"].setup({
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable",
  },
  docs = {},
  capabilities = capabilites,
  on_attach = function(client, bufnr)
    vim.keymap.set("n", "<leader>tp", function()
      client:exec_cmd({

        title = "pin",

        command = "tinymist.pinMain",

        arguments = { vim.api.nvim_buf_get_name(0) },
      }, { bufnr = bufnr })
    end, { desc = "[T]inymist [P]in", noremap = true })

    vim.keymap.set("n", "<leader>tu", function()
      client:exec_cmd({

        title = "unpin",

        command = "tinymist.pinMain",

        arguments = { vim.v.null },
      }, { bufnr = bufnr })
    end, { desc = "[T]inymist [U]npin", noremap = true })
  end,
})
