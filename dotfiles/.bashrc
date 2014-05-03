#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# User specific aliases and functions:
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# User specific environment and startup programs:
export LANG=en_AU.UTF-8
export TERM=rxvt-unicode
export EDITOR=vim

# Git tab completion
source /usr/share/git/completion/git-completion.bash
