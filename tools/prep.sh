#!/sbin/sh
/sbin/busybox find /data/app/ "lib" -type d -mindepth 2 -maxdepth 2 | xargs rm -rf