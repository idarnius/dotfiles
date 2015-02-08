# main zshrc file

# Path to oh-my-zsh configuration.¬
ZSH=~/.dotfiles/oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git osx git-extras)

source $ZSH/oh-my-zsh.sh

# Global options
# -----------------------------------------------
setopt correct_all
setopt autonamedirs
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt cdablevarS
#
setopt globdots      # match dot files
setopt sh_word_split # passes "foo bar" as "foo" "bar" to commands,
#                     # backward compatibility with sh/ksh
#
#autoload -U url-quote-magic
#zle -N self-insert url-quote-magic
#
## Aliases
## -----------------------------------------------
alias _='sudo'
alias cl='clear'
alias vi='vim'
alias mdp="mkdir -p"
alias pingg='ping www.google.com'
alias rake="noglob rake" # makes rake work nicely with zsh
alias ..='cd ..'
alias ...='cd ../..'

alias man='nocorrect man'
alias mv='nocorrect mv -i'
alias mkdir='nocorrect mkdir'
alias cp='nocorrect cp'
alias cap='nocorrect cap'
alias rm='nocorrect rm -i'
alias rspec='nocorrect rspec'

alias g="git"
alias v="vim"

# History show full history
alias hs='fc -l 1'

## search command in history
# @link: http://viget.com/extend/level-up-your-shell-game#history-expansions
alias "h?"="history | grep"
#
## find the option for using colors in ls, depending on the version: Linux or BSD
#ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
alias ll="ls -lh"
alias la="ll -a"
#
## ack
which ack-grep &>/dev/null 2>&1 && alias ack='ack-grep'
## reload shell environment
alias rld="echo '---> shell: reload'; exec $SHELL -l"
## full reload with rbenv rehash
alias fld="echo '---> rbenv: rehash'; rbenv rehash; rld"

## higher-order function: map
## link: https://coderwall.com/p/4tkkpq
#alias map="xargs -n1"
#
## disk space
alias dus="du -Psckx * | sort -nr"

## -----------------------------------------------
## Theme
## -----------------------------------------------
#autoload -U colors
#colors
#setopt prompt_subst
#
#PROMPT="%{$fg[white]%}%2~ %# %{$reset_color%}"
#
#RPROMPT='$(~/.bin/git-cwd-info 2>/dev/null)'
#
## vim:set ft=zsh:
