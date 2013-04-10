#!/bin/bash

# dotfiles="$HOME/.dotfiles/rayfranco/dotfiles"
dotfiles="$HOME/dotfiles"
bin="/usr/local/bin"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -rf "$to"
  ln -s "$from" "$to"
}

# Install oh-my-zsh custom
for f in $dotfiles/terminal/oh-my-zsh/*
do
  file="${f##*/}"
  file="${file%.*}"
  link "$f" "$HOME/.oh-my-zsh/$file"
done

# Install home dotfiles
for f in $dotfiles/home/*
do
  file="${f##*/}"
  file="${file%.*}"
  link "$f" "$HOME/.$file"
done

# # Install binaries
# for location in $dotfiles/bin/*
# do
#   # file="${location##*/}"
#   # file="${file%.*}"
#   # link "$dotfiles/$location" "$bin/$file"
# done

# Install Sublime files
# @TODO: Install Soda Theme and Package Manager
if [[ `uname` == 'Darwin' ]]; then
  link "$dotfiles/sublime/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"
  link "$dotfiles/sublime/Default (OSX).sublime-keymap" "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap"
fi

echo