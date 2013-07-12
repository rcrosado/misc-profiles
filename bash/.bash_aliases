alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update && sudo apt-get upgrade'
alias acs='apt-cache search'
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
alias pingrouter='ping -c 5 192.168.1.1'
alias pinggg='ping -c 5 www.google.no'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias la='ls -alh'

alias pubs='cd ~/Dropbox/NVH/PhD/publications/'
alias Rdata='cd ~/Dropbox/R\ data/'

alias panbib='pandoc -s -S -V geometry:a4paper -V geometry:margin=1.5cm --bibliography=/home/ricardo/Dropbox/NVH/PhD/publications/bibtex/library.bib --csl=/home/ricardo/Dropbox/NVH/PhD/publications/bibtex/american-society-for-microbiology.csl'
alias panmd='pandoc -V geometry:a4paper -V geometry:margin=1.5cm'