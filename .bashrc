# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source_if_exists() {
  [ -f "$1" ] && source "$1"
}

# Source global definitions
source_if_exists /etc/bash.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth

# Ignore lines starting with space in history logging
HISTCONTROL=ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
export HISTTIMEFORMAT="%F %T  "

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
source_if_exists ~/sources/clones/bash-git-prompt/gitprompt.sh && GIT_PROMPT_ONLY_IN_REPO=1

# NPM modules binaries
PATH="${HOME}/node_modules/.bin:${PATH}"
# rbenv
PATH="${HOME}/.rbenv/bin:${PATH}"
eval "$(rbenv init -)"
#rbenv shell 1.9.3-p448

# /sbin scripts
PATH="/sbin:${PATH}"

# /usr/sbin scripts
PATH="/usr/sbin:${PATH}"

# local scripts
PATH="${HOME}/bin:${PATH}"

# Alias definitions.
# Must be loaded after path changes
source_if_exists ~/.bash_aliases

# Tiny highlighter function
source_if_exists ~/sources/clones/hhighlighter/h.sh

PERL_MB_OPT="--install_base \"/home/gilles/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/gilles/perl5"; export PERL_MM_OPT;

LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

# Interactive terminal history manager
# Debian package: hh
# https://github.com/dvorka/hstr
# export HH_CONFIG=hicolor         # get more colors
# export HH_CONFIG=warning         # show warnings
# export HH_CONFIG=rawhistory      # show normal history by default (instead of metrics-based view)
export HH_CONFIG=hicolor,warning   # concat config with commas
# shopt -s histappend              # append new history items to .bash_history
# export HISTCONTROL=ignorespace   # leading space hides commands from history
# export HISTFILESIZE=10000        # increase history file size (default is 500)
# export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
if hash hh 2>/dev/null; then
  bind '"\C-r": "\C-a hh \C-j"'    # bind hh to Ctrl-r if hh is installed
fi

export GOPATH="/home/gilles/.go"
# go binaries
PATH="${HOME}/.go/bin:${PATH}"

# pass: unix standard password manager
# Enable bash auto-completion
source_if_exists /etc/bash_completion.d/password-store
