## ChromeOS installation

### Backup old machine

- Quick Write snippets
- downloaded files
- uncommitted files in code bases

### Settings

- Manage other people > disable guest and restrict login
- Linux: enable

Chrome settings:

- chrome://flags/#scheduler-configuration
- chrome://flags/#quiet-notification-prompts
- chrome://flags/#enable-tab-search (disable)
- chrome://flags/#enable-virtual-desks-gestures
- chrome://flags/#enable-reader-mode
- chrome://flags/#ash-limit-alt-tab-to-active-desk
- chrome://flags/#ash-limit-shelf-items-to-active-desk
- chrome://flags/#percent-based-scrolling

on tablet:

- chrome://flags/#webui-tab-strip

### Folder sharing

- right click on `Downloads` folder, choose `Share with Linux`

### basic installation

do the [Debian setup](debian.md)

### Music

- optionally copy music files from backup disc into a `Music` folder in
  `My Files`
- `brew install rclone`
- share the `Music` folder with Linux
- run `music-down-execute` to get the latest changes from GDrive
