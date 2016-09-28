InitPlayer:
	; set x/y
	ld hl, wPlayerY
	ld [hl], $30
	ld hl, wPlayerX
	ld [hl], $20

	; set render info
	ld hl, wOAMBuffer+$2
	ld [hl], SL0
	ld hl, wOAMBuffer+$3
	ld [hl], $0

	ld hl, wOAMBuffer+$6
	ld [hl], SL0+1
	ld hl, wOAMBuffer+$7
	ld [hl], $0

	ld hl, wOAMBuffer+$A
	ld [hl], SL1
	ld hl, wOAMBuffer+$B
	ld [hl], $0

	ld hl, wOAMBuffer+$E
	ld [hl], SL1+1
	ld hl, wOAMBuffer+$F
	ld [hl], $0

	ret

DrawPlayer:
	; get coords
	ld hl, wPlayerX
	ld a, [hl]
	ld d, a    ; x 
	add $8
	ld c, a    ; x offset

	ld hl, wPlayerY
	ld a, [hl]  ; y offset
	ld b, a     ; y
	add $8

	; set coords
	ld hl, wOAMBuffer
	ld [hl], b
	ld hl, wOAMBuffer+1
	ld [hl], d
	
	ld hl, wOAMBuffer+4
	ld [hl], b
	ld hl, wOAMBuffer+5
	ld [hl], c

	ld hl, wOAMBuffer+8
	ld [hl], a
	ld hl, wOAMBuffer+9
	ld [hl], d

	ld hl, wOAMBuffer+$C
	ld [hl], a
	ld hl, wOAMBuffer+$D
	ld [hl], c

	ret

UpdatePlayer:
	; set joypad to dir
	ld hl, $FF00
	res 4, [hl]

	; move player
	ld a, [$FF00]

	bit 0, a
	jp nz, SkipRight
	ld hl, $C001
	inc [hl]
	inc [hl]
SkipRight:

	bit 1, a
	jp nz, SkipLeft
	ld hl, $C001
	dec [hl]
	dec [hl]
SkipLeft:

	bit 2, a
	jp nz, SkipUp
	ld hl, $C000
	dec [hl]
	dec [hl]
SkipUp:

	bit 3, a
	jp nz, SkipDown
	ld hl, $C000
	inc [hl]
	inc [hl]
SkipDown:
    ret
