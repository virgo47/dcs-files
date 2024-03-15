#!/usr/bin/env bash
# Updates kneeboards in the Saved Games from this project for the specified aircraft(s).
#
# Parameters:
# 1. name of the source directory under Kneeboard (you can use path before it, it will be ignored)
#
# This name can target multiple names separated by comma (optional space after comma allowed).
# The script can be run from any directory.
#
# NOTE:
# This is intended to be used right after pdf-to-kneeboard.sh and works like this:
# - If there are any *.png files in _sources-and-scripts, it MOVES them into the source directory first.
# - Then it copies from there to the DCS saved games kneeboards.
# - If any old kneeboards are in the source directory, remove them first.
#
# Examples - both these do the same:
# ./update-saved-games-kneeboards.sh ../L-39C\,\ L-39ZA/
# _sources-and-scripts/update-saved-games-kneeboards.sh "L-39C, L-39ZA"


set -eu

scripts_dir=$(cd $(dirname "$0") && pwd)
source_dir=$(basename "$1")
cd "$scripts_dir/../$source_dir"

mv "$scripts_dir"/*.png . 2>/dev/null && echo "Moved PNGs from working directory" || true

IFS=',' read -r -a directories <<< "${source_dir//, /,}"

for dir in "${directories[@]}"; do
  target_dir="$HOME/Saved Games/DCS.openbeta/Kneeboard/$dir"
  mkdir -p "$target_dir"
  echo "Copying PNGs to $target_dir"
  cp *.png "$target_dir" 
done
