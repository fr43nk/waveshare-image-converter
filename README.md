# waveshare-image-converter
Small script for converting images for the waveshare photopainter.

https://www.waveshare.com/PhotoPainter-B.htm

The picture frame uses a 6 color e-paper display with a resolution of 800px x 480px. To use the picture they need to be converted into the bitmap format.

Restrictions are
- resolution 800px x 480px
- bit depth 565, means red 5 bit, green 6bit, blue 5bit

This simple shell script uses [imagemagick](www.imagemagick.org) for the heavy lifting. It takes the source path and finds all jpg or jpeg files. Then it stores the converted file to the given destination path.

Tested on the MacOS environment in combination with [brew](https://brew.sh).

## install imagemagick
```bash
brew install imagemagick
````

## Run the script
```bash
./convert_to_bmp.sh SRC_DIR DEST_DIR
```

## Imagemagick insights

- https://usage.imagemagick.org/resize
- https://usage.imagemagick.org/quantize
- https://usage.imagemagick.org/formats/#bmp
