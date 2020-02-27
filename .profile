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

	## ~/ cleanup.
export ZDOTDIR="$HOME/.config/zsh"

	## Program settings.
export RANGER_LOAD_DEFAULT_RC=FALSE

	## Tensorflow.
export TF_CPP_MIN_LOG_LEVEL="1"
	# 0 = all messages are logged (default behavior)
	# 1 = INFO messages are not printed
	# 2 = INFO and WARNING messages are not printed
	# 3 = INFO, WARNING, and ERROR messages are not printed
