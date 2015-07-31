#!/bin/bash
FILES=/sdcard/preinstall/
for f in $(ls $FILES); do
  echo "Processing $f file..."
  pm install $FILES/$f
  done

#rm -rf $FILES