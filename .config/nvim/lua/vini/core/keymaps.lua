vim.g.mapleader = " "
local keymap = vim.keymap

-- GENERAL
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set({ "n", "v" }, "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set({ "n", "v" }, "<leader>W", ":noautocmd w<CR>", { desc = "Save file without auto-commands" })
-- keymap.set("n", "<leader>H", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear highlights" })
keymap.set({ "n", "i" }, "<C-s>", "<ESC>:w<CR>", { desc = "Save file" })

-- TEXT
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste text" })
keymap.set("x", ">", ">gv", { noremap = true })
keymap.set("x", "<", "<gv", { noremap = true })
keymap.set(
  "x",
  "p",
  'p<cmd>let @+=@0<CR><cmd>let @"=@0<CR>',
  { noremap = true, silent = true, desc = "Don't yank on put" }
)
keymap.set({ "x", "n" }, "d", '"_d', { desc = "Delete without copying" })
keymap.set({ "x", "n" }, "c", '"_c', { desc = "Change without copying" })

-- SELECTION & MOVEMENT
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
keymap.set({ "n", "x", "o" }, "H", "^", { desc = "Jump to line start" })
keymap.set({ "n", "x", "o" }, "L", "$", { desc = "Jump to line end" })
keymap.set({ "n", "v" }, "<leader>a", "gg0<C-v>G$", { desc = "Select all" })
keymap.set("n", "<C-p>", "<C-^>", { desc = "Go to previous file" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up and center" })

-- NUMBERS
keymap.set("n", "<leader>+", "<C-x>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-a>", { desc = "Decrement number" })

-- WINDOWS
keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sm", ":vertical resize 220%<CR>", { desc = "Maximize vertical window" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- TABS & BUFFERS
keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- TERMINAL
keymap.set("n", "<leader>X", ":belowright split | terminal<CR>", { desc = "Open terminal bottom" })
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- EXIT & CLOSE
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close" })
keymap.set("n", "<leader>Qa", ":qa<CR>", { desc = "Quit all" })

-- LSP
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- COMMENT
keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- TELESCOPE
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Find all files" }
)
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help pages" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find old files" })
keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
keymap.set("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Pick hidden terminal" })
keymap.set("n", "<leader>fx", "<cmd>Telescope command_history<CR>", { desc = "Command history" })

-- WHICHKEY
keymap.set("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "WhichKey all keymaps" })
keymap.set("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "WhichKey query lookup" })

-- TREE-SITTER
keymap.set("n", "<leader>cti", ":InspectTree<CR>", { desc = "Inspect Tree" })

-- AI
keymap.set("n", "<leader>cc", "<cmd>CodeCompanionActions<CR>", { desc = "Open CodeCompanion actions" })
