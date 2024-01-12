lua require("plugins.plugins-setup")
lua require("core.options")
lua require("core.keymaps")

"""""""" 插件 """"""""""""
lua require("plugins/comment")
lua require("plugins/vim-im-select")

" 关闭自动注释插入
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 解决中文乱码问题
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Get folding working with vscode neovim plugin
" The downside with this is that navigating through folds is broken while recording a macro.
if(exists("g:vscode"))
	nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
	nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
	nnoremap zc :call VSCodeNotify('editor.fold')<CR>
	nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
	nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
	nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
	nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
	
	function! MoveCursor(direction) abort
		if(reg_recording() == '' && reg_executing() == '')
			return 'g'.a:direction
		else
			return a:direction
		endif
	endfunction
	
	nmap <expr> j MoveCursor('j')
	nmap <expr> k MoveCursor('k')
endif

if(exists("g:vscode"))
	nnoremap L :call VSCodeNotify('workbench.action.nextEditor')<CR>
	nnoremap H :call VSCodeNotify('workbench.action.previousEditor')<CR>
	nnoremap ge :call VSCodeNotify('editor.action.marker.next')<CR>
	nnoremap <c-w>c :call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>
endif


