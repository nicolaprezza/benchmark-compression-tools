#compute LZ77 in RLE space
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		echo "benchmark: "$file.rle_lz77_v1.time
		/usr/bin/time -v rle_lz77_v1 $file /dev/null > $file.rle_lz77_v1.time 2>&1
		echo ""

	done
done
