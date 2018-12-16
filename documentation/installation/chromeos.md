## ChromeOS installation

### Install CloudReady on external SSD drive
 - create normal USB installer stick and boot from it
- log into ChromeOS
- hit `Ctrl+Alt+T` to open a terminal with crosh
- run `shell` to go into Bash
- determine the name of the external SSD drive
   - `sudo fdisk -l`
   - when unsure, remove the drive and see which drive is missing
- `cd /usr/sbin`
- `sudo chromeos-install --dst /dev/sdX`  (replace `X` with your drive)
- turn off the machine: `sudo poweroff`


### Linux

- enable Google DNS
   - Settings > Network
- install Linux
   - Setting > Linux

### Node.JS

Install dependencies:

```
sudo apt-get update
sudo apt-get install -y curl gnupg
```

Install Node 10:

```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Install compiler tools for native extensions:

```
sudo apt-get install gcc g++ make
```

Install Yarn:

```
npm i -g yarn
```

- fix possible permissions errors:

    ```
    sudo chmod 777 /usr/lib/node_modules
    sudo chmod 777 /usr/bin
    ```


### VSCode

- download the DEB installer from the VSCode homepage
- move it to the Linux files
- `sudo apt-get install ./code_*.deb`