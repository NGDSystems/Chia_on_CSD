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
echo . ./activate\; chia plots create -k 32 -b 4096 -u 128 -r 4 -n 40 -t /mnt/newport_$i/tmp$j/ -d /mnt/newport_$i/plots/ -f 8d793f4dc8142416220e647a929870c41819dd72f37ec02ef7149cec57c37a32c309334afd5c69615effd4ca440cab63 -p b9cf4c07c2eae000bbd89dbe8f08d0417f52ab522986af93e056039ce64ce11b871e7205e43edd97b293b10b8f688953;
    exec bash"
  done
else
  echo "Please use './0-wipe.sh [m] [n]' # m for first nvme drive and n for last nvme drive. Example: './0-wipe.sh 0 2'";
fi
#  
