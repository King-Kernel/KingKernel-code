#!/system/bin/sh

# (c) KingKernel kernel changes on late

#make logs folder
mkdir /storage/emulated/0/logs
LOG_FILE=/storage/emulated/0/logs/KingKernellog

echo " " > $LOG_FILE;
echo "Late tweaks started" | tee -a $LOG_FILE;

#Immediate executions for boot

# echo "Y" > /sys/module/msm_thermal/parameters/enabled

# A customized CPUSet profile for the first generation of Pixels (By xfirefly93) - with the goal of increasing both battery life, system responsivness and overall daily needed performance without any notable regressions, possible sacrifices and tradeoffs;
#echo "3" > /dev/cpuset/background/cpus
#echo "1,3" > /dev/cpuset/camera-daemon/cpus
#echo "0-1" > /dev/cpuset/foreground/cpus
#echo "2" > /dev/cpuset/kernel/cpus
#echo "2-3" > /dev/cpuset/restricted/cpus
#echo "2-3" > /dev/cpuset/system-background/cpus
#echo "0-3" > /dev/cpuset/top-app/cpus

#Schedutil gov tweaks

echo "500" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/down_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/iowait_boost_enable
echo "500" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/up_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/pl

#cpu1
echo "500" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/down_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/iowait_boost_enable
echo "500" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/up_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/pl

#cpu2
echo "500" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/down_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/iowait_boost_enable
echo "500" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/up_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/pl

#cpu3
echo "500" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/down_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/iowait_boost_enable
echo "500" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/up_rate_limit_us
echo "0" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/pl

#Default I/o sched cfq
echo "cfq" > /sys/block/sda/queue/scheduler
echo "cfq" > /sys/block/sdb/queue/scheduler
echo "cfq" > /sys/block/sdc/queue/scheduler
echo "cfq" > /sys/block/sdd/queue/scheduler
echo "cfq" > /sys/block/sde/queue/scheduler
echo "cfq" > /sys/block/sdf/queue/scheduler

#Change swappiness
echo "20" > /proc/sys/vm/swappiness

#Disable I/o stat for all queues
echo "0" > /sys/block/sda/queue/iostats
echo "0" > /sys/block/sdb/queue/iostats
echo "0" > /sys/block/sdc/queue/iostats
echo "0" > /sys/block/sdd/queue/iostats
echo "0" > /sys/block/sde/queue/iostats
echo "0" > /sys/block/sdf/queue/iostats

#1028 readahead KB for sde and sdf io scheds
echo "1028" > /sys/block/sde/queue/read_ahead_kb
echo "1028" > /sys/block/sdf/queue/read_ahead_kb

# Fixup LEDs
echo "170" > /sys/class/leds/blue/max_brightness
echo "170" > /sys/class/leds/green/max_brightness
echo "170" > /sys/class/leds/lcd-backlight/max_brightness
echo "170" > /sys/class/leds/led:switch/max_brightness
echo "170" > /sys/class/leds/red/max_brightness

# Force enable fast charge
echo "1" > /sys/kernel/fast_charge/force_fast_charge

#Enable audio high performance mode by default
echo "1" > /sys/module/snd_soc_wcd9330/parameters/high_perf_mode

sleep 25;
# Script log file location

export TZ=$(getprop persist.sys.timezone);
echo $(date) | tee -a $LOG_FILE
if [ $? -eq 0 ]
then
  echo "---------------------------------------------" | tee -a $LOG_FILE;
  echo "KingKernel late script successful!" | tee -a $LOG_FILE;
  exit 0
else
  echo "---------------------------------------------" | tee -a $LOG_FILE;
  echo "KingKernel late script failed. Please check your installation..." | tee -a $LOG_FILE;
  exit 1
fi
  
# Wait..
# Done!
#
