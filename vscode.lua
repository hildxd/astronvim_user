-- ===============插件管理===============
-- 插件安装的话 使用原生的 neovim 来安装
-- 在这里只是用来导入
local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 你的插件列表...
    use {
      'ggandor/leap.nvim',
      config = function() require('leap').add_default_mappings() end
    }
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'mg979/vim-visual-multi'
    use 'michaeljsmith/vim-indent-object'
    use 'wellle/targets.vim'
    use 'easymotion/vim-easymotion'
    use { "folke/which-key.nvim" }
  end,
})

-- ===============basic 设置===============
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.mouse = "a"


-- ===============快捷键的设置===============
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local opt = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Mutli Cursors Binds
-- 必须要放到最上面 不然后影响 normal 的映射  算是 vscode/ neovim  的 bug
cmd([[
let g:VM_maps = {}
let g:VM_maps['Find Under']         = "gb"
let g:VM_maps['Find Subword Under'] = "gb"
let g:VM_maps['Select l'] = 0
let g:VM_maps['Select h'] = 0
]])

-- =============== plugin ===============
map('', '<leader>', '<Plug>(easymotion-prefix)', opt)
map('', '<leader>l', '<Plug>(easymotion-lineforward)', opt)
map('', '<leader>h', '<Plug>(easymotion-linebackward)', opt)

-- ===============normal===============
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("n", "H", "^", opt)
map("n", "L", "g_", opt)
map("n", "<leader>u", '~', opt)
-- 选中一个 {}
map("n", "<leader>s", "V$%", opt)
-- 格式化代码
map("n", '<leader>df', "<Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", opt)
-- 删除一个函数
map("n", '<leader>dj', "<Cmd>call VSCodeNotify('delete-function.deleteFunction')<CR>", opt)
-- 创建一个文件
map("n", '<leader>nf', "<Cmd>call VSCodeNotify('explorer.newFile')<CR>", opt)
-- 创建一个文件夹
map("n", '<leader>nd', "<Cmd>call VSCodeNotify('explorer.newFolder')<CR>", opt)
-- 重命名
map("n", '<leader>rn', "<Cmd>call VSCodeNotify('abracadabra.renameSymbol')<CR>", opt)

-- ===============visual===============
map("v", "J", "5j", opt)
map("v", "K", "5k", opt)
map("v", "H", "^", opt)
map("v", "L", "g_", opt)
-- 格式化选中的代码块
map("v", '<leader>df', "<Cmd>call VSCodeNotify('editor.action.formatSelection')<CR>", opt)

-- ===============operatorPending===============
map("o", "H", "^", opt)
map("o", "L", "g_", opt)
