# install .dot-files

- backup the old `.config` folder

  ```
  mv .config .confold
  ```

- clone the `.dot-files` folder

  ```
  git clone git@github.com:kevgo/dot-files.git .dot-files
  ```

- run the installer script

  ```
  .dot-files/install
  ```

- merge the two config folders

  ```
  mv .confold/* .config
  rm -rf .confold
  ```
