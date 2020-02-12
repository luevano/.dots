#!/bin/sh
# ~/.xinitrc
#

# This is run when 'startx' or 'xinit' is executed,
# but since display managers use ~/.xprofile instead,
# .xprofile is sourced to be compatible with both.

[[ -f ~/.xprofile ]] && . ~/.xprofile
