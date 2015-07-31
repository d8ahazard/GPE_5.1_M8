#!/sbin/sh
OUTPUTFILE="/tmp/aroma/fs.prop"
systemfs=$(blkid /dev/block/platform/msm_sdcc.1/by-name/system | grep "ext4")

if [ -n "$systemfs" ]; then
	echo "system=0" > $OUTPUTFILE;
else
	echo "system=1" > $OUTPUTFILE;
fi


datafs=$(blkid /dev/block/platform/msm_sdcc.1/by-name/userdata | grep "ext4")

if [ -n "$datafs" ]; then
	echo "data=0" >> $OUTPUTFILE;
else
	echo "data=1" >> $OUTPUTFILE;
fi


cachefs=$(blkid /dev/block/platform/msm_sdcc.1/by-name/cache | grep "ext4")
if [ -n "$cachefs" ]; then
	echo "cache=0" >> $OUTPUTFILE;
else
	echo "cache=1" >> $OUTPUTFILE;
fi
