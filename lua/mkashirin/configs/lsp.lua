local bind = require("mkashirin.remap").bind
local cmp = require("cmp")
local lsp_zero = require("lsp-zero")
local lint = require("lint")
local lspconfig = require("lspconfig")

-- This is where all the LSP shenanigans will live
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(_, bufnr)
  -- See :help lsp-zero-keybindings to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason-lspconfig").setup({
  ensure_installed = {
    "marksman", "tsserver", "pyright",
    "lua_ls", "ltex", "zls",
  },
  handlers = {
    lsp_zero.default_setup,

    -- Language servers
    marksman = function()
      lspconfig.marksman.setup({})
    end,
    lua_ls = function()
      lspconfig.lua_ls.setup({})
    end,
    pyright = function()
      lspconfig.pyright.setup({})
    end,
    tsserver = function()
      lspconfig.tsserver.setup({})
    end,
    zls = function()
      lspconfig.zls.setup({})
    end,
  }
})

lsp_zero.extend_cmp()
cmp.setup({ formatting = lsp_zero.cmp_format() })

-- Linting
require("lint").linters_by_ft = {
  markdown = { "vale" },
  -- python = { "flake8" }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
vim.diagnostic.config({ update_in_insert = true })

-- Formatting
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua
    },
    python = {
      require("formatter.filetypes.python").black,
      function ()
        return {
          exe = "black",
          args = { "--line-length", "79" },
        }
      end
    }
  }
})

-- Diagnostic  binds
bind("n", "<Leader>e", vim.diagnostic.open_float)
bind("n", "[d", vim.diagnostic.goto_prev)
bind("n", "]d", vim.diagnostic.goto_next)
bind("n", "<Leader>q", vim.diagnostic.setloclist)

-- Code actions, linting and formatting binds
bind("n", "<Leader>tl", function()
  lint.try_lint()
end)
bind("n", "<Leader>f", vim.cmd.FormatWrite)
