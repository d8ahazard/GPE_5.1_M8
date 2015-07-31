#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/hypernova.conf"

#Wake Gestures
WG=`grep selected.0 /tmp/aroma/wg.prop | cut -d '=' -f2`
echo -e "\n\n##### Wake Gestures Settings #####\n# 0 to disable wake gestures" >> $CONFIGFILE
echo -e "# 1 to enable wake gestures\n" >> $CONFIGFILE
if [ $WG = 2 ]; then
  echo "WG=1" >> $CONFIGFILE;
else
  echo "WG=0" >> $CONFIGFILE;
fi

#S2W
SR=`grep "item.1.1" /tmp/aroma/gest.prop | cut -d '=' -f2`
SL=`grep "item.1.2" /tmp/aroma/gest.prop | cut -d '=' -f2`
SU=`grep "item.1.3" /tmp/aroma/gest.prop | cut -d '=' -f2`
SD=`grep "item.1.4" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep left" >> $CONFIGFILE
echo -e "# 4 to enable sweep up" >> $CONFIGFILE
echo -e "# 8 to enable sweep down\n" >> $CONFIGFILE
echo -e "# For combinations, add values together (e.g. all gestures enabled = 15)\n" >> $CONFIGFILE
if [ $SL = 1 ]; then
  SL=2
fi
if [ $SU == 1 ]; then
  SU=4
fi
if [ $SD == 1 ]; then
  SD=8
fi  

if [ $WG = 1 ]; then
  echo S2W=0 >> $CONFIGFILE;
else
  S2W=$(( SL + SR + SU + SD ))
  echo S2W=$S2W >> $CONFIGFILE;
fi

#DT2W
DT2W=`grep "item.1.5" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Doubletap2wake Settings #####\n# 0 to disable Doubletap2wake" >> $CONFIGFILE
echo -e "# 1 to enable Doubletap2wake (default)\n" >> $CONFIGFILE
if [ $DT2W = 1 ] && [ $WG != 1 ]; then
  echo "DT2W=1" >> $CONFIGFILE;
else
  echo "DT2W=0" >> $CONFIGFILE;
fi

#WG vibration strength
WVIB=`grep "item.2.1" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Wake Vibration Settings #####\n# Set vibration strength (0 to 60)" >> $CONFIGFILE
echo -e "# 0 to disable haptic feedback\n" >> $CONFIGFILE
echo -e "# 20 is default\n" >> $CONFIGFILE
if [ $WVIB = 1 ]; then
  echo "WVIB=20" >> $CONFIGFILE;
else
  echo "WVIB=0" >> $CONFIGFILE;
fi

#Pocket Detection
POCKET=`grep "item.2.2" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Pocket Detectione Settings #####\n# 0 to disable Pocket Detection (default)" >> $CONFIGFILE
echo -e "# 1 to enable Pocket Detection\n" >> $CONFIGFILE
if [ $POCKET = 1 ]; then
  echo "POCKET=1" >> $CONFIGFILE;
else
  echo "POCKET=0" >> $CONFIGFILE;
fi

#Camera Launch
CAM=`grep "item.2.3" /tmp/aroma/gest.prop | cut -d '=' -f2`
echo -e "\n\n##### Camera Launch Settings #####\n# 0 to disable volume buttons launch camera in landscape" >> $CONFIGFILE
echo -e "# 1 to enable volume buttons launch camera in landscape\n" >> $CONFIGFILE
if [ $CAM = 1 ]; then
  echo "CAM=1" >> $CONFIGFILE;
else
  echo "CAM=0" >> $CONFIGFILE;
fi

#S2S
S2S=`grep selected.0 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2sleep Settings #####\n# 0 to disable sweep2sleep" >> $CONFIGFILE
echo -e "# 1 to enable sweep2sleep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep2sleep left" >> $CONFIGFILE
echo -e "# 3 to enable sweep2sleep left and right\n" >> $CONFIGFILE
if [ $S2S = 2 ]; then
  echo "S2S=1" >> $CONFIGFILE;
elif [ $S2S = 3 ]; then
  echo "S2S=2" >> $CONFIGFILE;
elif [ $S2S = 4 ]; then
  echo "S2S=3" >> $CONFIGFILE;
else
  echo "S2S=0" >> $CONFIGFILE;
fi

#USB Fastcharge
FC=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Fastcharge Settings ######\n# 1 to enable usb fastcharge\n# 0 to disable usb fastcharge\n" >> $CONFIGFILE
if [ $FC = 1 ]; then
  echo "FC=1" >> $CONFIGFILE;
else
  echo "FC=0" >> $CONFIGFILE;
fi

#fsync
FSYNC=`grep "item.0.2" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### fsync Settings ######\n# 1 to enable (default)\n# 0 to disable\n" >> $CONFIGFILE
if [ $FSYNC = 1 ]; then
  echo "FSYNC=0" >> $CONFIGFILE;
