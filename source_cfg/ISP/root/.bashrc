# ~/.bashrc
# The individual per-interactive-shell startup file.

# Source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Define user specific aliases and functions.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias d='ls'
alias s='cd ..'
alias p='cd -'
alias reboot='history -w; reboot'
alias shutdown='history -w; shutdown'

# Read /etc/inputrc if the variable is not defined.
[ -n "$INPUTRC" ] || export INPUTRC=/etc/inputrc

PATH=/root/bin:/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
ENV=$HOME/.bashrc
USERNAME="root"
export USERNAME ENV PATH
