local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mohit.lsp.lsp-server-setup")
require("mohit.lsp.utils").setup_diagnostics()
require("mohit.lsp.utils").update_appearance()
require("mohit.lsp.null-ls")
