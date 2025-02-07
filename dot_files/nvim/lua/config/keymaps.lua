local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

--p Save with root permission (not working for now)
vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- ----------------------------------------------------------------------------------------
-- Custom continuations

-- Copy to system clipboard
keymap.set("v", "<C-c>", '"+y')  -- Copy selected text
keymap.set("n", "<C-c>", '"+yy') -- Copy current line

-- Paste from system clipboard
keymap.set("n", "<C-v>", '"+p')  -- Paste in normal mode
keymap.set("v", "<C-v>", '"+p')  -- Paste in visual mode
keymap.set("i", "<C-v>", '<C-r>+') -- Paste in insert mode

-- Cut to system clipboard
keymap.set("v", "<C-x>", '"+d')  -- Cut selected text
keymap.set("n", "<C-x>", '"+dd') -- Cut current line


-- Telescope
-- t
local builtin = require('telescope.builtin')

keymap.set("n", "<space>fh", builtin.help_tags, {})
keymap.set("n", "<C-t>", builtin.find_files, {})
keymap.set("n", "<space>fd", builtin.live_grep, {})
keymap.set("n", "<space>en", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config")
        })
      end)
keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, {})
