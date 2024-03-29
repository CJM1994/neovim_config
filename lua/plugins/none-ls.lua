return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    if type(opts.sources) == "table" then
      local null_ls = require("null-ls")
      vim.list_extend(opts.sources, {
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.diagnostics.terraform_validate,
      })
    end
    table.insert(opts.sources, require("typescript.extensions.null-ls.code-actions"))
  end,
}
