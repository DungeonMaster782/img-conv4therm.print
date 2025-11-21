# img-conv4therm.print

A simple bash script to convert images into grayscale, dithered versions suitable for thermal printers.

## Features
- Optional width resizing while preserving aspect ratio
- Ordered dithering for clean thermal printing
- Keeps original resolution if width is not specified

![Demo Screenshot](demo-img/Screenshot_20251121_180411.png)

## Dependencies
- [ImageMagick](https://imagemagick.org/) (tested with version 7+)

## Usage
![Demo Screenshot](demo-img/photo_2025-11-21_18-09-15.jpg)

```bash
./thermal_convert.sh <input_file> <output_file> [width]

