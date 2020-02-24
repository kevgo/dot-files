# RClone setup

```bash
# list remote folders
rclone lsd drive:

# list all remote files
rclone ls drive:

# list all music folders
rclone lsd drive:Music

# preview all changes when synching changes made on Chromebook to GDrive
cd /mnt/ChromeOS/MyFiles
rclone sync --dry-run --fast-list --size-only Music drive:Music

# sync all changes when synching changes made on Chromebook to GDrive
cd /mnt/ChromeOS/MyFiles
rclone sync --progress --fast-list --size-only Music drive:Music

# sync all changes from GDrive to Chromebook
cd /mnt/ChromeOS/MyFiles
rclone sync --progress --fast-list --size-only drive:Music Music


```

### Google API setup

https://console.developers.google.com/apis/credentials?project=imperial-welder-226714
