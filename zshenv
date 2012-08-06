#!/usr/bin/env zsh

if [[ -d /opt/ruby-enterprise ]]; then
  path=( /opt/ruby-enterprise/bin $path )
fi

typeset -U manpath
manpath=( $manpath )

export EDITOR=/usr/bin/ex
export VISUAL=/usr/bin/vim
export CLICOLOR=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# unset pushdignoredups & autopushd so zsh scripts behave normally
setopt NO_pushd_ignore_dups
setopt NO_auto_pushd
# expand dot files
setopt dotglob

# for OS X
if uname | grep Darwin >> /dev/null; then
    # env for stuff installed by macports
    export TERMINFO=/opt/local/share/terminfo
    path=( /usr/texbin /opt/local/sbin/ /opt/local/bin $path
        /opt/local/lib/postgresql83/bin/ ~/bin . )
    manpath=(/opt/local/man /usr/local/man $manpath)
    cdpath=($cdpath ~/Documents)
fi

typeset -U path

