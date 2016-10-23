#!/bin/sh
rgbasm -o main.obj src/main.asm
rgblink -m game.map -n game.sym -o heartache.gb main.obj
rgbfix -p 0 -v heartache.gb
