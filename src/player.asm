InitPlayer:
	; set x/y
    ld hl, wEntity0
    ld [hl], $30
	inc hl
    ld [hl], $20
	inc hl
    ld [hl], 1
	inc hl
    ld [hl], 0

	; set render info
	ld hl, wSprite0+2
	ld [hl], SL0
	ld hl, wSprite0+3
	ld [hl], $0

	ld hl, wSprite1+2
	ld [hl], SL0+1
	ld hl, wSprite1+3
	ld [hl], $0

	ld hl, wSprite2+2
	ld [hl], SL1
	ld hl, wSprite2+3
	ld [hl], $0

	ld hl, wSprite3+2
	ld [hl], SL1+1
	ld hl, wSprite3+3
	ld [hl], $0

	ret

UpdatePlayer:
	; set joypad to dir
	ld hl, $FF00
	res 4, [hl]

	; move player
	ld a, [$FF00]

	bit 0, a
	jp nz, SkipRight
	ld hl, wPlayerX
	inc [hl]
	inc [hl]
SkipRight:

	bit 1, a
	jp nz, SkipLeft
	ld hl, wPlayerX
	dec [hl]
	dec [hl]
SkipLeft:

	bit 2, a
	jp nz, SkipUp
	ld hl, wPlayerY
	dec [hl]
	dec [hl]
SkipUp:

	bit 3, a
	jp nz, SkipDown
	ld hl, wPlayerY
	inc [hl]
	inc [hl]
SkipDown:

    ret
