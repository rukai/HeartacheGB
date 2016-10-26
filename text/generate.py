#!/usr/bin/env python3

text_out = ""
pointers_out = "; This file is auto-generated do not edit\n"
section_count = {}

total_offset = 0

with open('text.txt', 'r') as file_in:
    for line in file_in.readlines():
        section, text = line.split('$')
        text_out += text
    
        count = section_count.get(section, 0);
        pointer = "Text{}{} EQU YO + {}\n".format(section, count, total_offset)
        pointers_out += pointer

        total_offset += len(text)
        section_count[section] = section_count.get(section, 0) + 1

with open('text.out', 'wb') as out:
    out.write(bytes(text_out, "ascii"))

with open('textPointers.asm', 'wb') as out:
    out.write(bytes(pointers_out, "ascii"))
