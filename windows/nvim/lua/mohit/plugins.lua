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
  print "Installing packer... Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
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
  ------------------------------- My plugins here -------------------------------

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "lewis6991/impatient.nvim" -- improve startup time for neovim
  use "windwp/nvim-autopairs" -- Auto-complete pairs
  use "numToStr/Comment.nvim" -- Easily comment stuff
  -- use "mg979/vim-visual-multi" -- Multi-cursors like Sublime/VSCode
  use 'kyazdani42/nvim-web-devicons' -- Icons used by many plugins
  use 'kyazdani42/nvim-tree.lua' -- File tree
  use 'nvim-lualine/lualine.nvim' -- Bottom status bar
  use "akinsho/toggleterm.nvim"
  use 'junegunn/goyo.vim' -- no distractions
  use 'karb94/neoscroll.nvim' -- smooth scrolling
  -- use 'mbbill/undotree' -- undo tree visualizer

  -- Color schemes
  use "LunarVim/Colorschemes"
  use "folke/tokyonight.nvim"
  use "morhetz/gruvbox"
  use "haishanh/night-owl.vim"
  -- use "marko-cerovac/material.nvim"
  use {"dracula/vim", as = "dracula"}
  use "arcticicestudio/nord-vim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  use "hrsh7th/cmp-nvim-lua" -- nvim lua completions
  use "f3fora/cmp-spell" -- spell-completions based on vim's spellsuggest
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters to hook into nvim lsp client, contains lots of built-ins

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzy-native.nvim'}
  -- use "nvim-telescope/telescope-media-files.nvim"

  -- Tree-Sitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- provides context aware comment string using treesitter
  -- use "p00f/nvim-ts-rainbow"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Buffer
  use "akinsho/bufferline.nvim" -- A snazzy buffer line (with minimal tab integration)
  use "moll/vim-bbye" -- Delete buffers and close files in Vim without closing your windows

  -- Trouble
  --[[use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = require'mohit.trouble-config'
  }]]

  ------------------------------- My plugins above ------------------------------

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
