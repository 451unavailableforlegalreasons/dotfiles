require('packer').startup( function(use)
	use 'wbthomason/packer.nvim'  -- leave this line otherwise packer will delete itself





    -- colorshcemes 
	use 'navarasu/onedark.nvim'
    use 'tanvirtin/monokai.nvim'



    -- apperance plugins
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use ('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})


    -- navigation plugins
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.2',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use ('theprimeagen/harpoon')








    -- editing plugins
	-- use {
 --        "kylechui/nvim-surround",
	--     tag = "*", -- Use for stability; omit to use `main` branch for the latest features
 --    	    config = function()
 --            require("nvim-surround").setup({
 --            	-- Configuration here, or leave empty to use defaults
 --            })
 --            end
	-- }
	use {
    	'numToStr/Comment.nvim',
    	config = function()
    		require('Comment').setup()
    	end
	}
	use 'mg979/vim-visual-multi'



    use "VonHeikemen/lsp-zero.nvim"


-- nvchad config snip
    -- use {
    --     "neovim/nvim-lspconfig",
    --     init = function()
    --         require("core.utils").lazy_load "nvim-lspconfig"
    --     end,
    --     config = function()
    --     require "plugins.configs.lspconfig"
    --     end,
    -- }

-- load luasnips + cmp related in insert mode only
    -- use {
    --     "hrsh7th/nvim-cmp",
    --     event = "InsertEnter",
    --     dependencies = {
    --     {
    --         -- snippet plugin
    --         "L3MON4D3/LuaSnip",
    --         dependencies = "rafamadriz/friendly-snippets",
    --         opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    --         config = function(_, opts)
    --             require("plugins.configs.others").luasnip(opts)
    --         end,
    --     },
    --
    --     -- autopairing of (){}[] etc
    --     {
    --         "windwp/nvim-autopairs",
    --         opts = {
    --             fast_wrap = {},
    --             disable_filetype = { "TelescopePrompt", "vim" },
    --         },
    --         config = function(_, opts)
    --             require("nvim-autopairs").setup(opts)
    --
    --             -- setup cmp for autopairs
    --             local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    --             require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --         end,
    --         },
    --         -- cmp sources plugins
    --         {
    --             "saadparwaiz1/cmp_luasnip",
    --             "hrsh7th/cmp-nvim-lua",
    --             "hrsh7th/cmp-nvim-lsp",
    --             "hrsh7th/cmp-buffer",
    --             "hrsh7th/cmp-path",
    --         },
    --     },
    --     opts = function()
    --         return require "plugins.configs.cmp"
    --     end,
    --     config = function(_, opts)
    --         require("cmp").setup(opts)
    --     end,
    -- }
    --
    -- use {
    --        'williamboman/mason.nvim',
    --        'williamboman/mason-lspconfig.nvim',
    --
    --   {'hrsh7th/cmp-nvim-lsp'},
    --   {'L3MON4D3/LuaSnip'},
    -- }
    -- use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'L3MON4D3/LuaSnip'

    -- use 'hrsh7th/vim-vsnip'
    -- use 'hrsh7th/vim-vsnip-integ'
    --
    --
    



    -- auto completion
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}


end)



-- lualine
require('lualine').setup()

-- Color scheme: Onedark/monokai_pro
require("monokai").setup {}
require('onedark').load()

-- Mason:
require("mason").setup()
