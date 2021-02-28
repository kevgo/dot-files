# RClone

## setup

run `rclone config` and choose:

- new config
- name: `drive`
- type: `drive`
- client id: (take from 1password under "rclone")
- client secret: (take from 1password under "rclone")
- scope: `1` (full access)
- accept the defaults for the remaining options

## usage

```bash
# list remote folders
rclone lsd drive:

# list all remote files
rclone ls drive:

# list all music folders
rclone lsd drive:Music
```

Run the `music-*` scripts in the [bin_folder](../bin_folder) to sync files.

## Google API setup

https://console.developers.google.com/apis/credentials?project=imperial-welder-226714
