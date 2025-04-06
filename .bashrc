#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias v='nvim'
alias grep='grep --color=auto'
PS1='\[\e[0;31;40m\n[\u@\h]\e[0;0m: \e[0;32;40m\w\e[0;0m\]\n\$ '

# Created by `pipx` on 2024-07-26 10:15:19
export PATH="$PATH:/home/grnk/.local/bin"
