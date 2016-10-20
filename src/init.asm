Init:
	di
	; disable LCD
wait:
	ld a, [$FF00+$44]
	cp $90
	jr nz, wait
	xor a
	ld [$FF00+$40], a

	; load tiles into ram
	ld de, GraphicsBinary
	ld hl, $8000
	ld bc, $0C00
LoadGraphics:
	ld a, [de]
	ld [hl], a
	inc de
	inc hl
	dec bc
	ld a, c
	and a
	jp nz, LoadGraphics
	ld a, b
	and a
	jp nz, LoadGraphics

	; background and sprite palettes
	ld a, $1B
	ld [$FF00+$47], a
	ld [$FF00+$48], a

	; background offset
	ld a, -$A
	ld [$FF00+$42], a
	ld a, -$2C
	ld [$FF00+$43], a

    ret

InitFinalize:
	; enable display w\ sprites
	ld a, $93; 0b10010011
	ld [$FF00+$40], a

	; setup interrupts
	ei
	ld a, $1
	ld [$FF00+$FF], a

	ret
