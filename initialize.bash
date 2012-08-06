#!/usr/bin/env bash
set -e

here="$(dirname "$0")"
here="$(cd "$here"; pwd)"

for file in "$here"/*; do
    name="$(basename "$file")"
    if [[ !( " initialize.bash oh-my-zsh-custom readme.md " =~ " $name " || -d $file/.git ) ]]; then
        ln -sfv $file "$HOME/.$name"
    fi
done

find "$here/oh-my-zsh-custom/custom" -maxdepth 1 -mindepth 1 -print0 | xargs -0 -L 1 -I % ln -sfv % "$HOME/.oh-my-zsh/custom/"
find "$here/oh-my-zsh-custom/themes" -maxdepth 1 -mindepth 1 -print0 | xargs -0 -L 1 -I % ln -sfv % "$HOME/.oh-my-zsh/themes/"

