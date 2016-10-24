InitSound:
    ; registers
    ld a, $80 ; 0b10000000
	ld [$FF00+$26], a

	ld a, $77 ; 0b01110111
	ld [$FF00+$24], a

    ld a, $2  ; 0b00000010
    ld [$FF00+$25], a

    ; set sound variables
    ld e, Channel2Table / $FF
    ld d, Channel2Table & $FF

    ld hl, wMusicChan2Lo
    ld [hl], e
    inc hl
    ld [hl], d
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
    ld hl, Channel2Table

    ld a, [hl]
    ld [$FF00+$16], a
    inc hl

    ld a, [hl]
    ld [$FF00+$17], a
    inc hl

    ld a, [hl]
    ld [$FF00+$18], a
    inc hl

    ld a, [hl]
    ld [$FF00+$19], a
    inc hl

    ld a, [hl]
    ld de, wMusicChan2Delay
    ld [de], a
    inc hl

    ret
