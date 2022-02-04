#!/bin/bash
if [ $# -eq 2 ]; then 
m=$1
n=$2 
for ((i=$m; i<=$n; i++ ))
do
echo " -------- nvme$i -------";
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk "/dev/nvme"$i"n1"
    g # new partition    
    n # new partition
    1 # partition number 1
      # default - start at beginning of disk 
      # 1T data parttion
    w # write the partition table
EOF
sudo mkfs.ext4 "/dev/nvme"$i"n1p1";
done
else
  echo "Please use './ngd_partition.sh [m] [n]' # m for first nvme drive and n for last nvme drive. Example: './ngd_partition.sh 0 2'"; 
fi
