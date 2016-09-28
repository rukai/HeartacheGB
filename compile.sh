#!/bin/sh
rgbasm -o main.obj src/main.asm
rgblink -m game.map -n game.sym -o rom.gb main.obj
rgbfix -p 0 -v rom.gb
