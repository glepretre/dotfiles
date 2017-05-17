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

# Print history with 1 char
alias h="history"

# Smaller hamster
alias hamster="hamster-time-tracker"

# MATE lock screen
alias lock="mate-screensaver-command --lock"

# Enhanced file listing
alias ls="ls --color=auto"
alias ll="ls -lAh --color=auto"

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

# Always color tree output
alias tree="tree -C"

# Update & upgrade packages
alias up="sudo apt-get update && sudo apt-get upgrade"
