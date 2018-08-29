; functions
DMARoutineHRAM EQU 0xFF80

; variables
wMenuSelection EQU 0xC000 ; 0 - 2
wBattleState   EQU 0xC001 ; attack, menu, item etc
wBattleStateCounter EQU 0xC002 ; number of ticks current wBattleState has run for
wBattleStage   EQU 0xC003 ; progress in the battle
wPlayerHealth  EQU 0xC004
wTorielHealth  EQU 0xC005
wTextType      EQU 0xC006
; 0 - encounter
; 1 - flavor
; 2 - spare
; 3 - *
; 4 - *
wTextStringHi     EQU 0xC007
wTextStringLo     EQU 0xC008
wTextStringNextHi EQU 0xC009 ; Or Prev ...
wTextStringNextLo EQU 0xC00A

; joypad
wJoypadDirHold   EQU 0xC010
wJoypadDirPress  EQU 0xC011 ; assumed comes after wJoypadDirHold
wJoypadButHold   EQU 0xC012
wJoypadButPress  EQU 0xC013 ; assumed comes after wJoypadButHold

; music
wMusicEnable    EQU 0xC020 ; dont process music when 0
wMusicBank      EQU 0xC021 ; the bank the currently playing song is stored on
wMusicPointerHi EQU 0xC022 ; pointer to the currently playing song
wMusicPointerLo EQU 0xC023
wMusicRest      EQU 0xC024 ; rest for this many steps

; 0 - menu
; 1 - attack one
; 2 - attack two
; ...
wEntityStatesMSB EQU 0xC1
wEntityStates    EQU 0xC100
wEntityStatesEnd EQU 0xC1A0
wEntity0         EQU 0xC100
wEntity1         EQU 0xC110
wEntity2         EQU 0xC120
wEntity3         EQU 0xC130
wEntity4         EQU 0xC140
wEntity5         EQU 0xC150
wEntity6         EQU 0xC160
wEntity7         EQU 0xC170
wEntity8         EQU 0xC180
wEntity9         EQU 0xC190
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
wOAMBufferMSB EQU 0xCF
wOAMBuffer    EQU 0xCF00
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
SL1   EQU SL0+4
SLEnd EQU SL0+8

Alphabet    EQU SLEnd
Alphabet2   EQU SLEnd+35
AlphabetEnd EQU SLEnd+70

; Toriel tile lines
TorielL0  EQU AlphabetEnd
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
BackgroundL0  EQU 0x9800
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

; Window map lines
WindowL0  EQU 0x9C00
WindowL1  EQU WindowL0+32
WindowL2  EQU WindowL0+64
WindowL3  EQU WindowL0+96
WindowL4  EQU WindowL0+128
WindowL5  EQU WindowL0+160
WindowL6  EQU WindowL0+192
WindowL7  EQU WindowL0+224
WindowL8  EQU WindowL0+256
WindowL9  EQU WindowL0+288
WindowL10 EQU WindowL0+320
WindowL11 EQU WindowL0+352
WindowL12 EQU WindowL0+384
WindowL13 EQU WindowL0+416
WindowL14 EQU WindowL0+448
WindowL15 EQU WindowL0+480
WindowL16 EQU WindowL0+512
