#!/sbin/sh
OUTPUTFILE="/tmp/aroma/fs.prop"
systemfs=$(mount | grep "/system f2fs")

if [ -n "$systemfs" ]; then
	echo "system=1" > $OUTPUTFILE;
else
	echo "system=0" > $OUTPUTFILE;
fi


datafs=$(mount | grep "/data f2fs")

if [ -n "$datafs" ]; then
	echo "data=1" >> $OUTPUTFILE;
else
	echo "data=0" >> $OUTPUTFILE;
fi


cachefs=$(mount | grep "/cache f2fs")
if [ -n "$cachefs" ]; then
	echo "cache=1" >> $OUTPUTFILE;
else
	echo "cache=0" >> $OUTPUTFILE;
fi
