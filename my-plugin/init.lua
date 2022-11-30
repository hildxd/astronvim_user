local actions = require "telescope.actions"
local M = {
  init = {
    -- You can disable default plugins as follows:
    ["goolord/alpha-nvim"] = { disable = true },
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
    -- function args highlight
    ["m-demare/hlargs.nvim"] = {
      config = function() require("hlargs").setup() end,
    },
    -- two char to anywhere
    { "ggandor/leap.nvim" },
    ["nvim-zh/auto-save.nvim"] = {},
    -- 折叠插件
    -- ["kevinhwang91/nvim-ufo"] = {
    --   requires = "kevinhwang91/promise-async",
    --   config = function() require "user.my-plugin.nvim-ufo" end,
    -- },
    ["princejoogie/dir-telescope.nvim"] = {
      requires = "nvim-telescope/telescope.nvim",
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
      end,
    }
  },
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
  treesitter = require "user.my-plugin.treesitter",
  -- use mason-lspconfig to configure LSP installations
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    ensure_installed = { "sumneko_lua" },
  },
  -- use mason-tool-installer to configure DAP/Formatters/Linter installation
  ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
    ensure_installed = { "prettier", "stylua" },
  },
  ["telescope"] = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
    },
  },
  ["aerial"] = {
    keymaps = {
      ["O"] = "actions.tree_open_all",
      ["X"] = "actions.tree_close_all",
      ["o"] = "actions.jump",
    },
  },
}
return M
