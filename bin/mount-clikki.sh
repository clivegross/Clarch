#!/bin/bash
#
# mount-clikki.sh
#
# Mounts server SMB share of server CLIKKI to /mnt/clikki-SMB
# Must be run as superuser
mount -t cifs //clikki/share /mnt/clikki-SMB -o user=clive,password=samba
