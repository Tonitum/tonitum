vim.keymap.set("n", "<leader>e", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<leader>nE", "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", "<cmd>NERDTreeFind<CR>")

-- Start NERDTree. If a file is specified, move the cursor to its window.
-- vim.cmd( "autocmd StdinReadPre * let s:std_in=1 \
-- autocmd VimEnter * NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif" )

-- Exit Vim if NERDTree is the only window remaining in the only tab.
-- vim.cmd( "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" )

-- Close the tab if NERDTree is the only window remaining in it.
-- vim.cmd( "autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" )

-- Open the existing NERDTree on each new tab.
-- vim.cmd( "autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif" )


-- alternate command options
-- Start NERDTree and leave the cursor in it.
-- vim.cmd("autocmd VimEnter * NERDTree")

-- Start NERDTree and put the cursor back in the other window.
-- vim.cmd( "autocmd VimEnter * NERDTree | wincmd p" )

-- Start NERDTree when Vim is started without file arguments.
-- vim.cmd("autocmd StdinReadPre * let s:std_in=1 \
--           autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif")


-- -- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

-- -- Start NERDTree when Vim starts with a directory argument.
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
--     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
-- vim.cmd
 -- "autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\\d\\+' &&  bufname('%') !~ 'NERD_tree_\\d\\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute 'normal! \\<C-W>w' | execute 'buffer'.buf | endif"

-- -- Mirror the NERDTree before showing it. This makes it the same on all tabs.
-- nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
