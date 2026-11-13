## ------------------------------------------------------------------
## $HOME/.bash_aliases from Lenovo Ideapad y410p - Debian 13
## ------------------------------------------------------------------

alias ls='ls -CFp --color=auto'
alias lsa='ls -lshap --color=auto'
alias lst='ls -lshapt --color=auto'
alias j='jobs'
alias prstat='top'
alias vmstat='vmstat 5 -S M'

alias df='df -h'
alias free='free -h'
alias update='sudo apt update'
alias upgrade='sudo apt dist-upgrade'
alias list_services='systemctl list-unit-files --state=enabled --no-pager'
alias list_headers='dpkg --get-selections | grep linux-headers'
alias batt='upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"'
alias set_date_0='echo "date 042816192024 && /sbin/hwclock -w"'
alias set_date_1='echo "date -s "Tue Jan 6 23:52 2026""'
alias set_date_2='echo "dpkg-reconfigure tzdata"'
alias edit_apt_sources='sudo apt edit-sources'
alias birth='stat / | grep "Birth"'
alias pfetch='PF_INFO="host os kernel uptime cpu memory pkgs wm de wm_theme gtk_theme icon_theme shell editor palette" EDITOR="vi" PF_SEP=":" my-pfetch'
alias kill_caps='/usr/bin/setxkbmap -option ctrl:nocaps'

## Monitor:
## alias watch_cpus="watch -n.5 'grep "^[c]pu MHz" /proc/cpuinfo'"

## Check current setting - cpu0, cpu1, cpu2, etc:
## cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

## Set to 'performance' - Have to be the user root:
## echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

alias list-files-dir='find . -type f | cut -d/ -f2 | sort | uniq -c'
## List the top 20 largest recursive subdirectories starting from the current location as the base path
## alias duk="du -k . 2>/dev/null | sort -nr | awk '{split('KB MB GB TB',v);s=1;while($1>1024){$1/=1024;s++}printf("%s\t%s\n",int($1+0.5)v[s],$2)}'| head -n20"
alias duk="du -k . 2>/dev/null \
  |sort -nr \
  |awk '{split('KB MB GB TB',v);s=1;while($1>1024){$1/=1024;s++}printf("%s\t%s\n",int($1+0.5)v[s],$2)}' \
  |head -n20"


function list_kernels () {

if [ `awk -F= '$1=="ID" { print $2 ;}' /etc/os-release` == 'debian' ];
then 

echo -e "-----------------"
echo -e "Installed Headers: "
echo -e "-----------------"
dpkg --list | grep linux-headers
echo -e "-----------------"
echo -e "Installed Modules: "
echo -e "-----------------"
dpkg --list | grep linux-modules
echo -e "-----------------"
echo -e "Installed Kernels: "
echo -e "-----------------"
dpkg --list | grep linux-image

else dpkg --get-selections | grep linux-headers && dpkg --get-selections | grep linux-image && dpkg --get-selections | grep linux-modules;

echo -e "-----------------"
echo -e "Installed Kernels: "
echo -e "-----------------"

fi

echo -e "--------------"
echo -e "Running Kernel: "
echo -e "--------------"
uname -a
echo -e " "

}


function sysinfo () {

echo -e "\tLoad:\t" "$(cat /proc/loadavg | awk '{print $1}')"

cat /sys/class/thermal/thermal_zone0/temp > /tmp/cpu_temp_0
echo -e "\tTemp 0:\t" "$((`cat /tmp/cpu_temp_0`/1000 ))"°""
cat /sys/class/thermal/thermal_zone1/temp > /tmp/cpu_temp_1
echo -e "\tTemp 1:\t" "$((`cat /tmp/cpu_temp_1`/1000 ))"°""

echo -e "\tRAM:\t" "$(free -m | awk 'NR==2{printf "RAM: %s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }'| cut -d " " -f3)"
}

colors () {
    for i in {0..255}; do
        printf '\e[48;5;%dm%3d ' "$i" "$i"
        (((i+3) % 18)) || printf '\e[0m\n'
    done
    printf '\e[0m\n'
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


## EOF ##

