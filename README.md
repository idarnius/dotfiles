# dotfiles
The point where I have configured a lot of generic settings, configurations and themes.

These are configuration files to set up a basic UNIX system with:

* vim
* tmux
* zsh
* git
* ctags
* homebrew
* ruby
* ack

# Usage


## Basic installation:

```sh
$ git clone git://github.com/idarnius/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ scripts/check # verifies if the system has the needed packages
$ scripts/install # symlinks config files and setup Vim plugins.
You can remove them with:
````

```sh
$ scripts/remove
````

## Vim

My Vim configuration file uses [Vundle](https://github.com/gmarik/Vundle.vim 'Vundle plugin') to manage the plugins.

## Attributions

All the configuration files are based on the following works:

* jhbabon / dotfiles: https://github.com/jhbabon/dotfiles
* ryanb / dotfiles: https://github.com/ryanb/dotfiles
* cloudhead / dotfiles: https://github.com/cloudhead/dotfiles
* robbyrussell / oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
* sjl / dotfiles: https://github.com/sjl/dotfiles
* topfunky / zsh-simple: https://github.com/topfunky/zsh-simple/
* Post in One Thing Well blog: http://onethingwell.org/post/39744163899
