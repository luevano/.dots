#!/bin/sh
# ~/.profile
#
##--Environment variables--##
	## Modified env vars.
export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ';' | sed 's/:*$//')"

	## Default program.
export EDITOR="nvim"
export VISUAL="nvim"
export VISUAL_EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export READER="zathura"
export FILE="ranger"
export STATUSBAR="i3blocks"

	## ~/ cleanup.
export ZDOTDIR="$HOME/.config/zsh"

	## Program settings.
export RANGER_LOAD_DEFAULT_RC=FALSE
