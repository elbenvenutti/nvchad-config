require "nvchad.mappings"
local map = vim.keymap.set

-- folding
map("n", "<leader>zi", ":setlocal foldmethod=indent<CR>", {desc = "Folding Set foldmethod indent"})
map("n", "<leader>zs", ":setlocal foldmethod=expr<CR>:setlocal foldexpr=nvim_treesitter#foldexpr()<CR>", {desc = "Folding Set foldmethod expr + treesitter"})
map("n", "<leader>zm", ":setlocal foldmethod=manual<CR>", {desc = "Folding Set foldmethod manual"})

-- tabs
map("n", "]w", ":tabnext<CR>", {desc = "Tabs Next tab"})
map("n", "[w", ":tabnext<CR>", {desc = "Tabs Previous tab"})

-- motions
map("n", "00", "^", {desc = "Other Go to first nonspace character"})
map("n", "<C-i>", "<C-i>", { noremap = true })

map("i", ":w<CR>", "<esc>:w<CR>")
map("i", ":wq<CR>", "<esc>:wq<CR>")

vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")

local nvim_tmux_nav = require("nvim-tmux-navigation")

map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)

vim.keymap.del("n", "<leader>x")
vim.keymap.del("n", "<tab>")
vim.keymap.del("n", "<S-tab>")
-- 
-- telescope
map("n", "<c-p>", "<cmd> Telescope find_files <CR>", {desc = "Telescope Find files"})
map("n", "gr", "<cmd> Telescope lsp_references <CR>", {desc = "Telescope LSP references"})
map("n", "<leader>fd", "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", {desc = "Telescope LSP dynamic workspace symbols"})

map("n", "<leader>u", "<cmd> UndotreeToggle <CR>", {desc = "UndoTree Toggle UndoTree"})
 
map("n", "<leader>xx", function() require("trouble").toggle() end, {desc = "Trouble toggle trouble"})
map("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, {desc = "Trouble Workspace diagnostics"})
map("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end, {desc = "Trouble Document diagnostics"})
map("n", "<leader>xq", function() require("trouble").open("quickfix") end, {desc = "Trouble Quickfix list"})
map("n", "<leader>xl", function() require("trouble").open("loclist") end, {desc = "Trouble Location list"})
 
map("n", "<leader>ra", function() vim.lsp.buf.rename() end, {desc = "LSP rename"})
map("n", "<leader>i", function()
  vim.g.inlay_hints_visible = true
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})
end, {desc = "LSP Toggle Inlay Hints"})

map("n", "gD", function() vim.lsp.buf.declaration() end, {desc = "LSP Go to declaration"})
map("n", "gd", function() vim.lsp.buf.definition() end, {desc = "LSP Go to definition"})
map("n", "K", function() vim.lsp.buf.hover() end, {desc = "LSP Hover"})
map("n", "gi", function() vim.lsp.buf.implementation() end, {desc = "LSP Go to implementation"})
map("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, {desc = "LSP Signature help"})

map("n", "<leader>D", function() vim.lsp.buf.type_definition() end, {desc = "LSP Definition type"})
map({"n", "v"}, "<leader>ca", function() vim.lsp.buf.code_action() end, {desc = "LSP Code action"})
map("n", "gr", function() vim.lsp.buf.references() end, {desc = "LSP Rreferences"})
map("n", "<leader>lf", function() vim.diagnostic.open_float { border = "rounded" } end, {desc = "LSP Floating diagnostic"})
map("n", "<leader>q", function() vim.diagnostic.setloclist() end, {desc = "LSP Diagnostic setloclist"})
map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, {desc = "LSP Add workspace folder"})
map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, {desc = "LSP Remove workspace folder"})
map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, {desc = "LSP List workspace folders"})
map("n", "<leader>ra", function() vim.lsp.buf.rename() end, {desc = "LSP rename"})
map("n", "<leader>i", function()
  vim.g.inlay_hints_visible = true
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})
end, {desc = "LSP Toggle Inlay Hints"})
 
map("n", "<leader>o", "<cmd> Outline <CR>", {desc = "Outline Toggle Outline"})
 
map("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, {desc = "Neotest Run File"})
map("n", "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, {desc = "Neotest Run All Test Files"})
map("n", "<leader>tr", function() require("neotest").run.run() end, {desc = "Neotest Run Nearest"})
map("n", "<leader>tl", function() require("neotest").run.run_last() end, {desc = "Neotest Run Last"})
map("n", "<leader>ts", function() require("neotest").summary.toggle() end, {desc = "Neotest Toggle Summary"})
map("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, {desc = "Neotest Show Output"})
map("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, {desc = "Neotest Toggle Output Panel"})
map("n", "<leader>tS", function() require("neotest").run.stop() end, {desc = "Neotest Stop"})
