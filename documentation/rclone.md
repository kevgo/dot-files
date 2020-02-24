# RClone setup

```bash
# list remote folders
rclone lsd music:

# list all remote files
rclone ls music:

# list all music folders
rclone lsd music:Music

# preview all changes when synching changes made on Chromebook to GDrive
cd /mnt/ChromeOS/MyFiles
rclone sync --dry-run --fast-list --size-only Music music:Music
```

### Google API setup

https://console.developers.google.com/apis/credentials?project=imperial-welder-226714
