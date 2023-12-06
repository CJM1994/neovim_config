return {
  "neovim/nvim-lspconfig",
  dependencies = { "jose-elias-alvarez/typescript.nvim" },
  opts = {
    -- make sure mason installs the server
    servers = {
      tsserver = {
        keys = {
          { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
          { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
        },
        settings = {
          typescript = {
            format = {
              indentSize = vim.o.shiftwidth, -- 4 to match Rocky
              convertTabsToSpaces = vim.o.expandtab, -- true to match Rocky
              tabSize = vim.o.tabstop, -- 4 to match Rocky
            },
          },
          javascript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      },

      tailwindcss = {
        filetypes_exclude = { "markdown" },
      },

      terraformls = {},
    },
    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,

      tailwindcss = function(_, opts)
        local tw = require("lspconfig.server_configurations.tailwindcss")
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, tw.default_config.filetypes)
      end,
    },

    eslint = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(event)
          if not require("lazyvim.plugins.lsp.format").enabled() then
            -- exit early if autoformat is not enabled
            return
          end

          local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
          if client then
            local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
            if #diag > 0 then
              vim.cmd("EslintFixAll")
            end
          end
        end,
      })
    end,
  },
}
