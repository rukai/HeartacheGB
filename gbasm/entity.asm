DrawEntities:
	ld l 0x00
	call DrawEntity
	ld l 0x10
	call DrawEntity
	ld l 0x20
	call DrawEntity
	ld l 0x30
	call DrawEntity
	ld l 0x40
	call DrawEntity
	ld l 0x50
	call DrawEntity
	ld l 0x60
	call DrawEntity
	ld l 0x70
	call DrawEntity
	ld l 0x80
	call DrawEntity
	ld l 0x90
	call DrawEntity
	ret

; takes register l as parameter for entity
; because LSB x/y are same on both wOAMBuffer and wEntity we can do some fancy stuff
DrawEntity:
	; get x/y
	ld h wEntityStatesMSB
	ldi a [hl]
	ld d a     ; x 
	add 0x08
	ld c a     ; x offset

	ldd a [hl] ; y offset
	ld b a     ; y
	add 0x08

	; set x/y
	ld h wOAMBufferMSB
	ld [hl] b
	inc l
	ld [hl] d
	
	inc l
	inc l
	inc l
	ld [hl] b
	inc l
	ld [hl] c

	inc l
	inc l
	inc l
	ld [hl] a
	inc l
	ld [hl] d

	inc l
	inc l
	inc l
	ld [hl] a
	inc l
	ld [hl] c

    ret

UpdateEntities:
	ld hl wEntity0
	call UpdateEntity
	ld hl wEntity1
	call UpdateEntity
	ld hl wEntity2
	call UpdateEntity
	ld hl wEntity3
	call UpdateEntity
	ld hl wEntity4
	call UpdateEntity
	ld hl wEntity5
	call UpdateEntity
	ld hl wEntity6
	call UpdateEntity
	ld hl wEntity7
	call UpdateEntity
	ld hl wEntity8
	call UpdateEntity
	ld hl wEntity9
	call UpdateEntity

    ret

UpdateEntity:
	inc hl
	inc hl
	ld a [hl]
	inc hl
	inc [hl]
	dec hl
	dec hl
	dec hl

	cp 1
	call z UpdatePlayer
	cp 2
	call z UpdateFireballSine

	ret
