## ChromeOS installation

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
