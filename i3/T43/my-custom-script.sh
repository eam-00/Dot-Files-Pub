######################################################################
## $HOME/.config/i3/my-custom-script.sh - Thinkpad T43 - Debian Sid ##
######################################################################

i3status | while :
do
 read line
## weather=`wget -q -O- http://servicios.lanacion.com.ar/solo-texto | grep -e 'Temperatura' | sed 's/^ *//'`
## weather=`wget -q -O- http://servicios.lanacion.com.ar/solo-texto | grep -e 'Temperatura'`
## weather=`cat /tmp/lnol.tmp | grep -e 'Temperatura' | sed 's/^ *//'`
## weather=`cat /tmp/lnol.tmp | grep -e 'Temperatura' | awk '{print "Bs As:"; print $2; print $4; print $5}' | paste -sd " "`
## weather=`cat /tmp/lnol.tmp | grep -e 'Temperatura'| awk '{print $2}' | paste -sd " "`

## weather=`cat /tmp/lnol.tmp | grep -e 'Temperatura'| awk '{print $1; print $2; print $3; print $4}' | paste -sd " "`
 weather=`cat /tmp/lnol.tmp | grep -e 'Temperatura'| awk '{print $2; print $4}' | sed 's/.$//' | paste -sd " "`
 mem=`free -h | awk '/^Mem:/ {print $3 "/" $2}'`
##  echo " $weather |  $mem | $line" || exit 1
 echo "  |  $mem | $line" || exit 1

done

## EoF ##
