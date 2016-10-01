DrawEntities
	ld l, $0
	call DrawEntity
	ld l, $10
	call DrawEntity
	ld l, $20
	call DrawEntity
	ld l, $30
	call DrawEntity
	ld l, $40
	call DrawEntity
	ld l, $50
	call DrawEntity
	ld l, $60
	call DrawEntity
	ld l, $70
	call DrawEntity
	ld l, $80
	call DrawEntity
	ld l, $90
	call DrawEntity
	ret

; takes register l as parameter for fireball
; because LSB x/y are same on both wOAMBuffer and wEntity we can do some fancy stuff
DrawEntity:
	; get x/y
	ld h, wEntityStatesMSB
	ld a, [hli]
	ld d, a     ; x 
	add $8
	ld c, a     ; x offset

	ld a, [hld] ; y offset
	ld b, a     ; y
	add $8

	; set x/y
	ld h, wOAMBufferMSB
	ld [hl], b
	inc l
	ld [hl], d
	
	inc l
	inc l
	inc l
	ld [hl], b
	inc l
	ld [hl], c

	inc l
	inc l
	inc l
	ld [hl], a
	inc l
	ld [hl], d

	inc l
	inc l
	inc l
	ld [hl], a
	inc l
	ld [hl], c

    ret

UpdateEntities:
	ld hl, wEntity0
	call UpdateEntity
	ld hl, wEntity1
	call UpdateEntity
	ld hl, wEntity2
	call UpdateEntity
	ld hl, wEntity3
	call UpdateEntity
	ld hl, wEntity4
	call UpdateEntity
	ld hl, wEntity5
	call UpdateEntity
	ld hl, wEntity6
	call UpdateEntity
	ld hl, wEntity7
	call UpdateEntity
	ld hl, wEntity8
	call UpdateEntity
	ld hl, wEntity9
	call UpdateEntity

    ret

UpdateEntity:
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	inc [hl]
	dec hl
	dec hl
	dec hl

	cp a, 1
	call z, UpdatePlayer
	cp a, 2
	call z, UpdateFireballSine

	ret
