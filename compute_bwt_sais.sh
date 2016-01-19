#compute all BWTs
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		/usr/bin/time -v bwt $file $file.sais.bwt 2> $file.sais.bwt.time
		echo ""

	done
done

#count runs
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		count-runs $file > $file.runs
		echo ""

	done
done
