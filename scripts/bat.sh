#!/usr/bin/bash

#This script tell how much mW laptop battery being consume

f_path=$(cat "/sys/class/power_supply/BAT0/power_now")

current_usage=$(( $f_path /1000 ))

echo $current_usage
