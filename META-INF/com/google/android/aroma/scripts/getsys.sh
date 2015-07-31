#!/sbin/sh

getprop > /tmp/aroma/system.prop
sed -i 's/: /=/g' /tmp/aroma/system.prop
sed -i 's/\[//g;s/\]//g' /tmp/aroma/system.prop 
if [ -f /sbin/mkfs.f2fs ]; then
	if [ mount | grep "f2fs" ]; then 
		echo "ro.system.2fsstate=2" >> /tmp/aroma/system.prop
	else
		echo "ro.system.f2fsstate=1" >> /tmp/aroma/system.prop
	fi
else
	echo "ro.system.f2fsstate=0" >> /tmp/aroma/system.prop
fi