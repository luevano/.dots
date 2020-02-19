"
" ~/.config/nvim/init.vim
"

""---Auto installs vim-plug---""
" let autoload_plug_path='~/.config/nvim/autoload/plug.vim'
" if !filereadable(autoload_plug_path)
"	echo "Downloading junegunn/vim-plug to manage plugins..."
"	silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
"		\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
"	autocmd VimEnter * PlugInstall
" endif
" unlet autoload_plug_path

""---Loads plugins---""
	call plug#begin('~/.config/nvim/plugged')
		Plug 'mboughaba/i3config.vim'
		Plug 'junegunn/goyo.vim'
		" Plug 'preservim/nerdtree'
		" Plug 'Xuyuanp/nerdtree-git-plugin'
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'mhinz/vim-signify'
		" TeX
		Plug 'lervag/vimtex'
		Plug 'KeitaNakamura/tex-conceal.vim'
		" Python
		Plug 'tmhedberg/SimpylFold'
		Plug 'vim-scripts/indentpython.vim'
		Plug 'Valloric/YouCompleteMe'
		Plug 'jmcantrell/vim-virtualenv'
		Plug 'Yggdroot/indentLine'
		Plug 'vim-syntastic/syntastic'
		Plug 'nvie/vim-flake8'
	call plug#end()
	"" Commands for plug.
	" PlugInstall [name ...] [#threads]		Install plugins
	" PlugUpdate [name ...] [#threads]		Install or update plugins
	" PlugClean[!]							Remove unlisted plugins (bang version will clean without prompt)
	" PlugUpgrade							Upgrade vim-plug itself
	" PlugStatus							Check the status of plugins
	" PlugDiff								Examine changes from the previous update and the pending changes
	" PlugSnapshot[!] [output path]			Generate script for restoring the current snapshot of the plugins

""---Basic configuration---""
	" Leader key
	let mapleader='\'
	set showcmd

	" Basic
	set encoding=utf-8
	" set bg=dark
	syntax on
	set number relativenumber
	set clipboard+=unnamedplus

	" Custom colors/highlights
	highlight BadWhitespace ctermbg=red

	" Indentation
	filetype plugin indent on
	set tabstop=4
	set shiftwidth=4

	" Spell checking
	autocmd FileType tex setlocal spell
	set spelllang=es_mx,en_us

	" Folding
	set foldmethod=indent
	set foldlevel=99

	" Exclusively for python
	au BufNewFile,BufRead *.py
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set shiftwidth=4 |
		\ set textwidth=79 |
		\ set expandtab |
		\ set fileformat=unix |
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
	let python_highlight_all=1

	" Listchars
	set showbreak=↪\
	set listchars=eol:↲,nbsp:␣,tab:»\ ,trail:•,precedes:⟨,extends:⟩

	" Buffers.
	nnoremap gb :ls<CR>:buffer<Space>

""---Custom functions---""
	" Toggle spellchecking
	function! ToggleSpellCheck()
		set spell!
		if &spell
			echo "Spellcheck ON"
		else
			echo "Spellcheck OFF"
		endif
	endfunction

	" Toggle listchars
	function! ToggleListChars()
		set list!
		if &list
			echo "Listchars ON"
		else
			echo "Listchars OFF"
		endif
	endfunction

""---Plugin configuration---""
	" vim-airline
	let g:airline_powerline_fonts=1

	" vim-airline-themes
	let g:airline_theme='solarized'

	" vim-signify
	set updatetime=100

	" vimtex
	let g:tex_flavor='latex'
	let g:vimtex_view_method=$READER
	let g:vimtex_quickfix_mode=0

	" tex-conceal
	set conceallevel=2
	let g:tex_conceal="abdgm"

	" NERDTree
	" let g:NERDTreeShowHidden=1
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

	" SympylFold
	let g:SympylFold_docstring_preview=1

	" YouCompleteMe
	let g:ycm_autoclose_preview_window_after_completion=1

	" syntastic
	" set statusline+=%#warningmsg#
	" set statusline+=%{SyntasticStatuslineFlag()}
	" set statusline+=%*
	let g:syntastic_always_populate_loc_list=1
	let g:syntastic_auto_loc_list=1
	let g:syntastic_check_on_open=1
	let g:syntastic_check_on_wq=0

""---Keybindings---""
	" Reload vim
	nmap <F5> :source ~/.config/nvim/init.vim<CR>

	" Toggle relative line number
	nmap <F2> :set number invrelativenumber<CR>

	" Toggle NERDTree
	" nmap <C-n> :NERDTreeToggle<CR>

	" Toggle Goyo
	nmap <F8> :Goyo<CR>

	" Split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	" Spell checking
	map <Leader>s :call ToggleSpellCheck()<CR>

	" List chars
	map <Leader>c :call ToggleListChars()<CR>

	" Enable folding with the spacebar
	nnoremap <Space> za

	" YouCompleteMe
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
