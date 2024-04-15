return {
  "tpope/vim-abolish",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tomtom/tcomment_vim",
  "terryma/vim-expand-region",
  "mg979/vim-visual-multi",
  -- {
  --   "lifepillar/vim-solarized8",
  --   lazy = false,
  --   branch = "neovim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme solarized8_flat]])
  --     vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  --     vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
  --   end
  -- },
  {
    "shaunsingh/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme solarized]])
      require('solarized').set()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "solarized_light" }
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    build = ':TSUpdate',
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        highlight = {
          -- enable = false,
          enable = true,
        },
        matchup = {
          enable = true
        },
        endwise = {
          enable = true,
        },
      })
    end
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("which-key").setup({})
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    keys = {
      { "<leader>sr", "ysiw", mode = { "n" }, remap = true },
    },
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "Yggdroot/indentLine",
    init = function()
      vim.g.indentLine_enabled = 0
      vim.g.indentLine_color_gui = "#2c3e50"
    end
  },
  {
    "ptzz/lf.vim",
    lazy = false,
    dependencies = { "voldikss/vim-floaterm" },
    keys = {
      { "-", "<cmd>Lf<CR>", mode = { "n" } },
    },
    init = function()
      vim.g.lf_replace_netrw = 1
      vim.g.lf_map_keys = 0
    end
  },
  {
    "voldikss/vim-floaterm",
    init = function()
      vim.g.floaterm_width = 0.99
      vim.g.floaterm_height = 0.6
      vim.g.floaterm_position = "bottom"
      vim.g.floaterm_opener = "edit"
    end
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "janko-m/vim-test",
    keys = {
      { "<Leader>tn", "<cmd>TestNearest<CR>", mode = { "n" }, noremap = true },
      { "<Leader>tf", "<cmd>TestFile<CR>", mode = { "n" }, noremap = true },
    },
    config = function()
      vim.g["test#strategy"] = "floaterm"
      vim.g["test#ruby#rspec#executable"] = "docker compose exec app rspec"
      vim.g["test#transformation"] = "docker"

      vim.cmd([[
function! DockerTransformer(cmd) abort
  " let container_id = system("docker ps | grep app | awk '{print $1}' | head -n1")
  " return 'docker exec -t ' . container_id . ' ' . a:cmd
  return a:cmd . ' ' . '--exclude-pattern "spec/system/**/*"'
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransformer')}
]])
    end
  },
  {
    "mattn/vim-maketable",
    ft = "markdown",
    event = "VeryLazy",
  },
  {
    "ekalinin/Dockerfile.vim",
    ft = { "Dockerfile", "docker-compose" }
  },
  {
    "rust-lang/rust.vim",
    ft = { "rust" }
  },
  {
    "hashivim/vim-terraform",
    ft = { "terraform" }
  },
  {
    "chr4/nginx.vim",
    ft = { "nginx" }
  },
}
