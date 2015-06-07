# dotfiles
A collection of various personalized config files, ready for management with GNU [stow](https://www.gnu.org/software/stow/#content).

For a quick example, my .vimrc is installed like this:

`stow vim`

stow will happily link all the files in dotfiles/vim/ to $HOME - in this case, dotfiles/vim/.vimrc to $HOME/.vimrc
