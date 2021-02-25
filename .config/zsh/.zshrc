#!/bin/zsh

# PS1 colors and style.
autoload -U colors && colors
PS1="%(!.%{$fg_bold[red]%}[%n@%M %(5~|%-2~/.../%2~|%~)]%#%{$reset_color%} .%{$fg_bold[red]%}[%{$fg_bold[yellow]%}%n%{$fg_bold[green]%}@%{$fg_bold[blue]%}%M %{$fg_bold[magenta]%}%(5~|%-2~/.../%2~|%~)%{$fg_bold[red]%}]%{$fg_bold[cyan]%}%#%{$reset_color%} )"

# Set LS_COLORS via dircolors.
[[ -f $HOME/.config/dircolors ]] && eval "$(dircolors $HOME/.config/dircolors)"

# Load aliases if existent.
[[ -f $HOME/.config/shell/aliasrc ]] && . ~/.config/shell/aliasrc

# Source nvm if existent.
# [[ -f /usr/share/nvm/init-nvm.sh ]] && . /usr/share/nvm/init-nvm.sh

# History cache.
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd

# Auto/tab complete.
autoload -Uz compinit
zstyle ':completion:*' menu select
# Use the same colors as ls.
[[ ! -z "$LS_COLORS" ]] && zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
compinit
# Include hidden files in autocomplete.
_comp_options+=(globdots)

# Dynamic window title for zsh.
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term|alacritty)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '[%c]%#')"
      term_title "$DIR" "zsh"
    }
    preexec () {
      local DIR="$(print -P '[%c]%#')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR" "$CMD"
    }
  ;;
esac

# Add syntax highlighting.
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
