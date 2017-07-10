#!/usr/bin/env bash
set -e

# This file installs the given file
# as a symlink into the home directory.

if [ $# != 1 ]; then
  echo "Please call with the filename"
fi

# if the symlink already exists, delete it
if [ -L "$HOME/$1" ]; then
  echo
  echo "symlink $1 already exists, deleting it"
  rm "$HOME/$1"
fi


# create the new symlink
echo "creating symlink $1 --> .config/home_dir_files/$1"
ln -s "$HOME/.config/home_dir_files/$1" "$HOME/$1"
