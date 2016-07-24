#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLICOLOR=1

PS1='[\u@\h \W]\$ '

source ~/.bash_aliases
