-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.vimtex_view_general_viewer = "sumatraPDF"
-- vim.g.vimtex_view_general_viewer = "Okular"
vim.g.vimtex_view_general_options = "-reuse-instance @pdf"
vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"

-- Create an autocommand group for LaTeX settings
vim.api.nvim_create_augroup("LaTeXSettings", { clear = true })

-- Add an autocommand to enable text wrapping for .tex files
vim.api.nvim_create_autocmd("FileType", {
  group = "LaTeXSettings",
  pattern = "tex",
  callback = function()
    vim.opt_local.wrap = true
  end,
})
-- require("project_nvim").setup({
--   manual_mode = false, -- Automatically detect the project root
--   detection_methods = { "lsp", "pattern" }, -- Use LSP and pattern detection methods
--   patterns = { ".git", "Makefile", "package.json" }, -- Patterns to identify the project root
--   show_hidden = false, -- Do not show hidden files
--   silent_chdir = true, -- Do not print messages when changing directories
--   scope_chdir = "global", -- Change directory globally
--   datapath = vim.fn.stdpath("data"), -- Path to store project data
-- })
