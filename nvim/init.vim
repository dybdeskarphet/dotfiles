"    .             
" ._ |. . _ *._  __
" [_)|(_|(_]|[ )_) 
" |      ._|       
"
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
call plug#end()

"" coc configurations
let g:coc_notify_warning_sign = '!'
""" confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
""" scroll through completions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" indent char
let g:indentLine_char = '╎'
""" ff
nnoremap <C-P> <cmd>Telescope find_files<cr>

" .               
" |_  _. __* _. __
" [_)(_]_) |(_._) 
"                 
set mouse=a
set clipboard+=unnamedplus
set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70
set number relativenumber

" git branch functions for statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" colors
hi StatusLine ctermbg=16 ctermfg=magenta
hi VertSplit cterm=NONE
hi Pmenu ctermbg=magenta ctermfg=16
hi LineNr ctermbg=234 ctermfg=grey
hi SignColumn ctermbg=none
hi Normal ctermbg=16
hi SpellBad cterm=underline ctermfg=red ctermbg=NONE
hi Search ctermfg=234 ctermbg=yellow
hi CocErrorSign ctermfg=16 ctermbg=red 
hi CocWarningSign ctermfg=16 ctermbg=yellow
hi CocHintSign ctermfg=16 ctermbg=blue
hi CocInfoSign ctermfg=16 ctermbg=blue

" shortcuts and automations
map <esc> :noh<CR>
" autocmd FileType mediawiki set spell spelllang=tr
command CheckSpell set spell spelllang=tr
command PreviewWebsite execute "!firefox --new-window=file://%:p"
command TexCreate execute "!pdflatex '%' >/dev/null 2>&1" | redraw!
command CreatePoem execute "!poemaker '%' >/dev/null 2>&1" | redraw!

" create parent dirs on write (W)
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W call WriteCreatingDirs()

"     ,     ,       .       
"  __-+- _.-+-. . __|*._  _ 
" _)  | (_] | (_|_) ||[ )(/,
"                           
set statusline=\ \\ %f
set statusline+=\ \\ \ 
set statusline+=\ %l/%L
set statusline+=\ \ \\ \ 
set statusline+=\ %p%%
set statusline+=\ \ \\ 
set statusline+=%y\ %m
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \ \
set statusline+=%{StatuslineGit()}
