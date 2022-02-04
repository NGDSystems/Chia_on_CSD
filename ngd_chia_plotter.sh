#!/bin/bash
if [ $# -eq 3 ]; then 
  m=$1
  n=$2
  j=$3
  for ((i=$m; i<=$n; i++ )) 
  do
    echo " -------- nvme$i -------";
    gnome-terminal --tab --active -- bash -c "
    cd ~/chia-blockchain;
echo . ./activate\; chia plots create -k 32 -b 4096 -u 128 -r 4 -n 40 -t /mnt/newport_$i/tmp$j/ -d /mnt/newport_$i/plots/ -f Farmer_Public_Key -p Pool_Public_Key;
    exec bash"
  done
else
  echo "Please use './ngd_chia_plotter.sh [m] [n] [j]' # m for first nvme drive, n for last nvme drive and j tmp folder name. Example: './ngd_chia_plotter.sh 0 6 1'";
fi
#  
