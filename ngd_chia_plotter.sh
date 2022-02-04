#!/bin/bash
if [ $# -eq 2 ]; then 
  m=$1
  n=$2 
  for ((i=$m; i<=$n; i++ )) 
  do
    echo " -------- 10.1.$i.2 -------";
    gnome-terminal --tab --active -- bash -c "ssh 10.1.$i.2; exec bash" 
  done
else
  echo "Please use './0-wipe.sh [m] [n]' # m for first nvme drive and n for last nvme drive. Example: './0-wipe.sh 0 2'";
fi
#'export JAVA_HOME=/usr/lib/jvm/bellsoft-java12-aarch64;rm -rf /usr/share/elasticsearch/data/nodes/; vim /etc/elasticsearch/elasticsearch.yml'
