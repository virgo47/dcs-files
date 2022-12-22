#!/bin/bash
#
# Script cutting enormous map to smaller partially overlapping pieces
# Map from: https://www.digitalcombatsimulator.com/en/files/3305623/
# File renamed to dcs-caucasus-map-orig-flappie-26259x19377.tiff
#
# Original size 26259x19377, chunks 8000x8000, layout 3x4, overlap ~2k pixels
 
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+0+0 dcs-caucasus-map-1-1.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+0+5689 dcs-caucasus-map-1-2.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+0+11377 dcs-caucasus-map-1-3.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+6087+0 dcs-caucasus-map-2-1.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+6087+5689 dcs-caucasus-map-2-2.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+6087+11377 dcs-caucasus-map-2-3.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+12173+0 dcs-caucasus-map-3-1.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+12173+5689 dcs-caucasus-map-3-2.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+12173+11377 dcs-caucasus-map-3-3.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+18259+0 dcs-caucasus-map-4-1.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+18259+5689 dcs-caucasus-map-4-2.jpg
magick orig/dcs-caucasus-map-orig-flappie-26259x19377.tiff -crop 8000x8000+18259+11377 dcs-caucasus-map-4-3.jpg
