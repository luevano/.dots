"
" ~/.config/nvim/init.vim
"

""---Auto installs vim-plug---""
" let autoload_plug_path = '~/.config/nvim/autoload/plug.vim'
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
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'mhinz/vim-signify'
	Plug 'jmcantrell/vim-virtualenv'
	Plug 'lervag/vimtex'
	Plug 'KeitaNakamura/tex-conceal.vim'
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
	set encoding=utf-8
	" set bg=dark
	syntax on
	set number relativenumber
	set clipboard+=unnamedplus
	

	" Indentation
	filetype plugin indent on
	set tabstop=4
	set shiftwidth=4
	
	" Spell checking
	set spelllang=es_mx,en_us
	autocmd FileType tex setlocal spell

	" Leader key
	let mapleader=' '
	set showcmd

""---Plugin configuration---""
	" vim-airline
	let g:airline_powerline_fonts=1

	" vim-airline-themes
	let g:airline_theme='solarized'

	" vim-signify
	set updatetime=100

	" tex-conceal
	set conceallevel=2
	let g:tex_conceal="abdgm"

	" nerdtree
	let g:NERDTreeShowHidden=1
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""---Keybindings---""
	" Reload vim
	nmap <F5> :source ~/.config/nvim/init.vim<CR>
	
	" Toggle relative line number
	nmap <F2> :set number invrelativenumber<CR>
	
	" Toggle NERDTree
	nmap <C-n> :NERDTreeToggle<CR>
	
	" Toggle Goyo
	nmap <F8> :Goyo<CR>

	" Split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
