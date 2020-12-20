"
" ~/.config/nvim/init.vim
"
let mapleader=','
set showcmd

""---Auto installs vim-plug---""
" let autoload_plug_path='~/.config/nvim/autoload/plug.vim'
" if !filereadable(autoload_plug_path)
" 	echo "Downloading junegunn/vim-plug to manage plugins..."
" 	silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
" 				\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
" 	autocmd VimEnter * PlugInstall
" endif
" unlet autoload_plug_path

""---Loads plugins---""
	call plug#begin('~/.config/nvim/plugged')
		" Color schemes
		" Plug 'altercation/vim-colors-solarized'
		Plug 'dracula/vim'
		Plug 'chrisbra/Colorizer'
			let g:colorizer_colornames = 0

		" Other
		Plug 'baskerville/vim-sxhkdrc'
		Plug 'mboughaba/i3config.vim'
		Plug 'junegunn/goyo.vim'
		Plug 'preservim/nerdtree'
			let g:NERDTreeShowHidden=1
			autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

		"Airline
		Plug 'vim-airline/vim-airline'
			let g:airline_powerline_fonts=1
		Plug 'vim-airline/vim-airline-themes'
			let g:airline_theme='dracula'

		" Git
		Plug 'Xuyuanp/nerdtree-git-plugin'
		Plug 'mhinz/vim-signify'
			set updatetime=100

		"Auto completion
		Plug 'Valloric/YouCompleteMe'
			let g:ycm_autoclose_preview_window_after_completion=1

		" TeX
		Plug 'lervag/vimtex'
			let g:tex_flavor='latex'
			let g:vimtex_view_method=$READER
			let g:vimtex_quickfix_mode=0
		Plug 'KeitaNakamura/tex-conceal.vim'
			set conceallevel=2
			let g:tex_conceal="abdgm"

		" Markdown/pandoc
		Plug 'vim-pandoc/vim-pandoc'
		Plug 'vim-pandoc/vim-pandoc-syntax'

		" Python
		Plug 'tmhedberg/SimpylFold'
			let g:SympylFold_docstring_preview=1
		Plug 'vim-scripts/indentpython.vim'
		" Plug 'jmcantrell/vim-virtualenv'
		" Plug 'Yggdroot/indentLine'
		" No longer needed as synstastic includes flake8 linter.
		" Plug 'nvie/vim-flake8'

		" Java
		Plug 'uiiaoo/java-syntax.vim'
		" If variable highlighting should be disabled
		" highlight link JavaIdentifier NONE

		" Syntax
		Plug 'vim-syntastic/syntastic'
			set statusline+=%#warningmsg#
			set statusline+=%{SyntasticStatuslineFlag()}
			set statusline+=%*
			let g:syntastic_always_populate_loc_list=1
			let g:syntastic_auto_loc_list=1
			let g:syntastic_check_on_open=1
			let g:syntastic_check_on_wq=0
			let g:syntastic_tex_checkers=['chktex']
			" let g:syntastic_tex_lacheck_quiet_messages = {'regex': '\Vpossible unwanted space at'}
			let g:syntastic_tex_chktex_quiet_messages = {'level': 'warnings'}

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
	syntax enable
	set background=dark
	colorscheme dracula
	" Just so alacritty can use transparency.
	hi Normal ctermbg=NONE
	set title
	set encoding=utf-8
	set number relativenumber
	set cursorline
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
		\ set fileformat=unix
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

	" Listchars
	set showbreak=↪\
	set listchars=eol:↲,nbsp:␣,tab:»\ ,trail:•,precedes:⟨,extends:⟩

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

""---Vanilla vim keybindings---""
	" Reload vim
	nmap <F5> :source ~/.config/nvim/init.vim<CR>

	" Toggle relative line number
	nmap <F2> :set number invrelativenumber<CR>

	" Buffers
	nnoremap gb :ls<CR>:buffer<Space>
	nmap <Leader>a :badd<Space>
	nmap <Leader>l :ls<CR>

	" Split navigation
	nmap <C-h> <C-w>h
	nmap <C-j> <C-w>j
	nmap <C-k> <C-w>k
	nmap <C-l> <C-w>l
	nnoremap <C-left> :vertical resize -5<cr>
	nnoremap <C-down> :resize +5<cr>
	nnoremap <C-up> :resize -5<cr>
	nnoremap <C-right> :vertical resize +5<cr>

	" Tab manipulation
	nmap <Leader>t :tabe<CR>
	nmap <Leader>y :tabclose<CR>

	" Enable folding with the spacebar
	nnoremap <Space> za

	" Spell checking
	nmap <Leader>s :call ToggleSpellCheck()<CR>

	" List chars
	nmap <Leader>c :call ToggleListChars()<CR>

	" Custom auto completion
	" inoremap {<CR> {<CR>}<ESC>kA<CR>
	" inoremap { {}<ESC>i
	" inoremap ( ()<ESC>i
	" inoremap [ []<ESC>i
	" inoremap ' ''<ESC>i
	" inoremap " ""<ESC>i

""---Plugin keybindings---""
	" Toggle NERDTree
	nmap <C-n> :NERDTreeToggle<CR>

	" Goyo
	nmap <F8> :Goyo<CR>

	" YouCompleteMe
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
