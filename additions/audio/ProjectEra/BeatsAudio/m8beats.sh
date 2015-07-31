#!/system/bin/sh
#Update ROM version
echo "htc.audio.global.speaker=0" >> /system/build.prop;
for i in /system/customize/ACC/*.xml
do
  if [ -z "`grep harman $i`" ] ; then
    if [ -z "`grep Android_Multimedia $i`" ] ; then
      sed -i '/support_boomsound_effect/s!>$!>\n  <item type="boolean" name="support_harman">false</item>!' $i;
      sed -i '/<item type="boolean" name="support_beats_audio">true</item>!' $i;
    else
      sed -i '/Android_Multimedia/s!>$!>\n  <item type="boolean" name="support_harman">false</item>!' $i;
      sed -i '/<item type="boolean" name="support_beats_audio">true</item>!' $i;
    fi
  else
    sed -i '/<item type="boolean" name="support_harman">/s/true/false/g' $i;
      sed -i '/<item type="boolean" name="support_beats_audio">/s/false/true/g' $i;
  fi
  sed -i '/<item type="boolean" name="support_boomsound_effect">/s/true/false/g' $i;
      sed -i '/<item type="boolean" name="support_beats_audio">true</item>!' $i;
done
