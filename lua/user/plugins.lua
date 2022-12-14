local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
  use({ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }) -- Autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" })
  use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
  use({ "kyazdani42/nvim-tree.lua", commit = "951b6e7e55da8aee9566cc0b17c11f9451cec349" })
  use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" })
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
  use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
  use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
  use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
  use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
  use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })

  -- Sergei's personal plugins
  use({ "rest-nvim/rest.nvim", commit = "2e368cd681379f014906ad0268111eb5c95f9aa6" })
  use({ "tversteeg/registers.nvim", commit = "2c4f82a8a68b7d3cee7bd345669f2f50bdc6f889" })
  use({ "nvim-zh/colorful-winsep.nvim", commit = "bb06c8678b1f879f14264aaba721098cc5495768" })
  use({ "Olical/conjure", commit = "0be93ef60f075a247bb5de9e29d447dc8a888ff0" })
  use({ "j-hui/fidget.nvim", commit = "44585a0c0085765195e6961c15529ba6c5a2a13b" })
  use({ "alexghergh/nvim-tmux-navigation", commit = "84a72a1f7655a2b2ced53abc7aea21f05019642a" })

  -- Colorschemes
  use({ "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" })
  use({ "Mofiqul/dracula.nvim", commit = "fe57c180fd7fdea39bc0d85bac9252aa6a8645e8" })

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
  use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
  use({ "PaterJason/cmp-conjure", commit = "d76e1fe5d724afe604dfa7b4b5ba93f3d3730617" })

  -- snippets
  use({ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }) --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }) -- a bunch of snippets to use

  -- LSP
  use({ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }) -- enable LSP
  use({ "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f" })
  use({ "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" })
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters
  use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })
  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    commit = "343e07de11b15f93e44ebd47eb98dce6b7da2e6b",
  })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "3c2e5fb23e9f6ca1aa682ae16bac3319bfe03e38" })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    commit = "7447fe780fed23402a3e0c3a227b549d7506ed38",
    run = "make",
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    commit = "4b900527045c49af5f43291d2cb13ae27a3bc7be",
    run = ":TSUpdate",
  })
  use({ "p00f/nvim-ts-rainbow", commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750" })
  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    commit = "a2e436d88d1880da6678049316e4c45135901866",
  })

  -- Git
  use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

  -- DAP
  use({ "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" })
  use({ "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" })
  use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

  -- Mini.nvim plugins
  use({ "echasnovski/mini.trailspace", branch = "stable" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
