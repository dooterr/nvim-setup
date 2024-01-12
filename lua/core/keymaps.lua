vim.g.mapleader = " "

local keymap = vim.keymap


-- ---------- 视觉模式 ---------- ---

-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("v", "p", '"_dp')
keymap.set("v", "P", '"_dP')
keymap.set("v", "tp", 'p')
keymap.set("v", "tP", 'P')

keymap.set("n", "x", '"_x')
keymap.set("n", "X", '"_X')

keymap.set("i", "<c-l>", '<Del>')

-- ---------- 正常模式 ---------- ---

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换窗口
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-l>", "<c-w>l")

-- 用于vim-indent-object
--keymap.set("v", "ai", "aI", {remap=true})
--keymap.set("o", "ai", "aI", {remap=true})
keymap.set("n", "vai", "vaI", {remap=true})
keymap.set("n", "cai", "caI", {remap=true})
keymap.set("n", "dai", "daI", {remap=true})
keymap.set("n", "yai", "yaI", {remap=true})

-- 在当前光标处添加空白行
keymap.set("n", "<CR>", "i<CR><Esc>k$")

-- 在正常模式下插入空行
keymap.set("n", "[<space>", ":pu! _<CR>:']+1<CR>", {silent=true})
keymap.set("n", "]<space>", ":pu _<CR>:'[-1<CR>", {silent=true})

-- ---------- 插件 ---------- ---

