#!/bin/bash
# This shell script cleans up i18n/*/dictionary files from unused keys.
# Use at your own risk.
#
# 1. unzip the mission into an empty directory, e.g. "mission-tmp" and go inside
# 2. run this script
# 3. zip the result back to the mission file, preferably with a different name
# 3x: remove dictionary.bak files and re-zip the mission after the test
# 4. test the mission (load it in ME and try to play it)
# 5. if happy, you may replace the original mission

set -eu

# TODO support for mission argument, unzip, and rezip without baks
#mission_file="$1"

# We will gather the used keys into a bash array:
mapfile -t used_keys < <(grep -r DictKey_ --exclude=dictionary --exclude=dictionary.bak |
  sed -e 's|^.*["'\'']\(DictKey_[^"'\'']*\).*$|\1|g' | sort -u)

echo "Used keys:"
for item in "${used_keys[@]}"; do
  echo "$item"
done
 
# Function to check if a string contains any used key:
contains_key() {
  local string="$1"
  for key in "${used_keys[@]}"; do
    if [[ $string == *"$key"* ]]; then
      return 0 # found
    fi
  done
  return 1 # no match
} 
 
for dictfile in l10n/*/dictionary ; do
  output_file="$dictfile.fixed"
  > $output_file # creating an empty file/emptying existing one
  echo
  echo "Processing $dictfile"
  while IFS= read -r line; do
    if [[ "$line" =~ \"DictKey_ ]]; then
      if contains_key "$line"; then
        echo "$line" >> $output_file
      else
        echo "Removing: $line"
      fi
    else
      echo "$line" >> $output_file
    fi
  done < $dictfile
  mv -n $dictfile $dictfile.bak # don't not rewrite any previous bak files
  mv $output_file $dictfile
done
echo "DONE"
