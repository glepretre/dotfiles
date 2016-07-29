#list all defined aliases
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

# Open explorer at the current working directory
alias explore="xdg-open ./"

#Find files easily
alias ff='sh -c '\''find . -name *"$1"* | grep --color "$1"'\'' -'

# Firefox Stable (clean environment)
alias fs='firefox -no-remote -profile "`mktemp -d`" -private-window'

# Firefox-nightly Test (clean environment)
alias ft='firefox-nightly -no-remote -profile "`mktemp -d`" -private-window'

# Smaller hamster
alias hamster="hamster-time-tracker"

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

# Always color tree output
alias tree="tree -C"

# Update & upgrade packages
alias up="sudo apt-get update && sudo apt-get upgrade"
