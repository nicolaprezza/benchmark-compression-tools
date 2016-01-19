#compute all BWTs with the cw-bwt algorithm
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		/usr/bin/time -v cw-bwt $file $file.cwbwt.bwt 2> $file.cwbwt.bwt.time
		echo ""

	done
done
