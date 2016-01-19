#compute LZ77 in H0 space

for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		echo "output factors: "$file.H0_lz77
		echo "benchmark: "$file.H0_lz77.time
		/usr/bin/time -v h0_lz77 $file $file.H0_lz77 > $file.H0_lz77.time 2>&1
		bytes=`wc -c $file.H0_lz77 | cut -d' ' -f 1` 		
		fact=$((bytes/17))		
		echo $fact" LZ77 factors"
		echo $fact > $file.lz77_factors
		echo ""

	done
done
