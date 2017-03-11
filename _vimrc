if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yahatashunta/.vim/bundle/repos/github.com/Shougo/dein.vim
set number
set hidden

nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

autocmd QuickFixCmdPost *grep* cwindow

colorscheme molokai
Plug 'othree/yajs.vim'            " es6のハイライト
Plug 'othree/es.next.syntax.vim'  " stage-0 のsyntax highlight
Plug 'mxw/vim-jsx'                " jsxのハイライト


set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
" vim-jsx用の設定
let g:jsx_ext_required = 1        " ファイルタイプがjsxのとき読み込む．
let g:jsx_pragma_required = 0     " @から始まるプラグマでは読み込まない．

augroup Vimrc
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
""""""""""""""""""""""""""""""
"タブ、インデント
""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set softtabstop=4
set smartindent
""""""""""""""""""""""""""""""
" 検索周り
""""""""""""""""""""""""""""""
set incsearch
set ignorecase
set smartcase
set hlsearch
"""""""""""""""""""""""""""""""
" カッコ・タグジャンプ
""""""""""""""""""""""""""""""
set showmatch
source $VIMRUNTIME/macros/matchit.vim
"""""""""""""""""""""""""""""""
" コマンド補完
""""""""""""""""""""""""""""""
set wildmenu wildmode=list:full
set history=5000
""""""""""""""""""""""""""""""
"ステータスラインの設定
""""""""""""""""""""""""""""""
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
""""""""""""""""""""""""""""""
"カラースキームmolokai
""""""""""""""""""""""""""""""
if neobundle#is_installed('molokai') " molokaiがインストールされていれば
    colorscheme molokai " カラースキームにmolokaiを設定する
endif

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける
""""""""""""""""""""""""""""""
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""
" htmlタグ自動補完
""""""""""""""""""""""""""""""
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
""""""""""""""""""""""""""""""
" Required:
call dein#begin('/Users/yahatashunta/.vim/bundle')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('tomasr/molokai')                             " カラースキーマ
call dein#add('Shougo/neosnippet.vim')                      " スニペット
call dein#add('Shougo/neosnippet-snippets')                 " スニペット
call dein#add('tomtom/tcomment_vim')                        " コメントアウト
call dein#add('vim-scripts/AnsiEsc.vim')                    " ログファイルに色をつける
call dein#add('Yggdroot/indentLine')
call dein#add('itchyny/lightline.vim')                      " ステータスラインのカスタマイズ
call dein#add('bronson/vim-trailing-whitespace')            " インデント可視化
call dein#add('tpope/vim-fugitive')                         " vimからgitいじれる
call dein#add('othree/yajs.vim')                            " es6のハイライト
call dein#add('othree/es.next.syntax.vim')                  " stage-0 のsyntax highlight
call dein#add('mxw/vim-jsx')                                " jsxのハイライト
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
