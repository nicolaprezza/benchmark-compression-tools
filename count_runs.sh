#count runs
for folder in artificial pseudo-real real; do
	for file in $folder/data/*.txt; do

		echo "processing file "$file
		count-runs $file.sais.bwt > $file.bwt.runs
		echo ""

	done
done
