set t_Co=256
set encoding=UTF-8

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'

" themes requirements...
Plug 'arzg/vim-colors-xcode'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/mcchrish/zenbones.nvim'
Plug 'https://github.com/mrkn/mrkn256.vim'

" telescope requirements...
"
" Plug 'nvim-lua/popup.nviml'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

call plug#end()

"Vim interface settings
set number
set autoread
set tabstop=4
set shiftwidth=4
set relativenumber
set encoding=utf-8

syntax on
colorscheme xcodedark
" set background=light
set guifont=Hack:h14
" set guifont=FantasqueSansMono_Nerd_Font:h15 
set linespace=1
let g:solarized_termcolors=256

" ------------------- vim-go.vim configuration --------------------
" use golang language server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" Highlight more info
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" highlight same variable in view
let g:go_auto_sameids = 1
" show type info in statusbar
let g:go_auto_type_info = 1
" disable gd mapping of vim-go
let g:go_def_mapping_enabled = 1
let NERDTreeShowHidden=1

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

" -------------------- vim-go.vim configuration finished --------------------
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$\.DS_Store'

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [ 'coc-json', 'coc-git', 'coc-go', 'coc-yaml', 'coc-json', 'coc-vimlsp', 'coc-rome', 'coc-solargraph' ]

 " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename) 
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

if has("gui_macvim")
"    let macvim_hig_shift_movement = 1
    inoremap <silent><expr> <c-space> coc#refresh()
endif

" Size tab for every lang
autocmd filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd filetype dart setloca shiftwidth=2 tabstop=2 expandtab
autocmd filetype typescript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd filetype php setlocal shiftwidth=4 tabstop=4 expandtab


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval


"Personal shortcuts
nmap <silent> nt :NERDTreeFind<CR>
nmap <silent> s :w<CR>
nmap <silent>rr ciw
nmap <silent>cc :CtrlP<CR>
nmap <silent>bb :e#<CR>
nmap <silent>ff :Files<CR>
nmap <leader>p "+p
