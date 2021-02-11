#
# ~/.bashrc
#
alias ls="exa -lhga"
alias cat="bat"
alias grep="rg"
alias top="bpytop"
alias rm="rm -i"
alias nv="mv -i"
alias ..="cd .."
alias df="df -h"
alias free="free -m"



export EDITOR=nvim



[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
unset use_color safe_term match_lhs sh
xhost +local:root > /dev/null 2>&1
complete -cf sudo
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
shopt -s autocd

#.bashrc PS1 gen
export PS1="\[$(tput bold)\]\[\033[38;5;201m\]\u\[$(tput sgr0)\]: \[$(tput bold)\]\@\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;163m\]\w\[$(tput sgr0)\]\n>\[$(tput sgr0)\]"
