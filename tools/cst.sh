#!/sbin/sh

bp="/system/build.prop"

for prop in `cat /tmp/carrier.prop`;do
	echo $prop >> /system/build.prop
done
