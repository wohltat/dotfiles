-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.o.timeoutlen = 200
local map = vim.keymap.set

-- map("n:", "<Space>", "<Nop>", { silent = true, remap = false })
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
-- .g.mapleader = "<Space>"

-- Copy & Paste
map("i", "<Space><Space>", "<ESC>", { desc = "Exit insert mode" })
map("v", "<Space><Space>", "<ESC>", { desc = "Exit visual mode" })
map("n", "<D-c>", "yy", { desc = "Copy at cursor" })
map("v", "<C-x>", "D", { desc = "Cut at cursor", remap = true })
map("n", "<C-x>", "Dd", { desc = "Cut line", remap = true })
map("v", "<D-c>", "y", { desc = "Copy at cursor" })
map("i", "<D-c>", "<C-o>yy", { desc = "Copy at cursor" })
-- map("v", "<Esc>[99;9u", "y", { desc = "Copy at cursor" })
map("n", "p", "p`[", { desc = "paste" })
map({ "i", "c" }, "<A-p>", "<C-r>+", { desc = "Paste", remap = true })
map("c", "<C-S-v>", "<C-r>+", { desc = "Paste", remap = true })
map("c", "<C-S-v>", "i<C-r>+", { desc = "Paste", remap = true })
-- tmux osc52 fixes
map("n", "\27c", "Y", { desc = "Copy at cursor" })
map("v", "\27c", "y", { desc = "Copy at cursor" })

-- Move cursor
map("n", "<A-k>", "<Up>")
map("n", "<A-j>", "<Down>")
map("n", "<C-p>", ":", { desc = "command line" })

-- vim.api.nvim_del_keymap("c", "<C-S-v>") -- delete old keymap paste to the right
map("n", "<D-v>", "P", { remap = true, silent = true })
map({ "i", "c" }, "<A-h>", "<Left>", { desc = "Move left", remap = true })
map({ "i", "c" }, "<A-l>", "<Right>", { desc = "Move right", remap = true })
map("i", "<A-k>", "<Up>", { desc = "Move up", remap = true })
map("i", "<A-j>", "<Down>", { desc = "Move down", remap = true })

map({ "i", "c" }, "<C-A-h>", "<C-Left>", { desc = "Move word left" })
map({ "i", "c" }, "<C-A-l>", "<C-Right>", { desc = "Move word right" })
map("n", "<C-A-h>", "b", { desc = "Move word left" })
map("i", "<C-H>", "b", { desc = "Move word left" })
map("n", "<C-A-l>", "w", { desc = "Move word right" })
map("i", "<C-l>", "b", { desc = "Move word right" })
map("n", "<C-A-k>", "{", { desc = "Move section up" })
map("n", "<C-A-j>", "}", { desc = "Move section down" })
-- map("n", "<C-k>", "<C-y>", { desc = "Move section down" })
-- map("n", "<C-j>", "<C-e>", { desc = "Move section down" })

map("i", "<A-e>", "<End>", { desc = "Goto end of line", remap = true })
map("i", "<A-a>", "<Home>", { desc = "Goto start of line", remap = true })
map("n", "<A-e>", "$", { desc = "Goto end of line" })
map("n", "<A-a>", "^", { desc = "Goto start of line" })

-- remap to correctly complete beginning of word
map("c", "<C-p>", "<Up>", { desc = "Previous command" })
map("c", "<C-n>", "<Down>", { desc = "Next command" })
map("c", "<A-k>", "<C-p>", { desc = "Previous command" })
map("c", "<A-j>", "<C-n>", { desc = "Next command" })

-- Move lines
map("n", "<C-S-k>", "<cmd>m .-2<cr>==", { desc = "Move line Up", silent = true })
map("n", "<C-S-j>", "<cmd>m .+1<cr>==", { desc = "Move line Down", silent = true })
map("n", "<C-S-Up>", "<cmd>m .-2<cr>==", { desc = "Move line Up", silent = true })
map("n", "<C-S-Down>", "<cmd>m .+1<cr>==", { desc = "Move line Down", silent = true })
map("i", "<C-S-j>", "<cmd>m .+1<cr>", { desc = "Move line Down", silent = true })
map("i", "<C-S-k>", "<cmd>m .-2<cr>", { desc = "Move line Up", silent = true })
map("i", "<C-S-Up>", "<cmd>m .-2<cr>", { desc = "Move line Up", silent = true })
map("i", "<C-S-Down>", "<cmd>m .+1<cr>", { desc = "Move line Down", silent = true })

