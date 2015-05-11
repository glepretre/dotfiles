# Navigation
alias ..="cd .."
alias ...="cd ../.."

# Command line calculator
alias calc="qalc"

# Clear terminal with 1 char
alias c="clear"

# Count characters in a string
alias count="expr length"

# Chrome Test (clean environment)
alias ct="google-chrome-unstable --incognito --user-data-dir=/tmp"

# Open explorer at the current working directory
alias explore="xdg-open ./"

# Firefox Test (clean environment)
alias ft="firefox-nightly -no-remote -profile "/tmp" -private-window"

# Enhanced file listing
alias ls="ls --color=auto"
alias ll="ls -lAh --color=auto"

# https://github.com/nvbn/thefuck
# NOTE: Keep the single quotes.
alias merde='eval $(thefuck $(fc -ln -1))'

# Echo paths nicely
alias paths="echo $PATH | tr -s ':' '\n'"

# Update & upgrade packages
alias up="sudo apt-get update && sudo apt-get upgrade"
