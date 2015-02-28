set nocompatible

syntax on

filetype indent plugin on
set cindent
set autoindent
set ts=4
set sts=0
set sw=4
set noet

"colorscheme ansi_blows
colorscheme seoul256

nmap <F5> :make<CR>
map <F6> :cn<CR>
map <F7> :cp<CR>

set tabstop=4
set filetype=c
filetype indent on
set nu
set title
set ruler
set paste
" backspace setting
set backspace=indent,eol,start
set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
"case-insensitive search
set ignorecase

vmap <Tab> >gv
vmap <S-Tab> <gv

nnoremap <silent> ,mk :mak<CR>:copen<CR>
nnoremap <silent> <F5> :copen<CR>
nnoremap <silent> <F6> :cn<CR>
nnoremap <silent> <F7> :cN<CR>
nnoremap <silent> <F8> :cclose<CR>
nnoremap <silent> ,ov :e ~/.vimrc<CR>
nnoremap <silent> ,om :e ./Makefile.am<CR>
"inoremap { {}<LEFT>
set fileencodings=utf-8,euc-kr
autocmd BufEnter * lcd %:p:h

"============ ctags config ============
set tags=./tags
set tags+=~/sources/tags

if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

func! Sts()
let st = expand("<cword>")
exe "sts ".st
endfunc

nmap ,st :call Sts()<cr>


func! Tj()
let st = expand("<cword>")
exe "tj ".st
endfunc

nmap ,tj :call Tj()<cr>




"============ cscope config ============
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb


" add any database in current directory
if filereadable("./cscope.out")
    cs add cscope.out
" else add database pointed to by environment
else
    cs add /root/xen-3.2.0/cscope.out
"    cs add /DATA/Codec/ffmpeg-checkout-2007-01-19/cscope.out
endif
set csverb



func! Css()
let css = expand("<cword>")
new
exe "cs find s ".css
if getline(1) == ""
exe "q!"
endif
endfunc

nmap ,css :call Css()<cr>



func! Csc()
let csc = expand("<cword>")
new
exe "cs find c ".csc
if getline(1) == ""
exe "q!"
endif
endfunc

nmap ,csc :call Csc()<cr>



func! Csd()
let csd = expand("<cword>")
new
exe "cs find d ".csd
if getline(1) == ""
exe "q!"
endif
endfunc

nmap ,csd :call Csd()<cr>



func! Csg()
let csg = expand("<cword>")
new
exe "cs find g ".csg
if getline(1) == ""
exe "q!"
endif
endfunc

nmap ,csg :call Csg()<cr>


func! Cst()
let cst = expand("<cword>")
new
exe "cs find t ".cst
if getline(1) == ""
exe "q!"
endif
endfunc

nmap ,cst :call Cst()<cr>

" exe "!cd ~/APCPMS/Src; ctags -R;
func! MakeTags()
let cst = expand("<cword>")
new
exe "!cd ~/sources/;      ctags -h [\".scala\"] -R --exclude=*.js,target;"
if getline(1) == ""
exe "q!"
endif
endfunc

nmap ,mt :call MakeTags()<cr>

func! OpenVimRc()
exe "e ~/.vimrc"
endfunc


nmap ,vc :call OpenVimRc()<cr>

" au BufWritePost .c, .cpp, *.h silent! !cd ~/APCPMS/Src; ctags -R &
"
"

"""""""" autocomplete """""""""""""""

function! Smart_TabComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction


"inoremap <c-r>=Smart_TabComplete()<cr>

hi Pmenu ctermbg=blue
hi PmenuSel ctermbg=yellow ctermfg=black
hi PmenuSbar ctermbg=blue


"set encoding=cp949 termencoding=utf-8
"set fencs=cp949,utf-8

set autoindent
set paste

" call pathogen
call pathogen#infect()
call pathogen#helptags()




map <silent> ,nn :NERDTreeFocus<CR>
map <silent> ,nm :NERDTreeToggle<CR>
"map <silent> <C-v> :NERDTreeToggle<CR>
"map <silent> <C-v> :NERDTreeToggle<CR>



