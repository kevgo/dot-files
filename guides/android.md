# Android Installation

- 1password
- American Airlines
- Authy
- Element.io
- Feedly
- Lyft
- [Lysine](https://kevgo.github.io/lysine)
- Shazam
- Simplenote
- TCC (total home control)
- Termux
- Ticktick
- VLC
- Whatsapp
- Wholefoods and enter Daisy's account

### Termux

SSH into the phone from the outside:

- install the SSH server: `pkg install openssh`
- set the password: `passwd`
- get the username: `whoami`
- get the IP address of the phone: `ifconfig`
- SSH into the phone: `ssh -p 8022 [user]@[ip]`

Set up RClone:

- `pkg install rclone`
- `rclone config`
  - new remote
  - name: "Google"
  - "drive"
  - enter access credentials from 1password
  - choose defaults for the options

Enable Termux to access the phone storage:

```
termux-setup-storage
```

Copy-and-paste the scripts from GitHub to upload and download music

Download the music:

- `cd storage/music`
- ~/music-down-execute`
