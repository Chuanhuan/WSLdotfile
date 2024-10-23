return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
      -- default window options
      window = {
        layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.7, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = "Copilot Chat", -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -- "luk400/vim-jukit",
  -- {
  --   "kiyoon/jupynium.nvim",
  --   build = "pip3 install --user .",
  --   -- build = "conda run --no-capture-output -n jupynium pip install .",
  --   -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  -- },
  -- "rcarriga/nvim-notify", -- optional
  -- "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_output_win_max_height = 12
      vim.g.molten_virt_text_output = true
      vim.g.molten_auto_open_output = true
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
      -- vim.keymap.set("n", "<leader>ji", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
      -- vim.keymap.set(
      --   "n",
      --   "<leader>je",
      --   ":MoltenEvaluateOperator<CR>",
      --   { silent = true, desc = "run operator selection" }
      -- )
      -- vim.keymap.set("n", "<leader>jl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      -- vim.keymap.set("n", "<leader>jr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
      -- vim.keymap.set(
      --   "v",
      --   "<leader>cr",
      --   ":<C-u>MoltenEvaluateVisual<CR>gv",
      --   { silent = true, desc = "evaluate visual selection" }
      -- )
      -- vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
      -- vim.keymap.set("n", "<leader>jo", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
      -- vim.keymap.set(
      --   "n",
      --   "<leader>js",
      --   ":noautocmd MoltenEnterOutput<CR>",
      --   { silent = true, desc = "show/enter output" }
      vim.keymap.set("n", "<localleader>ri", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
      vim.keymap.set(
        "n",
        "<localleader>re",
        ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" }
      )
      vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
      vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
      vim.keymap.set("n", "<localleader>rh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
      vim.keymap.set(
        "n",
        "<localleader>rs",
        ":noautocmd MoltenEnterOutput<CR>",
        { silent = true, desc = "show/enter output" }
      )
      vim.keymap.set(
        "v",
        "<localleader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" }
      ) -- )
      vim.keymap.set("n", "<localleader>rp", function()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv ~= nil then
          -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
          venv = string.match(venv, "/.+/(.+)")
          vim.cmd(("MoltenInit %s"):format(venv))
        else
          vim.cmd("MoltenInit python3")
        end
      end, { desc = "Initialize Molten for python3", silent = true })
    end,
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "willothy/wezterm.nvim",
    config = true,
  },

  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      name = {
        "venv",
        ".venv",
        "env",
        ".env",
      },
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },

  -- {
  --   "rmagatti/auto-session",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
  --   },
  --   config = function()
  --     require("auto-session").setup({
  --       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/Documents" },
  --     })
  --   end,
  -- },

  {
    "pappasam/nvim-repl",
    init = function()
      vim.g["repl_filetype_commands"] = {
        javascript = "node",
        python = "ipython --no-autoindent",
      }
      vim.g.repl_width = 60
      vim.keymap.set("x", "<Leader>e", "<Plug>ReplSendVisual", { desc = "Send visual selection to REPL" })
    end,
    keys = {
      { "<leader>ct", "<cmd>ReplToggle<cr>", desc = "Toggle nvim-repl" },
      { "<leader>cc", "<cmd>ReplRunCell<cr>", desc = "nvim-repl run cell" },
    },
  },
  -- install without yarn or npm
  -- {
  --     "iamcco/markdown-preview.nvim",
  --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --     ft = { "markdown" },
  --     build = function() vim.fn["mkdp#util#install"]() end,
  -- }

  -- install with yarn or npm
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && yarn install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- {
  --   "lervag/vimtex",
  --   lazy = false, -- we don't want to lazy load VimTeX
  --   -- tag = "v2.15", -- uncomment to pin to a specific release
  --   init = function()
  --     -- VimTeX configuration goes here, e.g.
  --     vim.g.vimtex_view_method = "zathura"
  --   end,
  -- },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function()
      local luasnip_loader = require("luasnip.loaders.from_vscode")
      luasnip_loader.lazy_load({ paths = { "./snippets" } })
      luasnip_loader.lazy_load()
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      -- manual_mode = true,
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "Makefile", "package.json" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "global",
      datapath = vim.fn.stdpath("data"),
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)
    end,
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        SECTION = { icon = "⇒", color = "default", alt = { "SECTION", "PART" } },
      },
    },
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
  },
}
