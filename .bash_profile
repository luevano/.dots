#
# ~/.bash_profile
#

## This only is read by bash when it is a login shell,
# not an interactive one (lightdm, for example). So
# .profile has to be sourced (as well as .bashrc). See:
# https://unix.stackexchange.com/questions/88106/why-doesnt-my-bash-profile-work.

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
