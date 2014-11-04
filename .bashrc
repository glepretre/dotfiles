# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# If this is an xterm set the title to current directory
# And a nice customized prompt string
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\t \[$(tput setaf 4)\][\[$(tput setaf 2)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 2)\]\h\[$(tput setaf 2)\]\[$(tput setaf 4)\]] \w\[$(tput setaf 4)\] \\$ \[$(tput sgr0)\]"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# bash-git-prompt
# When running cd (current directory command) onto a git directory
# show git status in bash
# From: https://github.com/magicmonty/bash-git-prompt.git
if [ -f ~/sources/clones/bash-git-prompt/gitprompt.sh ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source ~/sources/clones/bash-git-prompt/gitprompt.sh
fi

# NPM modules binaries
PATH="${HOME}/node_modules/.bin:${PATH}"
# rbenv
PATH="${HOME}/.rbenv/bin:${PATH}"
eval "$(rbenv init -)"

# /sbin scripts
PATH="/sbin:${PATH}"

# /usr/sbin scripts
PATH="/usr/sbin:${PATH}"

# local scripts
PATH="${HOME}/bin:${PATH}"

# Alias definitions.
# Must be loaded after path changes
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
