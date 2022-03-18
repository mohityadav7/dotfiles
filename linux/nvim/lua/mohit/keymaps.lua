local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   "n" = normal_mode
--   "i" = insert_mode
--   "v" = visual_mode, select mode
--   "x" = visual_block_mode
--   "t" = term_mode
--   "c" = command_mode

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer
keymap("n", "<leader>q", ":Bdelete<CR>", opts) -- Close current buffer

-- Source config -- not working, but why?
keymap("n", "<leader><CR>", ":so %<CR>", opts)
-- keymap("n", "<leader><CR>", ":so $MYVIMRC<cr>", opts)

-- Resize windows with arrow keys
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts) -- with preview
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts) -- without previw
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)

-- lsp
keymap("n", "<leader>lca", "<cmd>Telescope lsp_code_actions<cr>", opts)

--git
keymap("n", "<leader>gs", ":Telescope git_status<cr>", opts)

-- Comment
keymap('n', '<C-_>', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>', opts) -- Linewise toggle current line using C-/
-- refer https://github.com/numToStr/Comment.nvim/blob/master/doc/API.md to add more mappings

-- Formatting
keymap('n', '<leader>F', ':lua vim.lsp.buf.formatting_sync()<CR>', opts)

-- Clear search highlight
keymap("n", "<Esc>", ":noh<cr>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode while indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste
keymap("v", "p", '"_dP', opts) -- delete selected text and then paste

-- Quickfix loclist
keymap("n", "<C-n>", ":cnext<cr>", opts)
keymap("n", "<C-p>", ":cprev<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
-- jump to the next/previous item, skipping the groups
-- keymap("n", "<leader>xj", function () require("trouble").next({skip_groups = true, jump = true}) end, opts)
-- keymap("n", "<leader>xk", function () require("trouble").previous({skip_groups = true, jump = true}); end, opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- Move text up and down
keymap("n", "<A-k>", "V:m-2<CR>gv=", opts)
keymap("n", "<A-j>", ":m+1<CR>gv=", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
-- keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv=gv", opts)

-- Multi cursor mappings
vim.cmd([[
  let g:VM_maps = {}
  " let g:VM_maps['Find Under']         = '<C-d>'
  " let g:VM_maps['Find Subword Under'] = '<C-d>'
  let g:VM_maps["Select Cursor Down"] = '<M-C-Down>'
  let g:VM_maps["Select Cursor Up"]   = '<M-C-Up>'
  " don't show warnings (https://github.com/mg979/vim-visual-multi/issues/98)
  let g:VM_show_warnings = 0
]])


-------------------------------- Terminal Mode ---------------------------------
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
