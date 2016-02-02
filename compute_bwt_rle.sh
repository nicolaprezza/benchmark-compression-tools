#compute all BWTs with the rle_bwt algorithm
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		/usr/bin/time -v rle_bwt $file $file.rlebwt.bwt > $file.rlebwt.bwt.time 2>&1
		rm $file.rlebwt.bwt
		echo ""

	done
done
