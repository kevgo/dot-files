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
