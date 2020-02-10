"
" ~/.config/nvim/init.vim
"

""---Auto installs vim-plug---""
" let autoload_plug_path = '~/.config/nvim/autoload/plug.vim'
" if !filereadable(autoload_plug_path)
"	echo "Downloading junegunn/vim-plug to manage plugins..."
" 	silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
"		\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
"	autocmd VimEnter * PlugInstall
" endif
" unlet autoload_plug_path

""---Loads plugins---""
call plug#begin('~/.config/nvim/plugged')
	Plug 'mboughaba/i3config.vim'	

	" Goyo
	Plug 'junegunn/goyo.vim'
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
" Enable syntax highlighting.
syntax on

" Show line numbers and use relativenumber.
set number relativenumber

" Set 1 tab = 4 spaces.
set ts=4 sw=4
