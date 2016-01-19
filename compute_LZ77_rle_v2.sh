#compute LZ77 in RLE+LZ77 space
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		echo "benchmark: "$file.rle_lz77_v2.time
		/usr/bin/time -v rle_lz77_v2 $file /dev/null 2> $file.rle_lz77_v2.time
		echo ""

	done
done
