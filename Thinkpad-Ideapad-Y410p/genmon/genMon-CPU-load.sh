#!/bin/sh

## genMon-CPU-load.sh

## Prints the 3 load average values: $(uptime | sed 's/.*load average: //') 
## Prints only the first load average value: $(uptime | sed 's/.*load average: //' | cut -b 1-4)

echo "<txt><span weight=\"bold\" fgcolor=\"#66CDAA\">""$(uptime | sed 's/.*load average: //' | cut -b 1-4)""</span></txt>"
echo "<tool>""</tool>"

## EOF ##

