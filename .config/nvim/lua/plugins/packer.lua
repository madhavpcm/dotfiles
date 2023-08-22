local install_plugins = false

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

install_plugins = ensure_packer()
if install_plugins then
  require("packer").sync()
end

require("packer").startup(function(use)
  -- Package manager
  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim" }

  -- Tree Sitter plugins
  use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
  use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('plugins.tree-sitter')",
  }

  -- Completions
  use { "hrsh7th/nvim-cmp", config = 'require("plugins.nvim-cmp")' }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "davidmh/cspell.nvim" }
  --
  -- LSP
  --
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "MunifTanjim/prettier.nvim", config = 'require("plugins.prettier")' }
  use { 'mhartington/formatter.nvim', config = 'require("plugins.formatter")'}

  -- Code/Workflow
  --

  use { "p00f/cphelper.nvim" }
  use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
  use { "lukas-reineke/indent-blankline.nvim", config = 'require("plugins.indentline")', event = "BufWinEnter" }
  use {
    "norcalli/nvim-colorizer.lua",
    config = 'require("plugins.colorizer")',
  }
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = 'require("plugins.gitsigns")' }
  use { "simrat39/rust-tools.nvim" }
  use { "windwp/nvim-autopairs", config = 'require("plugins.autopairs")' }
  use { "sakhnik/nvim-gdb" }
  use { "L3MON4D3/LuaSnip" }
  use { "folke/which-key.nvim", config = 'require("plugins.which-key")' }
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = 'require("plugins.telescope")',
    cmd = "Telescope",
  }
  use {'mbbill/undotree', config = 'require("plugins.undotree")'}

  -- Looks and themes
  use { "nvim-tree/nvim-web-devicons", config = 'require("plugins.devicons")' }
  use { "calincru/flex-bison-syntax" }
  use { "romgrk/barbar.nvim", wants = "nvim-web-devicons", config = 'require("plugins.tabline")', event = "BufWinEnter" }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = 'require("plugins.nvim-tree")',
    cmd = "NvimTreeToggle",
  }
  use { "Mofiqul/vscode.nvim", config = 'require("plugins.color")' }
  use { "yamatsum/nvim-cursorline", config = 'require("plugins.cursorline")' }
  use {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons",
    },
    wants = "nvim-web-devicons",
    event = "BufWinEnter",
    config = "require('plugins.barbecue')",
  }
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = "require('plugins.toggleterm')",
  }
  use "itsfarseen/expos-vim-plugins"
  use { "glepnir/dashboard-nvim", event = "VimEnter", config = 'require("plugins.dashboard")' }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = 'require("plugins.lualine")',
  }
end)
