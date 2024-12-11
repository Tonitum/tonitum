return {
  -- git
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    opts = {
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
        delay = 500,
        ignore_whitespace = true,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        -- map("n", "<leader>hs", gs.stage_hunk)
        -- map("n", "<leader>hr", gs.reset_hunk)
        -- map("v", "<leader>hs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        -- map("v", "<leader>hr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        -- map("n", "<leader>hS", gs.stage_buffer)
        -- map("n", "<leader>hu", gs.undo_stage_hunk)
        -- map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>gh", gs.preview_hunk)
        map("n", "<leader>gb", function() gs.blame_line { full = true } end)
        map("n", "<leader>tb", gs.toggle_current_line_blame)
        -- map("n", "<leader>hd", gs.diffthis)
        -- map("n", "<leader>hD", function() gs.diffthis("~") end)
        -- map("n", "<leader>td", gs.toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end
    }
  },

  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>")   -- status
      vim.keymap.set("n", "<leader>gt", ":Telescope git_stash<CR>")    -- stash
      vim.keymap.set("n", "<leader>gH", ":Telescope git_commits<CR>")  -- all commits
      vim.keymap.set("n", "<leader>gl", ":Telescope git_branches<CR>") -- branches
      vim.keymap.set("n", "<leader>gbl", ":G blame<CR>")               -- full file blame
      vim.keymap.set("n", "<leader>ga", ":Gwrite<CR>")                 -- add the current file
      vim.keymap.set("n", "<leader>gP", ":G push<CR>")                 -- Git push to origin
      vim.keymap.set("n", "<leader>gp", ":G pull<CR>")                 -- Git pull from origin
      vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>")           -- Git diff while rebasing

      local function openDiffSplit()
        vim.cmd("Gvdiffsplit")
        vim.keymap.set("n", "q", "<c-w>c", { buffer = 0 })
      end

      local function makeCommit()
        local current_branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
        if current_branch == "" then
          print("Not in git branch")
          return
        end
        local commit_message = vim.fn.input("Commit Message: ", "")
        print(commit_message)
        if commit_message == "" then
          print("aborting commit")
          return
        end
        local branch_ref = "refs " .. current_branch
        local complete_message = branch_ref .. ": " .. commit_message
        vim.cmd("G commit -m '" .. complete_message .. "'")
      end
      vim.keymap.set("n", "<leader>gc", makeCommit)                   -- add the current file
      vim.keymap.set("n", "<leader>gd", openDiffSplit)                -- view the diff of the current file in a split
      vim.keymap.set("n", "<leader>gD", ":Gvdiffsplit origin/master") -- diff this file and master branch
    end
  },                                                                  -- git commands in vim

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    -- setting the keybinding for LazyGit with "keys" is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  }
}
