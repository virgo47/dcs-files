For folders named "X, Y", copy the content to the separate X and Y folders, one for each variant.

EDIT: See _sources

Other useful commands:

# To combine the original page with the emergency border:
magick L-39C\,\ L-39ZA/02-l-39.png \
    \( _common/checklist-border-emergency-narrow-sides.png -resize 768x1024^ \) -composite \
    output.png

# The same with some darkening of whites/bright colors (affects highlighting as well):
magick L-39C\,\ L-39ZA/02-l-39.png -evaluate multiply 0.85 \
 \( _common/checklist-border-emergency-narrow-sides.png -resize 768x1024 \) \
 -composite output.png

# Original page with transparent whites on a paper background (try paper-2 or 3 to vary it):
magick _common/paper-1.jpg -crop 768x1024+0+0 \
    \( L-39C\,\ L-39ZA/02-l-39.png -fuzz 10% -transparent white \) -composite \
    output.png

# The same with the emergency border:
magick _common/paper-1.jpg -crop 768x1024+0+0 \
    \( L-39C\,\ L-39ZA/02-l-39.png -fuzz 10% -transparent white \) -composite \
    \( _common/checklist-border-emergency-narrow-sides.png -resize 768x1024^ \) -composite \
    output.png

# Making the black on white inverted (night mode) with the background 12% grey instead of black:
magick L-39C\,\ L-39ZA/02-l-39.png -negate -brightness-contrast 12x0 output.png
