#!/usr/bin/env bash
# Export the PDF with the kneeboards from Google Docs (typically using Letter page size).
# Parameters:
# 1. name of the input PDF file
# 2. common name of the output images XX-<common>.png
# 3. list of pages to convert separated with spaces
# Output overwrites any previous export, so move the previous PNGs to appropriate directory.
#
# Examples:
# ./pdf-to-pngs.sh ~/Downloads/"DCS L-39 Checklists.pdf" l-39 3 4 5 7 8 9 10
# ./pdf-to-pngs.sh ~/Downloads/"DCS P-47D Checklists.pdf" p-47 2 3 4 5 6 7 8 9 10 11
# TODO other plane examples/reusable commands

set -eu

pdf_in=$1
if [ ! -f "$pdf_in" ]; then
  echo "File '$pdf_in' does not exist"
  exit 1
fi
shift
common_name=$1
shift

for i in $*; do
  # 2> suppresses the invalid MiKTeX complaint about requiring Windows 10
  pdftoppm -jpeg -r 380 -f $i -l $i "$pdf_in" -singlefile 2> /dev/null |
    magick - -resize 800x -gravity center -crop 768x1024+0+0 +repage "$(printf "%02d" $i)-$common_name.png"
done
