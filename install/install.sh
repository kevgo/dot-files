#!/usr/bin/env bash
set -e

# This file installs the symlinks
# into the home directory
#
# You can run it multiple times.

cd .config/home_dir_files
ls -1a | grep -v '^\.$' | grep -v '^\.\.$' | xargs -L1 "$HOME/.config/install/create_symlink.sh"

echo
echo "linking ~/bin folder"
if [ -L "$HOME/bin" ]; then
  echo "~/bin already exists, deleting it"
  rm "$HOME/bin"
fi
echo "creating symlink bin --> .config/bin_folder"
ln -s "$HOME/.config/bin_folder" "$HOME/bin"
