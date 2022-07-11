## --------------------------------------------
## $HOME/.mg from Thinkpad T60 - OpenBSD 6.6
## https://en.wikipedia.org/wiki/Mg_(text_editor)
## --------------------------------------------

## Create the directory "$HOME/.mg.d" so mg can store all the backups in that directory.
## Also create /root/.mg.d/ and copy this file to /root/.mg

backup-to-home-directory
global-set-key "\^h" delete-backward-char

## EOF ##
