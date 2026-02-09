local M = {
  "folke/which-key.nvim",
  -- "VeryLazy" hides splash screen
  -- lazy = false,
  event = "BufReadPost",
}

M.config = function()
  -- If we do not wish to wait for timeoutlen
  vim.keymap.set("v", "<Leader>?", "<Esc>:WhichKey '' v<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>?", "<Esc>:WhichKey '' n<CR>",
    { silent = true, desc = "which-key root" })
  vim.keymap.set("n", "<Leader><Leader>", "<Esc>:WhichKey '' n<CR>",
    { silent = true, desc = "which-key root" })

  -- https://github.com/folke/which-key.nvim#colors
  vim.cmd([[highlight default link WhichKey          Label]])
  vim.cmd([[highlight default link WhichKeySeperator String]])
  vim.cmd([[highlight default link WhichKeyGroup     Include]])
  vim.cmd([[highlight default link WhichKeyDesc      Function]])
  vim.cmd([[highlight default link WhichKeyFloat     CursorLine]])
  vim.cmd([[highlight default link WhichKeyValue     Comment]])

  local wk = require("which-key")
  wk.setup({
    plugins = {
      marks = true,      -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true,  -- enabling this will show WhichKey when pressing z= to spell suggest
        suggestions = 20 -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = false,    -- adds help for operators like d, y, ... (deprecated in this config)
        motions = false,      -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = true,       -- default bindings on <c-w>
        nav = true,           -- misc bindings to work with windows
        z = true,             -- bindings for folds, spelling and others prefixed with z
        g = true              -- bindings for prefixed with g
      }
    },
    replace = {
      key = {
        { "<space>", "SPC" },
        { "<cr>", "RET" },
        { "<tab>", "TAB" },
      },
      desc = {
        { "<silent>", "" },
        { "<cmd>", "" },
        { "<Cmd>", "" },
        { "<CR>", "" },
        { "^call%s+", "" },
        { "^lua%s+", "" },
        { "^:%s*", "" },
      }
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+" -- symbol prepended to a group
    },
    win = {
      border = "none",         -- none, single, double, shadow
      title = false,
      padding = { 1, 1, 1, 1 } -- extra window padding [top/bottom, right/left]
    },
    layout = {
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 5,                    -- spacing between columns
    },
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = {
      { "<auto>", mode = "nixsotc" },
    },
    -- triggers = {"<leader>"} -- or specifiy a list manually
  })

  local keymaps = {
    { "%", desc = "cycle through matchit group", mode = "n" },
    { "<CR>", desc = "treesitter incremental selection", mode = "n" },
    -- dup DAP descriptons due to plugin lazy load
    { "<F5>", desc = "DAP launch or continue", mode = "n" },
    { "<F8>", desc = "DAP toggle UI", mode = "n" },
    { "<F9>", desc = "DAP toggle breakpoint", mode = "n" },
    { "<F10>", desc = "DAP step over", mode = "n" },
    { "<F11>", desc = "DAP step into", mode = "n" },
    { "<F12>", desc = "DAP step out", mode = "n" },
    { "<C-\\>", desc = "Launch scratch terminal", mode = "n" },
    { "<C-l>", desc = "Clear and redraw screen", mode = "n" },
    { "<C-r>", desc = "Redo", mode = "n" },
    { "u", desc = "Undo", mode = "n" },
    { "U", desc = "Undo line", mode = "n" },
    { ".", desc = "Repeat last edit", mode = "n" },

    { "[", group = "previous", mode = "n" },
    { "[]", desc = "Previous class/object start", mode = "n" },
    { "[[", desc = "Previous class/object end", mode = "n" },
    { "]", group = "next", mode = "n" },
    { "]]", desc = "Next class/object start", mode = "n" },
    { "][", desc = "Next class/object end", mode = "n" },

    { "g", group = "goto", mode = "n" },
    { "g%", desc = "goto previous matching group", mode = "n" },
    { "g0", desc = "goto visual line start", mode = "n" },
    { "g$", desc = "goto visual line end", mode = "n" },
    { "g8", desc = "print hex value under cursor", mode = "n" },
    { "g<lt>", desc = "display last !command output", mode = "n" },
    { "g<C-G>", desc = "print current cursor pos info", mode = "n" },
    { "ga", desc = "print ascii value under cursor", mode = "n" },
    { "g_", desc = "goto last non-EOL char", mode = "n" },
    { "gt", desc = "goto next tab", mode = "n" },
    { "gT", desc = "goto prev tab", mode = "n" },
    { "gM", desc = "goto middle of text line", mode = "n" },
    { "gF", desc = "goto file:line under cursor", mode = "n" },
    { "gE", desc = "previous end of WORD", mode = "n" },

    { "<leader>g", group = "git", mode = "n" },
    { "<leader>G", group = "git", mode = "n" },
    { "<leader>f", group = "fzf", mode = "n" },
    { "<leader>l", group = "lsp", mode = "n" },
    { "<leader>L", group = "Lsp", mode = "n" },
    { "<leader>d", group = "dap", mode = "n" },
    { "<leader>y", group = "yadm", mode = "n" },
    { "<leader>h", group = "gitsigns", mode = "n" },
    { "<leader>t", group = "test", mode = "n" },
    { "<leader>tl", group = "lsp", mode = "n" },
    { "<leader>e", group = "tree", mode = "n" },
    { "<leader>ee", desc = "nvim-tree on/off", mode = "n" },
    { "<leader>ef", desc = "nvim-tree current file", mode = "n" },
  }

  wk.add(keymaps)
end

return M
