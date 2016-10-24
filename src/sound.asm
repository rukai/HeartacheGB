InitSound:
    ; registers
    ld a, $80 ; 0b10000000
	ld [$FF00+$26], a

	ld a, $77 ; 0b01110111
	ld [$FF00+$24], a

    ld a, $FF  ; 0b00000010
    ld [$FF00+$25], a

    ; set sound variables
    ld hl, wMusicChan2
    ld [hl], 0

    inc hl
    ld [hl], 0

    ret

Sound:
    ; delay
    ld hl, wMusicChan2Delay
    ld a, [hl]
    and a
    jp z, playChan2
    dec [hl]
    ret

playChan2:
    ld d, Channel2Table / $FF
    ; load table progress
    ld hl, wMusicChan2
    ld e, [hl]

    ; play entry
    ld a, [de]
    ld [$FF00+$16], a
    inc e

    ld a, [de]
    ld [$FF00+$17], a
    inc e

    ld a, [de]
    ld [$FF00+$18], a
    inc e

    ld a, [de]
    ld [$FF00+$19], a
    inc e

    ld a, [de]
    ld hl, wMusicChan2Delay
    ld [hl], a
    inc e

    ; ayyy lmao
    inc e
    inc e
    inc e

    ; loop song early
    ld a, e
    cp $10
    jp nz, saveProgress
    ld e, 0

    ; save table progress
saveProgress:
    ld hl, wMusicChan2
    ld [hl], e

    ret
