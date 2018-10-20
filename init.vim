<" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 10.0

" TODO current problems:
" * end key not working undef tmux+fish

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:
Plug 'https://github.com/wsdjeg/job.vim.git'
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/vim-scripts/yavdb.git'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Better file browser
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'https://gitlab.com/Dica-Developer/vim-jdb'
Plug 'Chiel92/vim-autoformat'
"Plug 'https://github.com/kien/ctrlp.vim.git'

" Class/module browser
Plug 'majutsushi/tagbar'
" TODO known problems:
" * current block not refreshing

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'
Plug 'maxboisvert/vim-local-history'

" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
Plug 'sbdchd/neoformat'
Plug 'https://github.com/rakr/vim-one.git'
Plug 'chriskempson/base16-vim'
Plug 'https://github.com/joshdick/onedark.vim.git'
" Automatically close parenthesis, etc
"Plug 'Townk/vim-autoclose'

" Surround
Plug 'tpope/vim-surround'
Plug 'mikelue/vim-maven-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ivalkeen/nerdtree-execute'
Plug 'mortonfox/nerdtree-reuse-currenttab'
Plug 'xolox/vim-notes'
Plug  'idanarye/vim-merginal'
Plug 'Chiel92/vim-autoformat'

Plug 'mhartington/oceanic-next'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" TODO is there a way to prevent the progress which hides the editor?ced

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" TODO is there a better option for neovim?

" Window chooser
Plug 't9md/vim-choosewin'
Plug 'https://github.com/mbbill/undotree.git'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'
Plug 'https://github.com/yuratomo/dbg.vim.git'
" Generate html in a simple way
Plug 'mattn/emmet-vim'

Plug 'https://github.com/907th/vim-auto-save.git'
" Git integration
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
Plug 'https://github.com/xolox/vim-misc.git'
Plug 'https://github.com/xolox/vim-colorscheme-switcher.git'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
Plug 'https://github.com/yegappan/mru.git'

" Linters
" TODO is it running on save? or when?
" TODO not detecting errors, just style, is it using pylint?

" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
Plug 'myusuf3/numbers.vim'
Plug 'https://github.com/idanarye/vim-vebugger.git', {'branch':'develop'}


" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax on
colorscheme onedark
let g:airline_theme='onedark'

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings


" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash 

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
map <F1> :TagbarToggle<CR>
" autofocus on tagbar open

let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <A-p> :NERDTree<CR>
" open nerdtree with the current file selected
nmap <A-o> :NERDTreeFind<CR>
" don;t show these file types
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" show pending tasks list
map <A-l> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write

" Check code as python3 by default

let g:auto_save = 1  " enable AutoSave on Vim startup


" Fzf ------------------------------

" file finder mapping
nmap <A-k> :Files<CR>
" tags (symbols) in current file finder mapping
nmap <A-h> :BTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tag<CR>
" general code finder in current file mapping
nmap <A-j> :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
nmap ,c :Commands<CR>
" to be able to call CtrlP with default search text
"function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    "execute ':CtrlP' . a:ctrlp_command_end
    "call feedkeys(a:search_text)
"endfunction
" same as previous mappings, but calling with current word as default text
"nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>

let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'alt-z': 'split',
  \ 'alt-u': 'vsplit' }

" Deoplete -----------------------------

" Use deoplete.

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
Plug 'artur-shaik/vim-javacomplete2', { 'branch': 'develop' }

autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)

imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let mapleader="."

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
nmap ,r :Ack 
nmap ,wr :Ack <cword><CR>

" Window Chooser ------------------------------

" mapping
nmap  <A-i>  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
"let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on docs/fancy_symbols.rst)
"if !exists('g:airline_symbols')
   "let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif
" Airline symbols
let g:airline_left_sep = "\uE0C0"
let g:airline_right_sep = "\uE0C2"
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" Airline theme
let g:airline_solarized_bg='dark'

function! Log(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command Log call Log(<q-args>)


:nnoremap <C-e> :Mru<CR>

set hidden
nnoremap <C-Up> :bnext<CR>
nnoremap <C-Down> :bprev<CR>

map <C-q> :tabnew ~/list.txt<CR>
map <C-Left> gT
"imap <C-Left> <ESC>gt<CR>
map <C-Right> gt
"imap <C-Right> <ESC>gT<CR>


nnoremap <C-l> :Autoformat<CR>
nnoremap <t> :sp ~/list.txt<CR>
    let g:vebugger_leader='d'

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let g:airline_theme='deus'

nnoremap <C-F9> :Mvn spring-boot:run -Dspring-boot.run.profiles=local <CR>

nnoremap <F12> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_key_list_select_completion = ['<DOWN>']
let g:ycm_key_list_previous_completion = ['<UP>']
let g:ycm_key_list_stop_completion = ['<Right>','<Esc>']
let g:ycm_key_invoke_completion = '<C-space>'
let g:NERDTreeLimitedSyntax = 1
nnoremap <C-b> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <S-F6> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
set guifont=SauceCodePro\ :h13

let g:dbg#shell_prompt = '> '
let g:vebugger_path_jdb = '/usr/bin/jdb'


nnoremap <A-z> :UndotreeToggl<CR>
nnoremap <C-F7> :call vebugger#jdb#attach('5005',{
        \'srcpath':%:p})


   let g:vebugger_use_tags=1
"au BufEnter *.py :terminal<CR>


" Initialize the list on startup.
if !exists('s:term_list')
  let s:term_list = []
end

function! TermList()
  return copy(s:term_list)
endfunction
augroup term_list_listeners
  autocmd!

  autocmd TermOpen * call <SID>TermAdd()
  autocmd TermClose * call <SID>TermRemove()
augroup END

function! s:TermAdd()
  let term_bufname = expand('<afile>')
  let term_bufnr = bufnr(term_bufname)
  call add(s:term_list, term_bufnr)
endfunction

" Remove a terminal from the list.
function! s:TermRemove()
  let term_bufname = expand('<afile>')
  let term_bufnr = bufnr(term_bufname)
  let term_index = index(s:term_list, term_bufnr)
  call remove(s:term_list, term_index)
endfunction


 au VimEnter *  terminal

