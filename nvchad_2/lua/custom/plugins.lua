local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        -- "pyflakes",
        -- "pylint",
        "mypy",
        "ruff",
        "black",
        "typescript-language-server",
        "clangd",
        "clang-format",
        "gopls",
        "css-lsp"
      }
    }
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    'tpope/vim-fugitive',
    event = "VeryLazy",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    ft = {"python","go"},
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function ()
      require "custom.configs.nvimtree"
    end
  },
  {
    "MunifTanjim/prettier.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.prettier"
    end
  },
  {
    "maxmellon/vim-jsx-pretty",
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag" ,
    event = "VeryLazy",
  },
  -- {
  --   "SirVer/ultisnips",
  --   event = "VeryLazy"
  -- },
  {
      "mlaursen/vim-react-snippets",
      event = "VeryLazy"
  },
  { "folke/neodev.nvim", opts = {} },
  {"justinmk/vim-sneak",
  event = "VeryLazy"
  },
  {
      "RRethy/vim-illuminate",
      event="VeryLazy"
  },
  {
      "xiyaowong/transparent.nvim",
      event="VeryLazy"
  },
  -- {
  --       "hrsh7th/nvim-cmp",
  --     event="VeryLazy",
  --       opts = {
  --           sources = {
  --               -- other sources
  --               {
  --                   name = "html-css",
  --                   option = {
  --                       -- require "custom.configs.html-css"
  --                       -- your configuration here
  --                   },
  --               },
  --           },
  --       },
  --   },
  --   { "Jezda1337/nvim-html-css",
  --       event="VeryLazy",
  --       dependencies = {
  --           "nvim-treesitter/nvim-treesitter",
  --           "nvim-lua/plenary.nvim"
  --       },
  --       config = function()
  --           require("html-css").setup()
  --       end
  --   }

}

return plugins
