"初期化"
set nocompatible
set autochdir

colorscheme codedark

"カーソルラインハイライト
set cursorline
hi clear CursorLine

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

"windowsの場合powershellにする
if has("win32") || has("win64")
    set shell=powershell
endif

"インサートモードからノーマルの時のイラっとするのを解消する"
set timeout timeoutlen=50

"plugin"
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-bookmark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'buoto/gotests-vim'

call plug#end()

"" vim-airline
" ステータスラインに表示する項目を変更する
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ ['z']
  \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'

let g:airline_theme = 'codedark'
" 変更がなければdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#ale#error_symbol = '×'
let g:airline#extensions#ale#warning_symbol = '⚠'

" タブラインの表示を変更する
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

"Ctrl+nでファイルツリーを表示/非表示する Ctrl+bでブックマーク表示
nnoremap <C-e> :Fern . -reveal=% -drawer -toggle -width=20<CR>
nnoremap <C-b> :Fern bookmark:/// -reveal=% -drawer -toggle -width=20<CR>

"アイコン表示有効化
let g:fern#renderer = 'nerdfont'

" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
