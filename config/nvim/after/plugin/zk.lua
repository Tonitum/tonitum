local notes_path = "~/zettelkasten/"
require('telekasten').setup({
  home = vim.fn.expand(notes_path), -- Put the name of your notes directory here
  dailies = vim.fn.expand(notes_path .. "/daily"),
  weeklies = vim.fn.expand(notes_path .. "/weekly"),
  templates = vim.fn.expand(notes_path .. "/templates"),
  template_new_note = vim.fn.expand(notes_path .. "/templates/base.md"),
  template_new_daily = vim.fn.expand(notes_path .. "/templates/daily.md"),
  new_note_filename = 'title-uuid',
  filename_space_subst = "_",
  auto_set_filetype = false,
  journal_auto_open = true,
})


local tk = require('telekasten')
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", function()
    tk.panel()
  end)

-- Most used functions
vim.keymap.set("n", "<leader>zf", function()
    tk.find_notes()
  end)
vim.keymap.set("n", "<leader>zD", function()
    tk.find_daily_notes()
  end)
vim.keymap.set("n", "<leader>zg", function()
    tk.search_notes()
  end)
vim.keymap.set("n", "<leader>zd", function()
    tk.goto_today()
  end)
vim.keymap.set("n", "<leader>zz", function()
    tk.follow_link()
  end)
vim.keymap.set("n", "<leader>zn", function()
    tk.new_note()
  end)
vim.keymap.set("n", "<leader>zN", function()
    tk.new_templated_note()
  end)
vim.keymap.set("n", "<leader>zy", function()
    tk.yank_notelink()
  end)
vim.keymap.set("n", "<leader>zc", function()
    tk.show_calendar()
  end)
vim.keymap.set("n", "<leader>zt", function()
    tk.toggle_todo()
  end)
vim.keymap.set("n", "<leader>zb", function()
    tk.show_backlinks()
  end)
vim.keymap.set("n", "<leader>zI", function()
    tk.insert_img_link()
  end)
vim.keymap.set("n", "<leader>zj", function()
    vim.cmd("vsplit")
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    tk.goto_today()
    vim.keymap.set('n', 'q', "<c-w>c", { buffer = 0 })
    vim.cmd("set wrap")
    vim.cmd("set linebreak")
    vim.cmd("set breakindent")
  end)

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", function()
    tk.insert_link()
  end)
