InitFireball:
    ; set x/y
    ld hl, wFireballY
    ld [hl], $50
    ld hl, wFireballX
    ld [hl], $40

    ; set render info
	ld hl, wSprite4+2
	ld [hl], SL0+2
	ld hl, wSprite4+3
	ld [hl], $0

	ld hl, wSprite5+2
	ld [hl], SL0+3
	ld hl, wSprite5+3
	ld [hl], $0

	ld hl, wSprite6+2
	ld [hl], SL1+2
	ld hl, wSprite6+3
	ld [hl], $0

	ld hl, wSprite7+2
	ld [hl], SL1+3
	ld hl, wSprite7+3
	ld [hl], $0

    ret

DrawFireball:
	ld hl, wFireballX
	ld a, [hl]
	ld d, a    ; x 
	add $8
	ld c, a    ; x offset

	ld hl, wFireballY
	ld a, [hl]  ; y offset
	ld b, a     ; y
	add $8

	; set coords
	ld hl, wSprite4
	ld [hl], b
	ld hl, wSprite4+1
	ld [hl], d
	
	ld hl, wSprite5
	ld [hl], b
	ld hl, wSprite5+1
	ld [hl], c

	ld hl, wSprite6
	ld [hl], a
	ld hl, wSprite6+1
	ld [hl], d

	ld hl, wSprite7
	ld [hl], a
	ld hl, wSprite7+1
	ld [hl], c

    ret

UpdateFireball:
    ld hl, wFireballY
    inc [hl]

    ret