else
  echo "FSYNC=1" >> $CONFIGFILE;
fi

#Max screen off frequency
MAXSCROFF=`grep "item.0.3" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Max screen off frequency #####\n# 0 to disable Max screen off frequency" >> $CONFIGFILE
echo -e "# 1 to enable Max screen off frequency\n" >> $CONFIGFILE
if [ $MAXSCROFF = 1 ]; then
  echo "MAXSCROFF=0" >> $CONFIGFILE;
else
  echo "MAXSCROFF=1" >> $CONFIGFILE;
fi

#Reduce button vibration
SVIB=`grep "item.0.4 /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Button Vibration #####\n# Values: 0 to 3100" >> $CONFIGFILE
if [ $SVIB = 1 ]; then
  echo "SVIB=2500" >> $CONFIGFILE;
else
  echo "SVIB=3100" >> $CONFIGFILE;
fi

#Cover sensor
COVER=`grep "item.0.5" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Magnetic cover sensor Settings ######\n# 1 to enable\n# 0 to disable\n" >> $CONFIGFILE
if [ $COVER = 1 ]; then
  echo "COVER=0" >> $CONFIGFILE;
else
  echo "COVER=1" >> $CONFIGFILE;
fi

#Backlight dimmer
BL=`grep "item.0.6" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Backlight Dimmer Settings ######\n# 0 to disable\n# 1 for dimmer\n# 2 for dimmest\n" >> $CONFIGFILE
if [ $BL = 1 ]; then
  echo "BL=1" >> $CONFIGFILE;
else
  echo "BL=0" >> $CONFIGFILE;
fi

#GPU Freq
GPU_FREQ=`grep selected.1 /tmp/aroma/gpu.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Settings ######\n#values:  389 462 578\n#These cannot be applied if you selected stock GPU frequency during installation\n" >> $CONFIGFILE
if [ $GPU_FREQ = 1 ]; then
  echo "GPU_FREQ=578" >> $CONFIGFILE;
elif [ $GPU_FREQ = 2 ]; then
  echo "GPU_FREQ=462" >> $CONFIGFILE;
elif [ $GPU_FREQ = 3 ]; then
  echo "GPU_FREQ=389" >> $CONFIGFILE;
fi

#GPU Governor
GPU_GOV=`grep selected.2 /tmp/aroma/gpu.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Governor #####\n# 1 Stock (default)" >> $CONFIGFILE
echo -e "\n# 2 Simple-ondemand\n" >> $CONFIGFILE
if [ $GPU_GOV = 2 ]; then
  echo "GPU_GOV=2" >> $CONFIGFILE;
else
  echo "GPU_GOV=1" >> $CONFIGFILE;
fi

#selinux setting
SELINUX=`grep "item.0.7" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### SELinux Settings #####" >> $CONFIGFILE
echo -e "# 0=selinux enforcing 1=selinux permissive (default)\n" >> $CONFIGFILE
echo "PERMISSIVE=$SELINUX" >> $CONFIGFILE;

#reinstall options
echo -e "\n\n\n\n##### Reinstall Options #####" >> $CONFIGFILE
echo -e "# These settings are only applied if you run the express installer" >> $CONFIGFILE

#Maximum CPU freqs
STOCK=$(grep selected.2 /tmp/aroma/cpu.prop | cut -d '=' -f2)
if [ $STOCK = 2 ]; then
  CPU0=3
else
  CPU0=$(cat /tmp/aroma/freq.prop | cut -d '=' -f2)
fi

echo -e "\n\n##### Max CPU Frequncies #####" >> $CONFIGFILE
echo -e "# 1=1728MHz 2=1958MHz" >> $CONFIGFILE
echo -e "# 3=2266MHz 4=2458MHz" >> $CONFIGFILE
echo -e "# 5=2573MHz 6=2650MHz" >> $CONFIGFILE
echo -e "# 7=2726MHz 8=2803MHz\n" >> $CONFIGFILE

echo "CPU0=$CPU0" >> $CONFIGFILE;

#set undervolting
UV=$(grep selected.2 /tmp/aroma/cpu.prop | cut -d '=' -f2)
echo -e "\n\n##### Undervolt Settings #####" >> $CONFIGFILE
echo -e "# 1=stock 2=-15mV 3=-30mV 4=-45mV\n" >> $CONFIGFILE
echo "UV=$UV" >> $CONFIGFILE;

#thermal throttling
THERM=$(grep selected.3 /tmp/aroma/cpu.prop | cut -d '=' -f2)
echo -e "\n\n##### Thermal Settings #####" >> $CONFIGFILE
echo -e "# 1=Performance (default) 2=stock (cooler)\n" >> $CONFIGFILE
echo "THERM=$THERM" >> $CONFIGFILE;


echo -e "\n\n##############################" >> $CONFIGFILE
#END
