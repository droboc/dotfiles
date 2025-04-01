return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    },
    lazygit = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
    { "<leader>e",       function() Snacks.explorer() end,               desc = "File Explorer" },

    { "<leader>ff",      function() Snacks.picker.files() end,           desc = "Find Files" },
    { "<leader>fr",      function() Snacks.picker.recent() end,          desc = "Recent" },
    { "<leader>gg",      function() Snacks.lazygit() end,                desc = "Lazygit" },
    { "<c-/>",           function() Snacks.terminal() end,               desc = "Toggle Terminal" },
  }
}
