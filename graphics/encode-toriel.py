#!/usr/bin/env python3

from PIL import Image
from array import array

image = Image.open("toriel.png")
image.load()
output = array('B')

for vert_tile in range(image.height // 8):
    for hor_tile in range(image.width // 8):
        for vert_line in range(8):
            byte0 = 0
            byte1 = 0
            for hor_line in range(8):
                x = hor_tile  * 8 + hor_line
                y = vert_tile * 8 + vert_line
                color = image.getpixel((x, y),) - 1
                byte0 |= (color  & 0b01)       << (7 - hor_line)
                byte1 |= ((color & 0b10) >> 1) << (7 - hor_line)
            output.append(byte0)
            output.append(byte1)

with open("toriel.chr", "bw") as f:
    output.tofile(f)
