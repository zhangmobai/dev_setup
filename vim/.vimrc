set number
map f ma[[k"xy$`a:echo @x<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
"set splitright set autoindent set cindent set hlsearch
set hlsearch
set ruler
set backspace=indent,eol,start
function! SearchWord(word)
    let @/ = '\<' . a:word . '\>'
    normal n
endfunction
command! -nargs=1 SearchWord call SearchWord(<f-args>)
nmap ? :SearchWord 
colorscheme candy
"colorscheme blackboard
filetype on
filetype plugin on
let g:ctags_statusline = 2
let g:ctags_title = 1
let generate_tags = 1
let g:ctags_regenerate = 1

nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :TlistShowPrototype<CR>
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
"set statusline=[%n]\ %<%f\ %([%1*%M%*%R%Y]%)\ \ \ [%{Tlist_Get_Tagname_By_Line()}]\ %=%-19(\LINE\ [%l/%L]\ COL\ [%02c%03V]%)\ %P
"set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)

function! ToggleMaxWins()
	if exists('g:windowMax')
		au! maxCurrWin
		wincmd =
		unlet g:windowMax
	else
		augroup maxCurrWin
		" au BufEnter * wincmd _ | wincmd |
		" only max it vertically
			au! WinEnter * wincmd _
		augroup END
		do maxCurrWin WinEnter
		let g:windowMax=1
	endif
endfunction
nnoremap <F10> :call ToggleMaxWins()<CR>
syntax on
filetype indent plugin on
set autoindent
set smartindent
set dir=/tmp
set swapsync=
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set encoding=utf-8
autocmd FileType javascript setlocal sw=2 sts=2 et
syntax enable
autocmd FileType java set expandtab shiftwidth=4 softtabstop=4
