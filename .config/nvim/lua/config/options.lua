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

-- Create an autocommand group for Markdown settings
vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })

-- Add an autocommand to enable text wrapping for .md files
vim.api.nvim_create_autocmd("FileType", {
  group = "MarkdownSettings",
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- Function to open PDF with SumatraPDF
local function open_pdf_with_sumatra(pdf_path)
  -- Command to open PDF with SumatraPDF in the background and suppress logs
  local command = 'sumatrapdf "' .. pdf_path .. '" &> /dev/null &'
  os.execute(command)
end

-- Autocommand to open PDF files with SumatraPDF
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pdf",
  callback = function()
    local pdf_path = vim.fn.expand("%:p")
    open_pdf_with_sumatra(pdf_path)
    vim.cmd("bd!") -- Close the buffer after opening the PDF
  end,
})
