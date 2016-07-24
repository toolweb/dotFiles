#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLICOLOR=1
export VISUAL=vim
export EDITOR="$VISUAL"

PS1='[\u@\h \W]\$ '

source ~/.bash_aliases
