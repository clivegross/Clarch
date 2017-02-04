#!/usr/bin/sh
#
# mount-clikki.sh
#
# Mounts server SMB share of server CLIKKI to /mnt/clikki-SMB
# Must be run as superuser

USERNAME="$1"
PASSWORD="$2"

mount -t cifs //clikki-nas/Videos /mnt/clikki-SMB/videos -o user="${USERNAME}",password="${PASSWORD}",uid=1000,gid=1000
mount -t cifs //clikki-nas/Music /mnt/clikki-SMB/music/ -o user="${USERNAME}",password="${PASSWORD}",uid=1000,gid=1000
mount -t cifs //clikki-nas/Pictures /mnt/clikki-SMB/pictures/ -o user="${USERNAME}",password="${PASSWORD}",uid=1000,gid=1000
mount -t cifs //clikki-nas/[username] /mnt/clikki-SMB/"${USERNAME}"/ -o user="${USERNAME}",password="${PASSWORD}",uid=1000,gid=1000
mount -t cifs //clikki-nas/Software /mnt/clikki-SMB/software/ -o user="${USERNAME}",password="${PASSWORD}",uid=1000,gid=1000


