#!/bin/sh
set -eu

for f in .??*; do
[ "$f" = ".git" ] && continue
ln -s ~/dotfiles/"$f" ~/
done


