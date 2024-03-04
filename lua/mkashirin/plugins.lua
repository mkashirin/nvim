return {
  -- Rose-pine color theme
  {
    "rose-pine/neovim",
    config = function ()
      require("rose-pine").setup({
        styles = { italic = false }
      })
      vim.cmd("colorscheme rose-pine")
    end
  },

  -- AST
  { "nvim-treesitter/nvim-treesitter", name = "treesitter" },

  -- Navigation
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  -- Better experience
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it"s keybinding:
      { "<leader>u", "<cmd>lua require(\"undotree\").toggle()<cr>" },
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  { "xiyaowong/transparent.nvim" },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("lualine").setup({
        options = { theme = "rose-pine" }
      })
    end
  },

  -- Language server protocol
  {
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v3.x",
      lazy = true,
      config = false,
      init = function()
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
      end,
    },
    {
      "williamboman/mason.nvim",
      lazy = false,
      config = true,
    },

    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        { "L3MON4D3/LuaSnip" },
      },
    },

    -- LSP config
    {
      "neovim/nvim-lspconfig",
      cmd = { "LspInfo", "LspInstall", "LspStart "},
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason-lspconfig.nvim" },
      },
    },

    -- Linters
    { "mfussenegger/nvim-lint" },

    -- Formatters
    { "mhartington/formatter.nvim" }
  },

  -- Live execution
  { "rhysd/reply.vim" },

    -- Refactoring features
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
        require("refactoring").setup()
    end,
  },
}
