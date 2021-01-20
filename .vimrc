" .vimrc
set mouse=a
set number
set cursorline
set laststatus=2
set ruler
set background=dark
set showmode
set showcmd
set backup
set backupdir=~/.cache/vim-backups
set writebackup
set backupcopy=yes
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M") 

syntax on

" EoF
