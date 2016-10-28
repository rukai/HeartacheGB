Init:
	di
	; disable LCD
wait:
	ld a, [$FF00+$44]
	cp $90
	jr nz, wait
	xor a
	ld [$FF00+$40], a

	; load sprites into first tile pattern table in vram
	ld de, GraphicsBinary
	ld hl, $8000
	ld bc, $0FFF
loadGraphics:
	ld a, [de]
	ld [hl], a
	inc de
	inc hl
	dec bc
	ld a, c
	and a
	jp nz, loadGraphics
	ld a, b
	and a
	jp nz, loadGraphics

	; background and sprite palettes
	ld a, $1B
	ld [$FF00+$47], a
	ld [$FF00+$48], a

	; background offset
	ld a, -$A
	ld [$FF00+$42], a
	ld a, -$2C
	ld [$FF00+$43], a

	; window offset
	ld a, $70
	ld [$FF00+$4A], a
	ld a, $7
	ld [$FF00+$4B], a

    ret

InitFinalize:
	; enable display w/ sprites, background and window
	ld a, $f3; 0b11110011
	ld [$FF00+$40], a

	; setup interrupts
	ei
	ld a, $1
	ld [$FF00+$FF], a

	ret
