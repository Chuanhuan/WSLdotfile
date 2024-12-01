return {
  "luk400/vim-jukit",

  init = function()
    -- Split Window Management
    vim.keymap.set(
      "n",
      "<localleader>os",
      "<cmd>call jukit#splits#output()<cr>",
      { desc = "Open output window and execute shell command" }
    )
    vim.keymap.set(
      "n",
      "<localleader>ts",
      "<cmd>call jukit#splits#term()<cr>",
      { desc = "Open output window without command" }
    )
    vim.keymap.set(
      "n",
      "<localleader>hs",
      "<cmd>call jukit#splits#history()<cr>",
      { desc = "Open output-history window" }
    )
    vim.keymap.set(
      "n",
      "<localleader>ohs",
      "<cmd>call jukit#splits#output_and_history()<cr>",
      { desc = "Open output and history windows" }
    )
    vim.keymap.set(
      "n",
      "<localleader>hd",
      "<cmd>call jukit#splits#close_history()<cr>",
      { desc = "Close history window" }
    )
    vim.keymap.set(
      "n",
      "<localleader>od",
      "<cmd>call jukit#splits#close_output_split()<cr>",
      { desc = "Close output window" }
    )
    vim.keymap.set(
      "n",
      "<localleader>ohd",
      "<cmd>call jukit#splits#close_output_and_history(1)<cr>",
      { desc = "Close both windows" }
    )
    vim.keymap.set(
      "n",
      "<localleader>sl",
      "<cmd>call jukit#layouts#set_layout()<cr>",
      { desc = "Apply layout to splits" }
    )

    -- Output Navigation and Display
    vim.keymap.set(
      "n",
      "<localleader>so",
      "<cmd>call jukit#splits#show_last_cell_output(1)<cr>",
      { desc = "Show current cell output" }
    )
    vim.keymap.set(
      "n",
      "<localleader>j",
      "<cmd>call jukit#splits#out_hist_scroll(1)<cr>",
      { desc = "Scroll down in history" }
    )
    vim.keymap.set(
      "n",
      "<localleader>k",
      "<cmd>call jukit#splits#out_hist_scroll(0)<cr>",
      { desc = "Scroll up in history" }
    )
    vim.keymap.set(
      "n",
      "<localleader>ah",
      "<cmd>call jukit#splits#toggle_auto_hist()<cr>",
      { desc = "Toggle auto output display" }
    )

    -- Code Execution
    vim.keymap.set(
      "n",
      "<localleader><space>",
      "<cmd>call jukit#send#section(0)<cr>",
      { desc = "Execute current cell" }
    )
    vim.keymap.set("n", "<CR>", "<cmd>call jukit#send#line()<cr>", { desc = "Execute current line" })
    vim.keymap.set("v", "<CR>", ":<C-U>call jukit#send#selection()<cr>", { desc = "Execute selected code" })
    vim.keymap.set(
      "n",
      "<localleader>cc",
      "<cmd>call jukit#send#until_current_section()<cr>",
      { desc = "Execute until current cell" }
    )
    vim.keymap.set("n", "<localleader>all", "<cmd>call jukit#send#all()<cr>", { desc = "Execute all cells" })

    -- Cell Management
    vim.keymap.set(
      "n",
      "<localleader>co",
      "<cmd>call jukit#cells#create_below(0)<cr>",
      { desc = "Create code cell below" }
    )
    vim.keymap.set(
      "n",
      "<localleader>cO",
      "<cmd>call jukit#cells#create_above(0)<cr>",
      { desc = "Create code cell above" }
    )
    vim.keymap.set(
      "n",
      "<localleader>ct",
      "<cmd>call jukit#cells#create_below(1)<cr>",
      { desc = "Create text cell below" }
    )
    vim.keymap.set(
      "n",
      "<localleader>cT",
      "<cmd>call jukit#cells#create_above(1)<cr>",
      { desc = "Create text cell above" }
    )
    vim.keymap.set("n", "<localleader>cd", "<cmd>call jukit#cells#delete()<cr>", { desc = "Delete current cell" })
    vim.keymap.set("n", "<localleader>cs", "<cmd>call jukit#cells#split()<cr>", { desc = "Split current cell" })
    vim.keymap.set(
      "n",
      "<localleader>cM",
      "<cmd>call jukit#cells#merge_above()<cr>",
      { desc = "Merge with cell above" }
    )
    vim.keymap.set(
      "n",
      "<localleader>cm",
      "<cmd>call jukit#cells#merge_below()<cr>",
      { desc = "Merge with cell below" }
    )
    vim.keymap.set("n", "<localleader>ck", "<cmd>call jukit#cells#move_up()<cr>", { desc = "Move cell up" })
    vim.keymap.set("n", "<localleader>cj", "<cmd>call jukit#cells#move_down()<cr>", { desc = "Move cell down" })

    -- Cell Navigation
    vim.keymap.set(
      "n",
      "<localleader>J",
      "<cmd>call jukit#cells#jump_to_next_cell()<cr>",
      { desc = "Jump to next cell" }
    )
    vim.keymap.set(
      "n",
      "<localleader>K",
      "<cmd>call jukit#cells#jump_to_previous_cell()<cr>",
      { desc = "Jump to previous cell" }
    )

    -- Output Management
    vim.keymap.set(
      "n",
      "<localleader>ddo",
      "<cmd>call jukit#cells#delete_outputs(0)<cr>",
      { desc = "Delete current cell output" }
    )
    vim.keymap.set(
      "n",
      "<localleader>dda",
      "<cmd>call jukit#cells#delete_outputs(1)<cr>",
      { desc = "Delete all cell outputs" }
    )

    -- File Conversion
    vim.keymap.set(
      "n",
      "<localleader>np",
      '<cmd>call jukit#convert#notebook_convert("jupyter-notebook")<cr>',
      { desc = "Convert between ipynb/py" }
    )
    vim.keymap.set(
      "n",
      "<localleader>ht",
      '<cmd>call jukit#convert#save_nb_to_file(0,1,"html")<cr>',
      { desc = "Convert to HTML" }
    )
    vim.keymap.set(
      "n",
      "<localleader>rht",
      '<cmd>call jukit#convert#save_nb_to_file(1,1,"html")<cr>',
      { desc = "Convert to HTML (rerun cells)" }
    )
    vim.keymap.set(
      "n",
      "<localleader>pd",
      '<cmd>call jukit#convert#save_nb_to_file(0,1,"pdf")<cr>',
      { desc = "Convert to PDF" }
    )
    vim.keymap.set(
      "n",
      "<localleader>rpd",
      '<cmd>call jukit#convert#save_nb_to_file(1,1,"pdf")<cr>',
      { desc = "Convert to PDF (rerun cells)" }
    )

    -- Display Settings
    vim.keymap.set(
      "n",
      "<localleader>pos",
      "<cmd>call jukit#ueberzug#set_default_pos()<cr>",
      { desc = "Set überzug window position" }
    )
    vim.g.jukit_shell_cmd = "ipython3"
    vim.g.jukit_terminal = "kitty"
  end,
}
