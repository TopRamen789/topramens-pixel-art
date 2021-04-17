#!/bin/bash
# Loop through modified .aseprite files, use Aseprite's command line interface to save modified files as pngs.
set -m
export aseprite="/mnt/c/Program Files (x86)/Steam/steamapps/common/Aseprite"
find . -type f -name '*.aseprite' -print0 | while IFS= read -r -d '' file; do
	echo "$file"
    "$aseprite"/aseprite.exe -b "${file}" --scale 5 --save-as "${file/.aseprite/.png}"
done
# Add newly converted pngs to the commit
if [ -e .commit ]
    then
    rm .commit
    git add .
    git commit --amend -C HEAD --no-verify
fi
exit 0