# Fix the HP UEFI

HP computers are hard-coded to load Windows. The idea is to make grub pretend it
is Windows. Then load Windows via grub.

- back up the Windows EFI loader: `mv /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi`
  to `/boot/efi/EFI/Microsoft/bootmgfw.efi`
- copy the grub EFI loader to the Microsoft location, e.g.:
  `cp /boot/efi/EFI/Manjaro/grubx64.efi /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi`
- edit the Microsoft part of `/boot/grub/grub.cfg` to load the backed up EFI
  loader, e.g.:  `chainloader /EFI/Microsoft/bootmgfw.efi`
