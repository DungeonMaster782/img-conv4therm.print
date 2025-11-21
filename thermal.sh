#!/bin/bash

show_help() {
    cat << EOF
Usage: $0 <input_file> <output_file> [width]

Converts an image to a grayscale, dithered version suitable for thermal printers.

Arguments:
  input_file     Path to the source image
  output_file    Path to save the converted image
  width          Optional: resize width in pixels (aspect ratio preserved). If omitted, original resolution is used.

Dependencies:
  - ImageMagick (tested with version 7+)

Examples:
  $0 input.png output.png         # Keep original resolution
  $0 input.png output.png 384     # Resize width to 384px
EOF
}

# Show help if no arguments or "-h"/"--help" is passed
if [ $# -eq 0 ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

INPUT="$1"
OUTPUT="$2"
WIDTH="$3"

if [ -n "$WIDTH" ]; then
    magick "$INPUT" -resize "${WIDTH}" -colorspace Gray -ordered-dither o8x8 "$OUTPUT"
else
    magick "$INPUT" -colorspace Gray -ordered-dither o8x8 "$OUTPUT"
fi

echo "Saved to $OUTPUT"
