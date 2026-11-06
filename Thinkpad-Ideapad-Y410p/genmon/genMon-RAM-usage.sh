#!/usr/bin/env bash

## genMon-RAM-usage.sh
## Prints the percentage of used RAM.

echo "<txt><span weight=\"bold\" fgcolor=\"#00CED1\">"""$(free -m | awk 'NR==2{printf "RAM: %s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }' | cut -d " " -f3)"</span></txt>"
echo "<tool>""</tool>"

## EoF ##

