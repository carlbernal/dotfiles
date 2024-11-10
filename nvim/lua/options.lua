local set = vim.opt
vim.g.mapleader = " "

-- platform settings
set.mouse = "nvi"
set.clipboard = "unnamed"
-- set.backspace = 2
set.timeoutlen = 300
set.ttimeoutlen = 50

-- file management
set.hidden = true
set.autoread = true
set.autowriteall = true
set.backupdir:append("$TMPDIR//")
set.directory:append("$TMPDIR//")

-- visuals
set.background = "dark"
set.termguicolors = true
set.showmode = true
set.number = true
set.relativenumber = true
set.scrolloff = 4
set.colorcolumn = "80"
set.cursorline = true
set.laststatus = 2
set.signcolumn = "yes"
set.shortmess:append("WcC")
set.fillchars:append({eob = " "})

-- search
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.wildmenu = true
if vim.fn.executable("rg") == 1 then
  set.grepprg = "rg --vimgrep --smart-case --hidden"
  set.grepformat = "%f:%l:%c:%m"
end

-- spacing
set.smarttab = true
set.expandtab = true
set.autoindent = true
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- -- completion
set.complete:remove("i")
set.completeopt = "menuone,noinsert"
set.pumheight = 6

