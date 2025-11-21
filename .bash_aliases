# codium is the new atom
alias a="codium ."

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
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."

# Command line calculator
# alternatives:
#   - bc -l
#   - js (node)
alias calc="qalc"

# Open codium with 1 char
alias c="codium ."

# Clear terminal with 2 chars
alias cl="clear"

# Copy/Paste from terminal
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"

# Count characters in a string
alias count="expr length"

# Chrome Stable (clean environment)
alias cs="google-chrome-stable \
          --incognito \
          --no-default-browser-check \
          --no-first-run \
          --disable-default-apps \
          --disable-search-engine-choice-screen \
          --user-data-dir=`mktemp -d`"

# Chrome-dev Test (clean environment)
alias ct="google-chrome-unstable \
          --incognito \
          --no-default-browser-check \
          --no-first-run \
          --disable-default-apps \
          --disable-search-engine-choice-screen \
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
alias fs='firefox-stable -no-remote -profile "`mktemp -d`" -private-window'

# Firefox-nightly Test (clean environment)
alias ft='firefox-nightly -no-remote -profile "`mktemp -d`" -private-window'

# Let fuck-you use 'fuck'
# https://www.npmjs.com/package/fuck-you
# and thefuck use another alias
# https://github.com/nvbn/thefuck
alias fuck="npx fuck"

# Colorize grep output
alias grep="grep --color=auto"

# Google translate in disposable chrome
alias gtr="cs translate.google.fr"

# Print history with 1 char
alias h="history"

# Smaller hamster
alias hamster="hamster-time-tracker"

# HTTP response status codes
# https://www.npmjs.com/package/http-status-identifier-cli
# https://github.com/jaebradley/http-status-identifier-cli
# https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
alias http-code="$HOME/node_modules/.bin/hs"
alias http-response="$HOME/node_modules/.bin/hs"

# MATE lock screen
alias lock="mate-screensaver-command --lock"

# Enhanced file listing
alias ls="ls --color=auto"
alias ll="ls -lAh --time-style long-iso --color=auto"

# Print top 20 apps by memory usage
alias mem='ps -e -o comm=,rss= | awk '\''{rss[$1]+=$2} END {for (p in rss) printf "%8.1f MB  %s\n", rss[p]/1024, p}'\'' | sort -nr | head -n 20'

# Quickly create a meme
alias meme="cs https://imgflip.com/memegenerator"

# Pretty print mounted volumes
alias mounted="mount | grep -E ^/dev | column -t"

# https://zim-wiki.org/
alias notes="zim"

# Add local node modules binaries to $PATH
# NOTE: Keep the single quotes.
alias npm-path='PATH=$(npm bin):$PATH'

# Neovim aliases
# https://www.reddit.com/r/neovim/comments/13s7pvr/comment/jlqs2f7/
# https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME
alias nvchad="NVIM_APPNAME=nvchad nvim"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

# Echo paths nicely
alias paths="echo $PATH | tr -s ':' '\n'"

# Convert pdf to images to print them easily
alias pdf2image="convert -verbose -density 300 -quality 100 $1 $2"

# print used ports
alias ports="sudo netstat -nltpe"

# personal store
alias ppass="PASSWORD_STORE_DIR=~/github/store pass"

# Reset terminal with 1 char
alias r="reset"

# Print package.json commands
# https://frontendmasters.com/blog/a-quick-command-to-see-the-available-scripts/
alias scripts="cat package.json | jq --color-output '.scripts'"

# Terminal countdown
# https://github.com/trehn/termdown
alias scrum="termdown 5m"

# Record faster
alias ssr=simplescreenrecorder

# Always color tree output
alias tree="tree -C"

# Update & upgrade packages
alias up="sudo apt-get update && sudo apt-get upgrade"
