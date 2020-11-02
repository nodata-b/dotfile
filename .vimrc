"初期化"
set nocompatible

set background=dark
autocmd ColorScheme * highlight LineNr ctermfg=245
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

"カーソル行の背景色を変える"
set cursorline

"右のスクロールバー非表示"
set guioptions+=R

nnoremap ; :
nnoremap : ;

"ヤンクでクリップボードにコピー"
set clipboard=unnamed,autoselect

"構文毎に文字色変化"
syntax on

"移動ショートカット"
"nnoremap s <Nop>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-W> <C-W>w

"ファイル上書き前にバックアップを作成する"
set backup
set backupdir=~/.vim/tmp/
set backupext=.back

"ビジュアルモード時に矩形選択時に仮想編集する"
set virtualedit=block

"検索時にハイライトする"
set hlsearch

"削除した時にヤンクしない"
nnoremap x "_X

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

"インデントの幅設定"
set shiftwidth=4

"タブや改行表示"
set tabstop=4
set expandtab
set shiftwidth=4
set list
set listchars=tab:^\ ,trail:~

"前タブに移動"
nnoremap gr:tabprevious

"新しいウィンドウを右に開く"
set splitright

"対応する括弧を強調表示"
set showmatch matchtime=1

"コマンドをステータス行に表示"
set showcmd
set cmdheight=1

"ESC2回押すとハイライトを消す"
nnoremap <C-[><C-[> :noh<CR>

"モードによってカーソルタイプを変更する"
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"インサートモードからノーマルの時のイラっとするのを解消する"
set timeout timeoutlen=50

"vunble"
 filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"NERDtree"
Plugin 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinPos = "left"
" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif

nmap <Plug>NERDTree <Nop>
"map <Plug>NERDTree :s <Nop>

"NERDtreetabs"
Plugin 'jistr/vim-nerdtree-tabs'
" デフォルトでツリー表示
let g:nerdtree_tabs_open_on_console_startup=1

"vim-airline"
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#error_symbol = '×'
let g:airline#extensions#ale#warning_symbol = '⚠'
"Airlineでタブ移動"
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

"quickrun"
Plugin 'thinca/vim-quickrun'

"syntastic"
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntasticmodemap = { 'mode': 'active', 'active_filetypes': [
  \ 'ruby', 'javascript','coffee','html', 'css', 'scss', 'haml', 'slim', 'sh',
  \ 'spec', 'vim', 'zsh', 'sass', 'eruby'] }
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_error_symbol='×'
let g:syntastic_style_error_symbol = '×'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
"syntastic php"
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'

let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "gofmt"
let g:go_null_module_warning = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

"phpfmt"
Plugin 'beanworks/vim-phpfmt'
let g:phpfmt_standard = 'PSR2'

"gitgutter"
Plugin 'airblade/vim-gitgutter'
set updatetime=250

"vim-go"
Plugin 'fatih/vim-go'

"sonictemplate"
Plugin 'mattn/sonictemplate-vim'

"easymotion"
Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)

"Lsp"
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'natebosch/vim-lsc'
Plugin 'mattn/vim-lsp-settings'
let g:lsp_async_completion = 1

"go"
if executable('golsp')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif

"html"
if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'html-languageserver',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
    \ 'whitelist': ['html'],
  \ })
endif

"php"
au User lsp_setup call lsp#register_server({
    \ 'name': 'intelephense',
    \ 'cmd': {server_info->['node', expand('PATH_TO_GLOBAL_NODE_MODULES/intelephense/lib/intelephense.js'), '--stdio']},
    \ 'initialization_options': {"storagePath": "PATH_TO_TEMP_FOLDER/intelephense"},
    \ 'whitelist': ['php'],
    \ 'workspace_config': { 'intelephense': {
    \   'files.associations': ['*.php'],
    \ }},
    \ })

"vim-closetag"
Plugin 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.vue,*.php'
