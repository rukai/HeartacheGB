; functions
DMARoutineHRAM EQU $FF80

; variables
wMenuSelection EQU $C000 ; 0 - 2
wBattleState   EQU $C001
wBattleCounter EQU $C002

; joypad
wJoypadDirHold   EQU $C010
wJoypadDirPress  EQU $C011
wJoypadRightPress EQU $C012
wJoypadRightHold  EQU $C013

; 0 - menu
; 1 - attack one
; 2 - attack two
; ...
wEntityStatesMSB EQU $C1
wEntityStates    EQU $C100
wEntityStatesEnd EQU $C1A0
wEntity0         EQU $C100
wEntity1         EQU $C110
wEntity2         EQU $C120
wEntity3         EQU $C130
wEntity4         EQU $C140
wEntity5         EQU $C150
wEntity6         EQU $C160
wEntity7         EQU $C170
wEntity8         EQU $C180
wEntity9         EQU $C190
; can hold up to 10 entities
; each entity is 16 bytes:
; * x
; * y
; * type
;   +   0 - None
;   +   1 - Heart
;   +   2 - Sine Fireball
; * timer
; * 12 bytes of padding to keep inline with OAM

; OAM
wOAMBufferMSB EQU $CF
wOAMBuffer    EQU $CF00
wSprite0      EQU wOAMBuffer
wSprite1      EQU wOAMBuffer+4
wSprite2      EQU wOAMBuffer+8
wSprite3      EQU wOAMBuffer+12
wSprite4      EQU wOAMBuffer+16
wSprite5      EQU wOAMBuffer+20
wSprite6      EQU wOAMBuffer+24
wSprite7      EQU wOAMBuffer+28
wSprite8      EQU wOAMBuffer+32
wSprite9      EQU wOAMBuffer+36
wSprite10     EQU wOAMBuffer+40
wSprite11     EQU wOAMBuffer+44
wSprite12     EQU wOAMBuffer+48
wSprite13     EQU wOAMBuffer+52
wSprite14     EQU wOAMBuffer+56
wSprite15     EQU wOAMBuffer+60
wSprite16     EQU wOAMBuffer+64
wSprite17     EQU wOAMBuffer+68
wSprite18     EQU wOAMBuffer+72
wSprite19     EQU wOAMBuffer+76

; Spritesheet tile lines
SL0   EQU 0
SL1   EQU SL0+8
SL2   EQU SL0+16
SL3   EQU SL0+24
SL4   EQU SL0+32
SL5   EQU SL0+40
SL6   EQU SL0+48
SL7   EQU SL0+56
SL8   EQU SL0+64
SLEnd EQU SL0+72

; Toriel tile lines
TorielL0  EQU SLEnd
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

; Background map lines
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
BackgroundL14 EQU BackgroundL0+448
BackgroundL15 EQU BackgroundL0+480
BackgroundL16 EQU BackgroundL0+512
