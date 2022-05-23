" runtime path
set runtimepath+=/usr/share/vim/vimfiles
set runtimepath+=~/.config/nvim/Vundle.vim

" call plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'ryanoasis/vim-devicons'
Plugin 'romgrk/barbar.nvim'
call vundle#end()            " required
filetype plugin indent on    " required

" basic settings
set mouse=a
set clipboard+=unnamedplus
set title
set titlestring=NVIM:\ %-25.55F\ %a%r%m titlelen=70

" line number
set number relativenumber
highlight LineNr ctermfg=grey

" git branch functions for statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" statusline
set statusline=\ \\ %f
set statusline+=\ \\ \ 
set statusline+=\ %l/%L
set statusline+=\ \ \\ \ 
set statusline+=\ %p%%
set statusline+=\ \ \\ 
set statusline+=%y\ %m
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \ \
set statusline+=%{StatuslineGit()}
hi StatusLine ctermbg=16 ctermfg=green
hi VertSplit cterm=NONE

" plugin settings
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" shortcuts and automations
nnoremap <C-t> :NERDTreeToggle<CR>
map <esc> :noh<CR>
command PreviewWebsite execute "!chromium --app=file://%:p"
command TexCreate execute "!pdflatex '%' >/dev/null 2>&1" | redraw!
autocmd BufWritePost poem.txt silent! execute "!poemaker '%' >/dev/null 2>&1" | redraw!
