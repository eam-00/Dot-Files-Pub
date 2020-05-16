#!/bin/bash
#######################################################################
## $HOME/.config/i3/my-custom-script.sh - Thinkpad T60p - Debian Sid ##
#######################################################################

i3status | while :
do
 read line
 weather=`cat /tmp/aep.tmp | grep -e 'Weather:' | cut -d' ' -f3-`
 mem=`free -h | awk '/^Mem:/ {print $3 "/" $2}'`
echo " $weather |  $mem | $line" || exit 1

done

## EoF ##
