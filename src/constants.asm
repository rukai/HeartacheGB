DMARoutineHRAM EQU $FF80
wOAMBuffer EQU $CF00

wPlayerY   EQU $C000
wPlayerX   EQU $C001

; Spritesheet tile lines
SL0 EQU 0
SL1 EQU SL0+4
SL2 EQU SL0+8
SL3 EQU SL0+12
SL4 EQU SL0+16
SL5 EQU SL0+20
SL6 EQU SL0+24
SL7 EQU SL0+28
SL8 EQU SL0+32
SL9 EQU SL0+36

; Toriel tile lines
TorielL0  EQU 40
TorielL1  EQU TorielL0+9
TorielL2  EQU TorielL0+18
TorielL3  EQU TorielL0+27
TorielL4  EQU TorielL0+36
TorielL5  EQU TorielL0+45
TorielL6  EQU TorielL0+54
TorielL7  EQU TorielL0+63
TorielL8  EQU TorielL0+72
TorielL9  EQU TorielL0+81
TorielL10 EQU TorielL0+90
TorielL11 EQU TorielL0+99
TorielL12 EQU TorielL0+108
TorielL13 EQU TorielL0+117

BackgroundL0  EQU $9800
BackgroundL1  EQU BackgroundL0+32
BackgroundL2  EQU BackgroundL0+64
BackgroundL3  EQU BackgroundL0+96
BackgroundL4  EQU BackgroundL0+128
BackgroundL5  EQU BackgroundL0+160
BackgroundL6  EQU BackgroundL0+192
BackgroundL7  EQU BackgroundL0+224
BackgroundL8  EQU BackgroundL0+256
BackgroundL9  EQU BackgroundL0+288
BackgroundL10 EQU BackgroundL0+320
BackgroundL11 EQU BackgroundL0+352
BackgroundL12 EQU BackgroundL0+384
BackgroundL13 EQU BackgroundL0+416
