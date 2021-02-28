# GitHub setup

- [create new SSH key](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

- generate SSH key:

  ```
  ssh-keygen -t rsa -b 4096 -C "kevin.goslar@gmail.com"

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  cat ~/.ssh/id_rsa.pub
  ```

- register SSH key with GitHub: https://github.com/settings/keys
- don't create a GPG key, we'll import the existing one later
- clone the dotfiles:

  ```
  rm -rf .config
  git clone git@github.com:kevgo/dot-files.git .dot-files

  .dot-files/install
  ```
