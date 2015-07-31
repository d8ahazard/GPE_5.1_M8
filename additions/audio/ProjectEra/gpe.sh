#!/sbin/sh
#~~PROPERTY OF ZEROINFINITY @ XDA-DEVELOPERS
#~~DO NOT STEAL OF COPY!

echo "\n" >> /system/build.prop
echo "# Dragon-Fi Audio by ZeroInfinity (GPE/AOSP version)" >> /system/build.prop
echo "lpa.decode=false" >> /system/build.prop
echo "tunnel.decode=true" >> /system/build.prop
echo "lpa.use-stagefright=false" >> /system/build.prop
echo "lpa.releaselock=false" >> /system/build.prop
echo "tunnel.audiovideo.decode=true" >> /system/build.prop
echo "htc.audio.swalt.enable=1" >> /system/build.prop
echo "htc.audio.swalt.mingain=2072" >> /system/build.prop