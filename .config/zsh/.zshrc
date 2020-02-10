#
# $ZDOTDIR/.zshrc
#

# PS1 colors and style.
autoload -U colors && colors
PS1="%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ "

# Set LS_COLORS via dircolors.
[[ -f ~/.config/dircolors ]] && eval "$(dircolors ~/.config/dircolors)"

# Load aliases if existent.
[[ -f ~/.config/aliasrc ]] && . ~/.config/aliasrc

# History cache.
HISTFILE=~/.cache/zsh/history
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

# Prompt themes.
# autoload -Uz promptinit
# promptinit

# Add syntax highlighting.
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
