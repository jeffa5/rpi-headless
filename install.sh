#!/usr/bin/env sh

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input.img> <out_device>"
    exit 1
fi

echo "Unmounting partitions of the device"
for n in $(ls "$2"* | tail -n +2); do
    umount $n 2>/dev/null || true
done

echo "Copying the image with dd"
sudo dd bs=4M if="$1" of="$2" conv=fsync status=progress

echo "Syncing"
sync

sleep 1

echo "Activating ssh"

mnt=$(findmnt -no TARGET $(ls "$2"* | tail -n +2 | head -n 1))
touch $mnt/ssh

echo "Syncing"
sync
