#!/usr/bin/env bash

## genMon-CPU-Temp.sh
## Prints the CPU temperature.

echo "<txt><span weight=\"bold\" fgcolor=\"#d79921\">""$((`cat /tmp/cpu_temp_1`/1000 ))"°"""</span></txt>"
echo "<tool>""</tool>"

## EoF ##
