# Open atom in current folder with 1 char
alias a="atom ."

# Make ack case-insensitive
# and ignore error messages by default
alias ack="ack -si"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# List all defined aliases
alias aliases="compgen -a"

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# Command line calculator
alias calc="qalc"

# Clear terminal with 1 char
alias c="clear"

# Count characters in a string
alias count="expr length"

# Chrome Stable (clean environment)
alias cs="google-chrome-stable \
          --incognito \
          --no-default-browser-check \
          --no-first-run \
          --disable-default-apps \
          --user-data-dir=`mktemp -d`"

# Chrome-dev Test (clean environment)
alias ct="google-chrome-unstable \
          --incognito \
          --no-default-browser-check \
          --no-first-run \
          --disable-default-apps \
          --user-data-dir=`mktemp -d`"

# Print directories size
alias dsize="du -sh * | sort -hr"

# Print directories size including dotfiles
alias dsize-all="du -shc .??* * | sort -hr"

# Open explorer with 1 char
alias e="xdg-open ./"

# Open explorer at the current working directory
alias explore="xdg-open ./"

# Print current folder size
alias fat="du -ch | grep total"

#Find files easily
alias ff='sh -c '\''find . -iname *"$1"* | grep --color --ignore-case "$1"'\'' -'

# Firefox Stable (clean environment)
alias fs='firefox -no-remote -profile "`mktemp -d`" -private-window'

# Firefox-nightly Test (clean environment)
alias ft='firefox-nightly -no-remote -profile "`mktemp -d`" -private-window'

# Colorize grep output
alias grep="grep --color=auto"

# Print history with 1 char
alias h="history"

# Smaller hamster
alias hamster="hamster-time-tracker"

# HTTP response status codes
# https://www.npmjs.com/package/http-response
# https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
alias http="http-response"

# MATE lock screen
alias lock="mate-screensaver-command --lock"

# Enhanced file listing
alias ls="ls --color=auto"
alias ll="ls -lAh --time-style long-iso --color=auto"

# https://github.com/nvbn/thefuck
# NOTE: Keep the single quotes.
alias merde='eval $(thefuck $(fc -ln -1))'

# Add local node modules binaries to $PATH
# NOTE: Keep the single quotes.
alias npm-path='PATH=$(npm bin):$PATH'

# Echo paths nicely
alias paths="echo $PATH | tr -s ':' '\n'"

# Convert pdf to images to print them easily
alias pdf2image="convert -verbose -density 300 -quality 100 $1 $2"

# Reset terminal with 1 char
alias r="reset"

# Terminal countdown
# https://github.com/trehn/termdown
alias scrum="termdown 5m"

# Always color tree output
alias tree="tree -C"

# Update & upgrade packages
alias up="sudo apt-get update && sudo apt-get upgrade"
