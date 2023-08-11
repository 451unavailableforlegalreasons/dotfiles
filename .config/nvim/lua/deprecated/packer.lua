require('packer').startup( function(use)
	use 'wbthomason/packer.nvim'  -- leave this line otherwise packer will delete itself
	use 'navarasu/onedark.nvim'
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
		'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        require("lualine").setup()
	}
	use 'mg979/vim-visual-multi'
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.2',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
    	'numToStr/Comment.nvim',
    	config = function()
    		require('Comment').setup()
    	end
	}


    use ('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
    -- use "nvim-treesitter/playground"
    use ('theprimeagen/harpoon')

    use "VonHeikemen/lsp-zero.nvim"


-- nvchad config snip
    use {
        "neovim/nvim-lspconfig",
        init = function()
            require("core.utils").lazy_load "nvim-lspconfig"
        end,
        config = function()
        require "plugins.configs.lspconfig"
        end,
    }

-- load luasnips + cmp related in insert mode only
    use {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
        {
            -- snippet plugin
            "L3MON4D3/LuaSnip",
            dependencies = "rafamadriz/friendly-snippets",
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
                require("plugins.configs.others").luasnip(opts)
            end,
        },

        -- autopairing of (){}[] etc
        {
            "windwp/nvim-autopairs",
            opts = {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            },
            config = function(_, opts)
                require("nvim-autopairs").setup(opts)

                -- setup cmp for autopairs
                local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
            },
            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
            return require "plugins.configs.cmp"
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    }

    use {
           'williamboman/mason.nvim',
           'williamboman/mason-lspconfig.nvim',

      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
    -- use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'L3MON4D3/LuaSnip'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'


end)




-- Color Theme: Onedark
require('onedark').load()

-- Mason:
require("mason").setup()
