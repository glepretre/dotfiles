# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# https://stackoverflow.com/a/34143401
exists()
{
  command -v "$1" >/dev/null 2>&1
}

source_if_exists() {
  [ -f "$1" ] && source "$1"
}

is_user_root() {
  [ "$EUID" = 0 ]
}

# Source global definitions
source_if_exists /etc/bash.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source Debian default bash_completion init script
source_if_exists /etc/bash_completion

# Set vi as default editor
# might also need: sudo update-alternatives --config editor
# See: https://unix.stackexchange.com/q/73484
export EDITOR=vi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth

# Ignore lines starting with space in history logging
HISTCONTROL=ignorespace

# Do not record commands and patterns
# defined into .histignore file
# tricky sed: https://stackoverflow.com/a/1252191/3049002
[ -f ${HOME}/.histignore ] && HISTIGNORE="$(cat ${HOME}/.histignore | sed ':a;N;$!ba;s/\n/\:/g')"
# HISTIGNORE="rm *:git co .:git su"

# append to the history file, don't overwrite it
shopt -s histappend

# https://stackoverflow.com/a/19533853
export HISTFILE=${HOME}/.bash_eternal_history
# https://stackoverflow.com/a/12234989
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTTIMEFORMAT="%F %T  "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

export LESS="-RMc --shift 5"

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to current directory
# And a nice customized prompt string
case "$TERM" in
xterm*|rxvt*)
  if [ $(id -u) -eq 0 ]; then
    # Root
    export PROMPT_COMMAND=""
    PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\t \[$(tput setaf 4)\][\[$(tput setaf 1)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 1)\]\h\[$(tput setaf 1)\]\[$(tput setaf 4)\]] \w\[$(tput setaf 4)\] \\$ \[$(tput sgr0)\]"
  else
    # User
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\t \[$(tput setaf 4)\][\[$(tput setaf 2)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 2)\]\h\[$(tput setaf 2)\]\[$(tput setaf 4)\]] \w\[$(tput setaf 4)\] \\$ \[$(tput sgr0)\]"
  fi
  ;;
*)
  ;;
esac

# bash-git-prompt
# When running cd (current directory command) onto a git directory
# show git status in bash
# From: https://github.com/magicmonty/bash-git-prompt.git
# ---
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1
source_if_exists ~/tools/bash-git-prompt/gitprompt.sh

# NPM modules binaries
# Keep it written in this order, not to override linux built-in with node one's
# like: https://www.npmjs.com/package/which
# or https://www.npmjs.com/package/watch
PATH="${PATH}:${HOME}/node_modules/.bin"

# rbenv
PATH="${HOME}/.rbenv/bin:${PATH}"
# Init rbenv when available
exists rbenv && eval "$(rbenv init -)"
#rbenv shell 1.9.3-p448

# /sbin scripts
PATH="/sbin:${PATH}"

# /usr/sbin scripts
PATH="/usr/sbin:${PATH}"

# local scripts
PATH="${HOME}/bin:${PATH}"

# .local scripts
PATH="${HOME}/.local/bin:${PATH}"

# Alias definitions.
# Must be loaded after path changes
source_if_exists ~/.bash_aliases

# Tiny highlighter function
# MEMO: rename h function to hl to avoid conflict with h aliased to 'history'
source_if_exists ~/tools/hhighlighter/h.sh

PERL_MB_OPT="--install_base \"/home/gilles/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/gilles/perl5"; export PERL_MM_OPT;

LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

# Interactive terminal history manager
# Ubuntu package: hstr
# Debian package: hh
# https://github.com/dvorka/hstr
alias hh=hstr                      # hh to be alias for hstr
# export HH_CONFIG=hicolor         # get more colors
# export HH_CONFIG=warning         # show warnings
# export HH_CONFIG=rawhistory      # show normal history by default (instead of metrics-based view)
export HH_CONFIG=hicolor,warning   # concat config with commas
# shopt -s histappend              # append new history items to .bash_history
# export HISTCONTROL=ignorespace   # leading space hides commands from history
# export HISTFILESIZE=10000        # increase history file size (default is 500)
# export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# thefuck
# https://github.com/nvbn/thefuck
exists thefuck && eval "$(thefuck --alias merde)"

export GOPATH="/home/gilles/.go"
# go binaries
PATH="${HOME}/.go/bin:${PATH}"

# pass: unix standard password manager
# Enable bash auto-completion
source_if_exists /etc/bash_completion.d/password-store

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source_if_exists "$NVM_DIR/bash_completion"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
exists pyenv || export PATH="$PYENV_ROOT/bin:$PATH"
exists pyenv && eval "$(pyenv init -)"

# Android emulator
PATH="/mnt/HDD/android/tools:$PATH"
PATH="/mnt/HDD/android/platform-tools:$PATH"

# https://twitter.com/fabi1cazenave/status/793797163067277312
recently_modified_files() {
  find $1 -mtime -1 -print
}

mkcd () {
  mkdir "$1"
  cd "$1"
}

# I am groot:
# Go to git toplevel directory
groot () {
  cd "$(git rev-parse --show-toplevel)" || exit
}

# Original idea:
# https://github.com/kepkin/dev-shell-essentials/blob/45da0e2a8da961a146e72cba7fc63da589d89a05/highlight.sh
# Enhanced
function color() {
  function usage () {
    echo "usage: input | color PATTERN [COLOR]"
    echo "COLOR: black, red (default), green, yellow, blue, magenta, cyan"
  }

  # https://stackoverflow.com/a/20913871/3049002
  IFS= read -rd '' -n 1 -t 1 INPUT
  while IFS= read -rd '' -n 1 -t 1 c
  do
    INPUT+=$c
  done

  if [ -z "$INPUT" ]
  then
    echo "No input"
    echo ""
    usage
    return 1
  fi

  if [ $# -lt 1 ] || [ $# -gt 2 ]
  then
    echo "Wrong number of arguments"
    echo ""
    usage
    return 1
  fi

  case "$2" in
    "")
      COLOR="red"
      ;;
    black|red|green|yellow|blue|magenta|cyan)
      COLOR="$2"
      ;;
    *)
      echo "Unrecognized color"
      echo ""
      usage
      return 1
      ;;
  esac

  declare -A fg_color_map
  fg_color_map[black]=30
  fg_color_map[red]=31
  fg_color_map[green]=32
  fg_color_map[yellow]=33
  fg_color_map[blue]=34
  fg_color_map[magenta]=35
  fg_color_map[cyan]=36


  fg_c=$(echo -e "\\e[1;${fg_color_map[$COLOR]}m")
  c_rs=$'\e[0m'
  sed -u s"/$1/$fg_c\\0$c_rs/g" <<< "$INPUT"
}

# nix - https://nixos.org/
source_if_exists ${HOME}/.nix-profile/etc/profile.d/nix.sh

# direnv - https://direnv.net/
exists direnv && eval "$(direnv hook bash)"

# Private
source_if_exists ${HOME}/.bashrc_private

# NOTE: Leave this at the end as it may stop to prompt passphrase
# Launch SSH agent and ask for passphrase once at first terminal opening
if [ -f ${HOME}/bin/ssh-agent-launcher.sh ] && [ -f ${HOME}/.ssh/id_rsa ]
then
  eval $(${HOME}/bin/ssh-agent-launcher.sh)
fi

if [ -f ${HOME}/bin/gpg-agent-launcher.sh ] && [ -f ${HOME}/.gnupg/secring.gpg ]
then
  eval $(${HOME}/bin/gpg-agent-launcher.sh)
fi
