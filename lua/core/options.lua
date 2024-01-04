local opt=vim.opt

opt.number = true                      --显示行号，缩写：set nu
opt.relativenumber = true              --设置相对行号，缩写：set rnu

-- 字符一行显式
opt.wrap = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

opt.wrap = true
opt.linebreak=true


