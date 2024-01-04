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
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "machakann/vim-highlightedyank",   event = "VeryLazy" }, -- 高亮复制
  { "tpope/vim-surround",              event = "VeryLazy" },
  { 'michaeljsmith/vim-indent-object', event = "VeryLazy" }, -- 选择相同缩进的对象 vii vai vaI
  { 'brglng/vim-im-select',            event = "VeryLazy" },
  { 'tpope/vim-repeat',                event = "VeryLazy" },
  { 'vim-scripts/argtextobj.vim',      event = "VeryLazy" },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  { -- gcc和gc注释
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash-zh").jump({ search = { forward = true, wrap = true, multi_window = true },labels = "asdfghjklqwertyuiopzxcvbnm", })
        end,
        desc = "Flash between Chinese",
      },
      { "f", mode = { "n", "x", "o" }, function() require("flash-zh").jump({ search = { forward = true, wrap = false, multi_window = false }, labels =
        "asdfghjklqwertyuiopzxcvbnm", }) end,                                                                                                                                                desc = "Flash between Chinese" },
      { "F", mode = { "n", "x", "o" }, function() require("flash-zh").jump({ search = { forward = false, wrap = false, multi_window = false }, labels =
        "asdfghjklqwertyuiopzxcvbnm", }) end,                                                                                                                                                desc = "Flash between Chinese" },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = false,
        }
      },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
    -- stylua: ignore
    keys = {
      --{ "f", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = false }, }) end,  desc = "Flash" },
      --{ "F", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = false }, }) end, desc = "Flash" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      {
        "gl",
        mode = { "n" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern =
            "^"
          })
        end,
        desc = "Flash"
      },
    }
  },


}

local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
