local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  
  use "navarasu/onedark.nvim"

  -- UI plugins
  -------------
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'goolord/alpha-nvim', requires = 'kyazdani42/nvim-web-devicons' }
  
  -- Git
  ------
  use 'lewis6991/gitsigns.nvim'
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'f-person/git-blame.nvim'

  -- Vim language enhancements
  ----------------------------
  use 'tpope/vim-unimpaired' -- mappings which are simply short normal mode aliases for commonly used ex commands
  use {
    'tpope/vim-surround', -- mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    config = function()
      -- these bindings cause <C-g> to hang
			vim.g.surround_no_insert_mappings = true
		end,
  }
  use 'tpope/vim-commentary' -- Adds the operators 'gc' and '[count]gcc' to comment code
  use 'tpope/vim-repeat' -- adds support for the '.' command for vim-surround, vim-commentary and vim-unimpaired
  use 'kana/vim-textobj-user' -- Allows custom text objects
  use 'kana/vim-textobj-entire' -- Adds the text objects 'ie' and 'ae'
  use 'kana/vim-textobj-line' -- Adds the text objects 'il' and 'al'
  
  -- LSP
  ------
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- wrapper around nvim-lspconfig for easy installation
  use "kosayoda/nvim-lightbulb" -- lightbulb for code actions
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  
  -- cmp plugins
  --------------
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of out-of-the-box snippets

  -- Misc
  -------
  use 'numToStr/Navigator.nvim'
  use {
    "nvim-treesitter/nvim-treesitter",
     run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use "akinsho/toggleterm.nvim"
  use {
    "ahmedkhalf/project.nvim",
    requires = { 'nvim-telescope/telescope.nvim' },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
