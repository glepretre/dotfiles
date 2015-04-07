# Navigation
alias ..="cd .."
alias ...="cd ../.."

# Clear terminal with 1 char
alias c="clear"

# Count characters in a string
alias count="expr length"

# Chrome Test (clean environment)
alias ct="google-chrome-unstable --incognito --user-data-dir=/tmp"

# Enhanced file listing
alias ls="ls --color=auto"
alias ll="ls -lAh --color=auto"

# Echo paths nicely
alias paths="echo $PATH | tr -s ':' '\n'"

# Update & upgrade packages
alias up="sudo apt-get update && sudo apt-get upgrade"

