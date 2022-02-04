#!/bin/bash

Srever=ngd@10.1.1.1
DirD=/media/newport_0/plots
while :
do
	for ((i=0; i<=8; i++ )) 
	do
		plots_dir=/mnt/newport_$i/plots/*.plot;		
		for plot in $plots_dir #"${plots_dir[@]}" 
		do
			echo $plot;
			#echo "$(basename "$plot")";
			#echo $basename1;
			if [[ -f $plot ]]; then {
				fsize=`wc -c $plot | awk '{ print $1 }'`;
				echo $fsize;
				#if [ $fsize -gt 300 ]; then
					scp $plot $Srever:$DirD/"$(basename "$plot")".tmp;
					#ls -l $plot
					if [ $? -eq 0 ]; then {
						echo scp_ok;
						rm $plot;
						ssh $Srever "mv $DirD/"$(basename "$plot")".tmp $DirD/"$(basename "$plot")";exit";
						#ls -l $plot
						if [ $? -eq 0 ]; then
							echo mv_ok;
						else
							echo MV_FAIL;
							exit 1;
						fi
					}
					else
						echo scp_FAIL;
						exit 1;
					fi 

				#fi       
			}	
			fi
		done
	done
	echo sleep_300;
	sleep 300;
done


#plots_dir=(/media/newport_1/plots/*.plot /media/newport_2/plots/*.plot /media/newport_3/plots/*.plot /media/newport_4/plots/*.plot /media/newport_5/plots/*.plot /media/newport_6/plots/*.plot /media/newport_7/plots/*.plot /media/newport_8/plots/*.plot /media/newport_10/plots/*.plot)




