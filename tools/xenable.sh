#!/sbin/sh

module=$1
path=$2
string1="     <int name=\""
string2="\" value=\"1\" />"
fullp=$string1$module$string2

if [ -f /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml ]; then
	echo $fullp >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
	if [ ! -f /data/data/de.robv.android.xposed.installer/conf/modules.list ]; then
			mkdir -p /data/data/de.robv.android.xposed.installer/conf/;
			
	fi
	echo $path >> /data/data/de.robv.android.xposed.installer/conf/modules.list;
	
else
	mkdir -p /data/data/de.robv.android.xposed.installer/shared_prefs/;
	mkdir -p /data/data/de.robv.android.xposed.installer/conf/;
	
	echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
	echo "<map>" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
	echo $fullp >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
	
	echo $path > /data/data/de.robv.android.xposed.installer/conf/modules.list;
fi
sed -i '/<\/map\>/d' /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
sed -i '/<\/map\>/d' /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
echo "</map>" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml;
