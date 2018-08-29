; two bytes:
; byte 1 specifies the command
; byte 2 specifies an argument for the command
;
; set audio registers:
; 0x10 - set FF10 ; channel 1
; 0x11 - set FF11
; 0x12 - set FF12
; 0x13 - set FF13
; 0x14 - set FF14
; 0x15 - invalid
; 0x16 - set FF16 ; channel 2
; 0x17 - set FF17
; 0x18 - set FF18
; 0x19 - set FF19
; 0x1A - set FF1A ; channel 3
; 0x1B - set FF1B
; 0x1C - set FF1C
; 0x1D - set FF1D
; 0x1E - set FF1E
; 0x1F - invalid
; 0x20 - set FF20 ; channel 4
; 0x21 - set FF21
; 0x22 - set FF22
; 0x23-0x7F invalid
; 0x80-0xFE - put cool commands here
;
; enable/disable music:
; 0xFC - set wMusicEnable
;
; pointer management:
; Use this to loop the song, chain the song across banks or lead into another song.
; 0xFD - set wMusicBank
; 0xFE - set wMusicPointerHi and wMusicPointerLo
;
; stop processing commands, rest for $argument game loops:
; 0xFF - set wMusicRest

; the commands are arranged so that only set 0xFFXX commands have the first bit 0
; this means we can quickly check the first bit, then use the byte as the address to write to.
; then the remaining commands can be manually checked.

InitSound:
    ; registers
    ld a 0x80 ; 0b10000000
	ld [0xFF00+0x26] a

	ld a 0x77 ; 0b01110111
	ld [0xFF00+0x24] a

    ld a 0xFF ; 0b00000010
    ld [0xFF00+0x25] a

    ; set sound variables
    xor a; ld a 0
    ld [wMusicEnable] a

    ret

Sound:
    ; enable
    ld a [wMusicEnable]
    and a ; cp 0
    ret z

    ; handle rests
    ld hl wMusicRest
    ld a [hl]
    and a ; cp 0
    jp z stepSound
    dec [hl]

    ret

stepSound:
    ; TODO set bank to wMusicBank

    ; get music pointer
    ld de wMusicPointerHi
    ld a [de]
    ld h a
    ld de wMusicPointerLo
    ld a [de]
    ld l a

processCommand:
    ; load command
    ldi a [hl]
    ld c a
    ; load argument
    ldi a [hl]

musicCommandWriteIO:
    bit 7 c
    jp nz musicCommands
    ld [0xFF00+c] a
    jp processCommand

musicCommands:
    ; the remaining commands match on the command so swap a and c
    ld b a
    ld a c
    ld c b

musicCommandRest:
    cp 0xFF
    jp nz musicCommandSetPointer
    ld a c
    ld [wMusicRest] a
    jp saveProgress

musicCommandSetPointer:
    cp 0xFE
    jp nz musicCommandFoo
    ld l [hl]
    ld h c
    jp processCommand

musicCommandFoo:
    ; TODO
    jp processCommand

saveProgress:
    ; save music pointer
    ld de wMusicPointerHi
    ld a h
    ld [de] a
    ld de wMusicPointerLo
    ld a l
    ld [de] a

    ret
