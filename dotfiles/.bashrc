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
export BROWSER=chromium
export NAS=${HOME}/clikki-SMB/clikki-SMB
export ANDROID_HOME=${NAS}/software/android
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Git tab completion
source /usr/share/git/completion/git-completion.bash
