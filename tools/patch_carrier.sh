#!/sbin/sh

module=$1

if [ ! -e /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml]; then
	sed -i '/<\/map>/d' /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml
	echo "<int name="com.woalk.apps.xposed.htcblinkfeedauthorizer" value="1" />" > /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml
else
	echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml
echo "<map>" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml
"    <int name="com.woalk.apps.xposed.htcblinkfeedauthorizer" value="1" />" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml
echo "</map>" >> /data/data/de.robv.android.xposed.installer/shared_prefs/enabled_modules.xml


