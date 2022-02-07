#!/bin/bash
if [ $# -eq 2 ]; then 
  m=$1
  n=$2 
  for ((i=$m; i<=$n; i++ )) 
  do
    echo " -------- nvme$i -------";
    #sudo mkdir /mnt/newport_$i;	
    #sudo mkfs.ext4 "/dev/nvme"$i"n1";
    #sudo mkfs.ext4 "/dev/nvme"$i"n1p1";
    #sudo mount "/dev/nvme"$i"n1p1" /media/newport_$i;
    sudo mount "/dev/nvme"$i"n1p1" /mnt/newport_$i;
    #rm -r /media/newport_$i/tmp*
    #sudo chmod -R 777 /media/tmp/tmp_$i;

    #sudo mount "/dev/nvme"$i"n1" "/mnt/newport_"$i;
    #sudo chown -R ngd.ngd /mnt/newport_$i/;
    #sudo chmod -R 777 /mnt/newport_$i;
    #sudo chmod -R 777 /media/newport_$i;
    #sudo mkdir /media/newport_$i;	
    #sudo umount "/mnt/newport_"$i;
  done
else
  echo "Please use './ngd_cmds.sh [m] [n]' # m for first nvme drive and n for last nvme drive. Example: './ngd_cmds.sh 0 2'";
fi

