######################################################################
## $HOME/.config/i3/my-custom-script.sh - Thinkpad T43 - Debian Sid ##
######################################################################

i3status | while :
do
 read line
 weather=`cat /tmp/lnol.tmp | grep -e 'Temperatura'| awk '{print $2; print $4}' | sed 's/.$//' | paste -sd " "`
 mem=`free -h | awk '/^Mem:/ {print $3 "/" $2}'`
 echo "  |  $mem | $line" || exit 1
done

## EoF ##
