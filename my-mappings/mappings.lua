local function closeWindowOrBuffer()
  local isOk, _ = pcall(vim.cmd, "close")

  if not isOk then vim.cmd "bd" end
end

return {
  n = {
    ["<M-w>"] = { function() closeWindowOrBuffer() end, desc = "Close current window/split" },
    ["<M-q>"] = { "<cmd>qa!<cr>", desc = "quit nvim" },

    -- Tab
    ["tx"] = { "<cmd>tabclose<cr>", desc = "close current tab" },
    ["tn"] = { "<cmd>tabnew<cr>", desc = "new tab" },
    ["tl"] = { "<cmd> tabnext <CR>", desc = "Tab Next" },
    ["th"] = { "<cmd> tabprevious <CR>", desc = "Tab Previous" },

    ["<leader>df"] = { "<cmd> DiffviewOpen <cr>", desc = "Open diffview" },
    ["<leader>dd"] = { "<cmd> DiffviewFileHistory %<cr>", desc = "diff current file" },

    ["<leader>wl"] = { "<cmd>vsplit<cr>", desc = "Split window vertically" },
    ["<leader>wo"] = { "<c-w>o", desc = "Maximize window" },
    ["<leader>wc"] = { "<c-w>c", desc = "Close window" },

    ["<leader>fm"] = { "<cmd>lua vim.lsp.buf.format { async = true } <cr>", desc = "Format" },


    ["s"] = {
      function()
        require("leap").leap {
          target_windows = vim.tbl_filter(
            function(win) return vim.api.nvim_win_get_config(win).focusable end,
            vim.api.nvim_tabpage_list_wins(0)
          ),
        }
      end,
    },


    -- find
    ["<leader>fe"] = { "<cmd>Neotree buffers<cr>", desc = "Find Recent files" },
    ["<leader>fl"] = { "<cmd>Neotree reveal<cr>", desc = "Reveal current file in file tree" },
    ["<leader>fE"] = { "<cmd>Telescope oldfiles<cr>", desc = "Find Recent files" },
    ["<leader>fd"] = {
      ':lua require("dir-telescope.features.find-in-dir").FileInDirectory({}) <CR>',
      desc = "Find in Directory",
    },
    ["<leader>gd"] = {
      ':lua require("dir-telescope.features.grep-in-dir").GrepInDirectory({}) <CR>',
      desc = "Grep in Directory",
    },
    ["<M-e>"] = { "<cmd>Telescope oldfiles<cr>", desc = "Find Recent files" },
    -- keymap is more like commands for me
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", desc = "Find commands/keymaps" },

    -- tree
    ["<C-n>"] = { "<cmd>Neotree toggle <CR>", desc = "toggle nvimtree" },
    ["<leader>e"] = { "<cmd>Neotree focus <CR>", desc = "focus nvimtree" },

    -- No
    ["<leader>nl"] = { "<cmd> nohl <CR>", desc = "nohl" },

    -- Show
    ["<leader>ss"] = { "<cmd>AerialToggle<CR>", desc = "Show outline" },
    ["<leader>sg"] = { "<cmd>Neotree git_status<cr>", desc = "Show git status" }
  }
}
