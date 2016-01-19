#compute LZ77 in RLE+LZ77 space
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.time; do

		algo=`cat $file | grep "Command being timed:" | cut -d'"' -f 2 | cut -d' ' -f1`
		f=`cat $file | grep "Command being timed:" | cut -d'"' -f 2 | cut -d' ' -f2 | awk -F/ '{print $NF}'`
		RSS=`cat $file | grep "Maximum resident set size" | cut -d' ' -f 6`
		ftime=`cat $file | grep "Elapsed (wall clock)" | cut -d' ' -f 8`

		echo $algo" "$f" "$RSS" "$ftime

	done
done
