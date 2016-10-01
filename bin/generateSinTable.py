#!/usr/bin/env python3

import math

table = []
for i in range(256):
    sin_in = i * 2 * math.pi / 64 + math.pi/2
    value = round(math.sin(sin_in) * 7)
    if value >= 0:
        table.append(value)
    else:
        table.append(256 + value)

print(table)
with open("sinTable.bin", 'wb') as f:
    f.write(bytes(table))
