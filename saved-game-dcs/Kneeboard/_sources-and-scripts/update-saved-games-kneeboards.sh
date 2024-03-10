#!/usr/bin/env bash
# Updates kneeboards in the Saved Games from this project for the specified aircraft(s).
# Parameters:
# 1. name of the source directory under Kneeboard (you can use path before it, it will be ignored)
#
# This name can target multiple names separated by comma (optional space after comma allowed).
# The script can be run from any directory.
#
# Examples - both these do the same:
# ./update-saved-games-kneeboards.sh ../L-39C\,\ L-39ZA/
# _sources-and-scripts/update-saved-games-kneeboards.sh "L-39C, L-39ZA"


set -eu

source_dir=$(basename "$1")
cd "$(dirname "$0")/../$source_dir"

IFS=',' read -r -a directories <<< "${source_dir//, /,}"

for dir in "${directories[@]}"; do
  target_dir="$HOME/Saved Games/DCS.openbeta/Kneeboard/$dir"
  mkdir -p "$target_dir"
  cp *.png "$target_dir" 
done
