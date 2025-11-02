-- 1. 准备lazy.nvim模块（存在性检测）
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
-- 
-- 2. 将 lazypath 设置为运行时路径
-- rtp（runtime path）
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
-- 否则，下面 require("lazy") 是找不到的
vim.opt.rtp:prepend(lazypath)

-- 3. 加载lazy.nvim模块
require("lazy").setup({
    {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- 配置选项
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    -- install with yarn or npm
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},    


    {'iamcco/mathjax-support-for-mkdp'},
    -- 状态栏
    { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" }, lazy = false },
    -- 状态栏配置

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "onedark",
                    section_separators = { left = " ", right = " " },
                    component_separators = { left = " ", right = " " },
                },
            })
        end,
    },

{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
},

    --lazygit
    { "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" }, lazy = false },
    -- 快捷键
    {
        "kdheepak/lazygit.nvim",
        config = function()
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", opts)
        end,
    },

    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},


    -- telescope
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, lazy = false },
    -- telescope配置
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = { mirror = false },
                        vertical = { mirror = false },
                    },
                },
            })
        end,
    },
    -- treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false },

    -- treesitter配置
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "cpp", "c", "rust"},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },



    -- mason.nvim 和 mason-lspconfig.nvim 插件的配置
    {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    lazy = false,
    config = function()
        -- 先设置 Mason
        require("mason").setup()
    end,
    },

    -- nvim-lspconfig 插件的配置
    {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        -- 自动安装和配置 LSP 服务器
        mason_lspconfig.setup({
            ensure_installed = { "clangd", "rust_analyzer" , "lua_ls"},
        })

    end,
    },


    {'majutsushi/tagbar'},

    -- cmp
    { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp" }, lazy = false },
    -- cmp依赖
    { "hrsh7th/cmp-nvim-lsp", lazy = false },
    { "hrsh7th/cmp-buffer", lazy = false },
    { "hrsh7th/cmp-path", lazy = false },
    { "hrsh7th/cmp-cmdline", lazy = false },
    { "hrsh7th/vim-vsnip", lazy = false },
    { "hrsh7th/cmp-vsnip", lazy = false },

    -- cmp配置
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<Tab>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                },
                sources = {
                    { name = "nvim_lsp" },
                },

                
            })


        end,
    },

    -- autopairs
    { "windwp/nvim-autopairs", lazy = false },
    -- autopairs配置
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    -- nerd-tree
    { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" }, lazy = false },
    -- nerd-tree快捷键启动

    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 20,
                    side = "left",
                },
                filters = {
                    dotfiles = false,
                },
            })
        end,
    },
    
    -- 浮动终端
    { "akinsho/toggleterm.nvim", version = "*", lazy = false },
    -- 浮动终端配置
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "float",
                float_opts = {
                    border = "curved",
                    width = 100,
                    height = 20,
                },
                shell = "bash",
            })
        end,
    },
  
    {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},
})

