#!/bin/bash
zip_files=()
for file in *.zip; do
	if [[ -f "$file" ]]; then
		echo "Processing file: $file"
		if unzip "$file" -d "${file%.*}"; then
			echo "Sucessfully unzipped $file"
			echo "Adding $file for deletion"
			zip_files[${#zip_files[@]}]="$file"
		else
			echo "File $file could not be unzipped"
		fi
	else 
		echo "No .zip file to process"
	fi
done
echo "Deleting zip files"
for file in zip_files; do
	if [[-f "$file"]]; then 
		echo "Deleting $file"
		rm "$file"
	fi
done
