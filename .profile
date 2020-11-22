#!/bin/sh
# ~/.profile
#
##--Environment variables--##
	## Modified env vars.
export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

	## Default programs.
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export READER="zathura"
export FILE="ranger"
export STATUSBAR="i3blocks"
export MUSIC="spotify"
export MAILMGR="thunderbird"
export MSGCHAT="telegram-desktop"
export SSMGR="flameshot"

	## ~/ cleanup.
export ZDOTDIR="$HOME/.config/zsh"

	## Ranger.
export RANGER_LOAD_DEFAULT_RC=FALSE

	## CUDA.
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"

	## Tensorflow.
export TF_CPP_MIN_LOG_LEVEL="0"
	# 0 = all messages are logged (default behavior)
	# 1 = INFO messages are not printed
	# 2 = INFO and WARNING messages are not printed
	# 3 = INFO, WARNING, and ERROR messages are not printed

	## Ruby
if command -v ruby >/dev/null 2>&1; then
	export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi

	## Jupyter lab.
export JUPYTER_CONFIG_DIR=$HOME/.config/jupyter
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

	## iPython.
export IPYTHONDIR=$HOME/.config/ipython

	## TexLive.
export TEXMFDIST=/usr/share/texmf-dist
export TEXMFHOME=$HOME/.local/share/texmf

	## qBittorrent.
export QT_AUTO_SCREEN_SCALE_FACTOR=0
