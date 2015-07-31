#!/system/bin/sh
#Update ROM version
for i in /system/customize/ACC/*.xml
do
  if [ -z "`grep harman $i`" ] ; then
    if [ -z "`grep Android_Multimedia $i`" ] ; then
      sed -i '/support_boomsound_effect/s!>$!>\n  <item type="boolean" name="support_harman">true</item>!' $i;
    else
      sed -i '/Android_Multimedia/s!>$!>\n  <item type="boolean" name="support_harman">true</item>!' $i;
    fi
  else
    sed -i '/<item type="boolean" name="support_harman">/s/false/true/g' $i;
  fi
	sed -i '/<item type="boolean" name="support_boomsound_effect">/s/false/true/g' $i;
done