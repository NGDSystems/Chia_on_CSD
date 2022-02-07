#!/bin/bash

if [ $# -eq 3 ]; then 
  m=$1
  n=$2
  j=$3
	for ((i=$m; i<=$n; i++ ))  
	do 
		echo ------$i-----; 
		pid=`ps aux | grep chia | grep newport_$j/tmp$i| awk '{print $2}'`;
		#ps aux | grep chia | grep newport_$i/tmp | wc -l;
		sudo kill $pid;
		echo $pid;
        	rm -r /mnt/newport_$j/tmp$i
	done
else
  echo "Please use './kill_plotter_threads.sh [m] [n]' # m for first nvme drive and n for last nvme drive. Example: './kill_plotter_threads.sh 0 2'";
fi
