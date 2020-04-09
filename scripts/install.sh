#!/usr/bin/env bash
set -e

# This file installs the symlinks into the home directory.
# You can run it multiple times.

# check if we have private files
if [ ! -d ~/.dot-files-private ]; then
  echo "Cloning the private dot files"
  git clone git@github.com:kevgo/dot-files-private.git ~/.dot-files-private
fi

# symlink the '.config' folder
if [ -d ~/.config ]; then
  echo "I am about to delete the .config folder."
  echo "Press Ctrl-C to abort"
  echo
  read -p "Are you sure? " -n 1 -r
  rm -rf ~/.config
fi
echo
echo "symlinking .config folder"
ln -s "$HOME/.dot-files/.config/" "$HOME/.config"

# symlink the '.bin' folder
echo
if [ -d "$HOME/bin" ]; then
  echo "~/bin already exists, removing it"
  rm "$HOME/bin"
fi
echo "symlinking ~/bin folder"
ln -s "$HOME/.dot-files/bin_folder" "$HOME/bin"

# symlink the `.gitconfig` file
echo
if [ -L "$HOME/.gitconfig" ]; then
  echo "removing old ~/.gitconfig symlink"
  rm $HOME/.gitconfig
fi
ln -s "$HOME/.dot-files-private/home_dir_files/.gitconfig" "$HOME/.gitconfig"
echo "symlinking ~/.gitconfig"

echo
