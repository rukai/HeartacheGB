InitFireballs:
	; TODO: this code should be moved into something called by an entity draw call
    ; set render info

	; Zero out all sprite values to ensure that no unused sprites are displayed as garbage
	ld hl wOAMBuffer
	ld a 0xa0
repeat:
	ld [hl] 0
	inc hl
	dec a
	jp nz repeat

	; fireball 1
	ld hl wSprite4+2
	ld [hl] SL0+2
	ld hl wSprite4+3
	ld [hl] 0x0

	ld hl wSprite5+2
	ld [hl] SL0+3
	ld hl wSprite5+3
	ld [hl] 0x0

	ld hl wSprite6+2
	ld [hl] SL1+2
	ld hl wSprite6+3
	ld [hl] 0x0

	ld hl wSprite7+2
	ld [hl] SL1+3
	ld hl wSprite7+3
	ld [hl] 0x0

	; fireball 2
	ld hl wSprite8+2
	ld [hl] SL0+2
	ld hl wSprite8+3
	ld [hl] 0x0

	ld hl wSprite9+2
	ld [hl] SL0+3
	ld hl wSprite9+3
	ld [hl] 0x0

	ld hl wSprite10+2
	ld [hl] SL1+2
	ld hl wSprite10+3
	ld [hl] 0x0

	ld hl wSprite11+2
	ld [hl] SL1+3
	ld hl wSprite11+3
	ld [hl] 0x0

	; fireball 3
	ld hl wSprite12+2
	ld [hl] SL0+2
	ld hl wSprite12+3
	ld [hl] 0x0

	ld hl wSprite13+2
	ld [hl] SL0+3
	ld hl wSprite13+3
	ld [hl] 0x0

	ld hl wSprite14+2
	ld [hl] SL1+2
	ld hl wSprite14+3
	ld [hl] 0x0

	ld hl wSprite15+2
	ld [hl] SL1+3
	ld hl wSprite15+3
	ld [hl] 0x0

	; fireball 4
	ld hl wSprite16+2
	ld [hl] SL0+2
	ld hl wSprite16+3
	ld [hl] 0x0

	ld hl wSprite17+2
	ld [hl] SL0+3
	ld hl wSprite17+3
	ld [hl] 0x0

	ld hl wSprite18+2
	ld [hl] SL1+2
	ld hl wSprite18+3
	ld [hl] 0x0

	ld hl wSprite19+2
	ld [hl] SL1+3
	ld hl wSprite19+3
	ld [hl] 0x0

    ret

; hl is a parameter specifying the entity to act on
UpdateFireballSine:
	; TODO: maybe I can skip backing up the h register
	ld b h ; backup entity acting on+3
	ld c l

	inc hl
	inc hl
	inc hl
	ld e [hl] ; get counter
	ld d 0

	ld hl SinTable
	add hl de
	; TODO: I can skip above 16 bit addition if I can align wSinJump to XX00
	ld a [hl] ; velocity = mem[sinetable + counter]

	ld h b
	ld l c
	add a [hl] ; X += velocity
	ld [hl] a

	inc hl
	inc [hl] ; Y += 1

	ret
