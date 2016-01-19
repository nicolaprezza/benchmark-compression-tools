all_data=all_data.txt
sizes=sizes.txt

rm $all_data
rm $sizes

for folder in artificial pseudo-real real; do
	for file in $folder/data/*.time; do

		algo=`cat $file | grep "Command being timed:" | cut -d'"' -f 2 | cut -d' ' -f1`
		f=`cat $file | grep "Command being timed:" | cut -d'"' -f 2 | cut -d' ' -f2 | awk -F/ '{print $NF}'`
		RSS=`cat $file | grep "Maximum resident set size" | cut -d' ' -f 6`
		ftime=`cat $file | grep "Elapsed (wall clock)" | cut -d' ' -f 8`

		printf $algo"\t"$f"\t"$RSS"\t"$ftime"\n" >> $all_data

	done
done

for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		f=`echo $file | awk -F/ '{print $NF}'`
		s=`wc -c $file | cut -d' ' -f1`
		s=$((s/1024))	#convert to kB
		printf $f"\t"$s"\n" >> $sizes

	done
done

# ----------------------------------------- SPACE - KB

#print table header
printf "dataset"
printf "\tsize (KB)"

for t in `cat $all_data | cut -f1 | sort | uniq`; do #for all tools
	printf "\t"$t
done
printf "\n"

#print table content
for d in `cat $all_data | cut -f2 | sort | uniq`; do #for all datasets

	printf $d #print dataset

	d_size=`cat $sizes | grep $d | cut -f2` #dataset size (KB)

	printf "\t"$d_size

	for t in `cat $all_data | cut -f1 | sort | uniq`; do #for all tools
		
		t_size=`cat $all_data | grep -P ^"$t\t$d" | cut -f3`	#tool RAM consumption
		printf "\t"$t_size

	done

	printf "\n"

done


printf "\n\n"
# ----------------------------------------- SPACE - bits per character

#print table header
printf "dataset"
printf "\tsize (KB)"

for t in `cat $all_data | cut -f1 | sort | uniq`; do #for all tools
	printf "\t"$t
done
printf "\n"

#print table content
for d in `cat $all_data | cut -f2 | sort | uniq`; do #for all datasets

	printf $d #print dataset

	d_size=`cat $sizes | grep $d | cut -f2` #dataset size (KB)

	printf "\t"$d_size

	for t in `cat $all_data | cut -f1 | sort | uniq`; do #for all tools
		
		t_size=`cat $all_data | grep -P ^"$t\t$d" | cut -f3`	#tool RAM consumption
		
		#avoid errors
		if [ "$t_size" = "" ]; then 
			printf "\t-"
		else
			printf "\t"`echo "scale=4;8*$t_size/$d_size" | bc`
		fi
	
	done

	printf "\n"

done


