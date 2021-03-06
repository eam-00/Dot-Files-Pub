## --------------------------------------------
## $HOME/.kshrc from Thinkpad T60 - OpenBSD 6.6
## --------------------------------------------

alias df='df -h'
alias du='du -sh'
alias j='jobs -l'
alias lsa='ls -lasht'

export VISUAL=mg
export EDITOR=$VISUAL
export PAGER=less
HISTSIZE=500
HISTFILE="$HOME/.ksh_history"
HISTEDIT=$EDITOR

set -o ignoreeof
set -o emacs

# Put the current directory and history number in the prompt
PS1='$_pwd [!]\$ '

## EoF ##
