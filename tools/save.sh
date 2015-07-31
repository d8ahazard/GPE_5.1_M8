#!/sbin/sh
if [ ! -d /sdcard/DH ]; then
	mkdir /sdcard/DH;
fi
cp /tmp/aroma-data/main.prop /sdcard/DH/main.prop
cp /tmp/aroma-data/main2.prop /sdcard/DH/main2.prop
cp /tmp/aroma-data/apps.prop /sdcard/DH/apps.prop
cp /tmp/aroma-data/port.prop /sdcard/DH/port.prop
cp /tmp/aroma-data/gapps.prop /sdcard/DH/gapps.prop
exit 0