map("v", "<C-S-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
map("v", "<C-S-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
map("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })

-- Deleting
map("n", "dl", "d$", { desc = "Delete all to right", remap = true })
map("n", "dh", "d^", { desc = "Delete all to left", remap = true })
map({ "i", "c" }, "<A-n>", "<Backspace>", { desc = "Delete left" })
map({ "i", "c" }, "<A-m>", "<Delete>", { desc = "Delete right" })
-- vim.api.nvim_del_keymap("n", "<A-n>")
map("n", "<A-n>", "X", { desc = "Delete left", remap = true })
-- map("n", "<A-n>", "a", { desc = "Delete left", remap = true })
-- map("n", "<A-n>", "a<Backspace><Esc>", { desc = "Delete left", remap = true })
map("n", "<A-m>", "<Delete>", { desc = "Delete right" })
map("n", "<C-A-n>", "db", { desc = "Delete word left" })
map("n", "<C-A-m>", "dw", { desc = "Delete word right" })
map("c", "<C-A-n>", "<C-w>", { desc = "Delete word left" })
map("c", "<C-A-m>", "<A-d>", { desc = "Delete word right" })

map({ "n", "v" }, "x", '"_x', { desc = "delete right", silent = true })
map({ "n", "v" }, "X", '"_X', { desc = "delete left", silent = true })
map("n", "c", '"_c', { desc = "change...", silent = true })
map("n", "C", '"_C', { desc = "Change...", silent = true })
map("n", "d", '"_d', { desc = "delete...", silent = true })
map("n", "D", "d", { desc = "Delete with yank...", silent = true })
map("v", "d", '"_d', { desc = "Delete", silent = true })
map("v", "D", "d", { desc = "Delete with yank...", silent = true })
map("v", "<BS>", "d", { desc = "Delete selection", noremap = true, silent = true })
map("i", "<C-BS>", "<C-o>db", { desc = "Delete word backwards", noremap = true, silent = true })

-- Misc
map({ "n", "v", "i", "c" }, "<A-x>", "<Esc>", { desc = "Exit to normal mode" })

map("v", "<Tab>", ">", { desc = "Indent right", remap = true })
map("v", "<S-Tab>", "<", { desc = "Indent right", remap = true })
map("n", "<Tab>", ">>", { desc = "Indent right", remap = true })
map("n", "<S-Tab>", "<<", { desc = "Indent right", remap = true })

map("n", "<A-w>", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", { desc = "Toggle line wrap", silent = true })

-- Duplicate lines
-- map("n", "<C-S-d>", "yyp", { desc = "Duplicate line" })
map("n", "<C-S-d>", '"dyym\'"dp<C-o><Down>', { desc = "Duplicate line" })
map("i", "<C-S-d>", '<Esc>"dyym\'"dp<C-o><Down>i', { desc = "Duplicate line", noremap = true })
map("v", "<C-S-d>", '"dym`"dP``', { desc = "Duplicate line", remap = true })
map("i", "<C-S-d>", '<Esc>"dyym\'"dp<C-o><Down>i', { desc = "Duplicate line", noremap = true })
map("v", "<C-S-d>", '"dym`"dP``', { desc = "Duplicate line", remap = true })

-- return to previous position after leaving visual mode
-- map("n", "v", "m`v", { desc = "Enter visual mode" })
-- map("n", "V", "m`V", { desc = "Enter visual line mode" })
-- map("n", "<C-v>", "m`<C-v>", { desc = "Enter visual block mode" })
-- map("v", "<Esc>", "<Esc>``", { desc = "Exit visual mode" })
-- map("v", "y", "y``", { desc = "Copy to clipboard" })

-- Map * to search for the current word without skipping it
-- map("n", "*", "[[:let @/='<'.expand('<cword>').'>'<CR>cgn]]", { noremap = true, silent = true })

-- Map # to search backwards for the current word without skipping it
map("n", "#", "#N", { noremap = true, silent = true })
map("n", "*", "*N", { noremap = true, silent = true })

map({ "n" }, "<c-s-cr>", "O<ESC>", { desc = "Add line above", silent = true })
map({ "i" }, "<c-s-cr>", "<C-o>O", { desc = "Add line above", silent = true })
map({ "n" }, "<c-cr>", "o<ESC>", { desc = "Add line below", silent = true, remap = true })
map({ "i" }, "<c-cr>", "<C-o>o", { desc = "Add line below", silent = true })

map(
  "n",
  "gO",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Add line above", silent = true }
)
map(
  "n",
  "go",
  "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
  { desc = "Add line below", silent = true }
)

local function is_selection_left_to_right()
  local start_pos = vim.fn.getpos("'<") -- Get the start of visual selection
  local end_pos = vim.fn.getpos("'>") -- Get the end of visual selection

  -- Compare line numbers first
  if start_pos[2] < end_pos[2] then
    return true -- Left-to-right
  elseif start_pos[2] > end_pos[2] then
    return false -- Right-to-left
  else
    -- If on the same line, compare column numbers
    if start_pos[3] <= end_pos[3] then
      return true -- Left-to-right
    else
      return false -- Right-to-left
    end
  end
end

-- Function to perform different actions based on selection direction
function Do_action_based_on_selection()
  if is_selection_left_to_right() then
    -- Action when selection is left-to-right
    print("Selection is left-to-right")
    -- You can put any action you want here
  else
    -- Action when selection is right-to-left
    print("Selection is right-to-left")
    -- You can put any action you want here
  end
end

-- Function to check if visual selection is left-to-right or right-to-left
vim.api.nvim_set_keymap("v", "<leader>a", ":lua Do_action_based_on_selection()<CR>", { noremap = true, silent = true })
