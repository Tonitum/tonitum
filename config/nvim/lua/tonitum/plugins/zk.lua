return {
  -- note taking
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      { "renerocksai/calendar-vim" },
    },
    keys = {
      { "<leader>zp", nil },
      { "<leader>zf", nil },
      { "<leader>zi", nil },
      { "<leader>zD", nil },
      { "<leader>zg", nil },
      { "<leader>zd", nil },
      { "<leader>zz", nil },
      { "<leader>zn", nil },
      { "<leader>zN", nil },
      { "<leader>zy", nil },
      { "<leader>zc", nil },
      { "<leader>zt", nil },
      { "<leader>zl", nil },
      { "<leader>zb", nil },
      { "<leader>zI", nil },
      { "<leader>zm", nil },
      { "<leader>zj", nil },
      { "<leader>zk", nil },
      { "<leader>zh", nil }
    },
    config = function()
      local tk = require("telekasten")
      local notes_path = "~/zk"

      vim.keymap.set("n", "<leader>zp", function()
        tk.panel()
      end)

      -- Most used functions
      vim.keymap.set("n", "<leader>zf", function()
        tk.find_notes()
      end)
      -- insert lint
      vim.keymap.set("n", "<leader>zi", function()
        tk.insert_link()
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
      vim.keymap.set("n", "<leader>zl", function()
        tk.show_tags()
      end)
      vim.keymap.set("n", "<leader>zb", function()
        tk.show_backlinks()
      end)
      vim.keymap.set("n", "<leader>zI", function()
        tk.insert_img_link()
      end)

      -- mark item as done, then move to bottom of file
      vim.keymap.set("n", "<leader>zm", function()
        tk.toggle_todo()
        vim.cmd.normal("ddGp")
        vim.cmd(vim.api.nvim_replace_termcodes("normal <C-o>", true, true, true))
      end)

      vim.keymap.set("n", "<leader>zj", function()
        vim.cmd("80 vsplit")
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_win_set_buf(win, buf)
        tk.goto_today()
        vim.keymap.set("n", "q", "<c-w>c", { buffer = 0 })
        vim.cmd("set wrap")
        vim.cmd("set linebreak")
        vim.cmd("set breakindent")
      end)

      vim.keymap.set("n", "<leader>zk", function()
        vim.cmd("80 vsplit")
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_win_set_buf(win, buf)
        vim.cmd("e " .. notes_path .. "/capture.md")
        vim.keymap.set("n", "q", "<c-w>c", { buffer = 0 })
        vim.cmd("set wrap")
        vim.cmd("set linebreak")
        vim.cmd("set breakindent")
      end)

      vim.keymap.set("n", "<leader>zh", function()
        vim.cmd("e " .. notes_path .. "/TODO.md")
      end)
      require("telekasten").setup({
        home = vim.fn.expand(notes_path), -- Put the name of your notes directory here
        dailies = vim.fn.expand(notes_path .. "/daily"),
        weeklies = vim.fn.expand(notes_path .. "/weekly"),
        templates = vim.fn.expand(notes_path .. "/templates"),
        template_new_note = vim.fn.expand(notes_path .. "/templates/base.md"),
        template_new_daily = vim.fn.expand(notes_path .. "/templates/daily.md"),
        new_note_filename = "title",
        filename_space_subst = "_",
        auto_set_filetype = false,
        journal_auto_open = true,
        sort = "modified",
        install_syntax = true,
        -- tag_notation = "@tag",
        -- show_tags_theme = "get_cursor",
      })
    end
  },
  {
    "cacalabs/toilet",
    lazy = true
  }
}
