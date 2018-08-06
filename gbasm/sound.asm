InitSound:
    ; registers
    ld a 0x80 ; 0b10000000
	ld [0xFF00+0x26] a

	ld a 0x77 ; 0b01110111
	ld [0xFF00+0x24] a

    ld a 0xFF  ; 0b00000010
    ld [0xFF00+0x25] a

    ; set sound variables
    ld hl wMusicChan2
    ld [hl] 0

    inc hl
    ld [hl] 0

    ret

Sound:
    ; delay
    ld hl wMusicChan2Delay
    ld a [hl]
    and a
    jp z playChan2
    dec [hl]
    ret

playChan2:
    ld d Channel2Table / 0xFF
    ; load table progress
    ld hl wMusicChan2
    ld e [hl]

    ; play entry
    ld a [de]
    ld [0xFF00+0x16] a
    inc e

    ld a [de]
    ld [0xFF00+0x17] a
    inc e

    ld a [de]
    ld [0xFF00+0x18] a
    inc e

    ld a [de]
    ld [0xFF00+0x19] a
    inc e

    ld a [de]
    ld hl wMusicChan2Delay
    ld [hl] a
    inc e

    ; ayyy lmao
    inc e
    inc e
    inc e

    ; loop song early
    ld a e
    cp 0x30
    jp nz saveProgress
    ld e 0

    ; save table progress
saveProgress:
    ld hl wMusicChan2
    ld [hl] e

    ret
