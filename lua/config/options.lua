local set = vim.opt

----- setting colorscheme  -----
-- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | venom
-- vim.cmd([[colorscheme gruvbox-material]])
vim.cmd([[colorscheme bamboo]])

----- Interesting Options -----

-- You have to turn this one on :)
set.inccommand = "split"

-- Best search settings :)
set.smartcase = true
set.ignorecase = true

set.wrap = false
----- Personal Preferences -----
set.relativenumber = true

set.signcolumn = "yes:1"
set.number = true

set.splitbelow = true
set.splitright = true
set.scrolloff = 10

set.shada = { "'10", "<0", "s10", "h" }

-- set the system and nvim clipboard the same
-- opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
set.formatoptions:remove("o")

-- set.wrap = true
set.linebreak = true

set.tabstop = 4
set.shiftwidth = 4

set.colorcolumn = "80"
set.cursorline = true
-- set.cursorcolumn = false

set.listchars = "eol:↲,tab:>-"
set["list"] = true

-- undodir
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- no swapfile
set.swapfile = false

set.conceallevel = 2

vim.opt.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"
