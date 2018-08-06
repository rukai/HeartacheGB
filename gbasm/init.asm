Init:
	di
	; disable LCD
wait:
	ld a [0xFF00+0x44]
	cp 0x90
	jr nz wait
	xor a
	ld [0xFF00+0x40] a

	; load sprites into first tile pattern table in vram
	ld de GraphicsBinary
	ld hl 0x8000
	ld bc 0x0FFF
loadGraphics:
	ld a [de]
	ld [hl] a
	inc de
	inc hl
	dec bc
	ld a c
	and a
	jp nz loadGraphics
	ld a b
	and a
	jp nz loadGraphics

	; background and sprite palettes
	ld a 0x1B
	ld [0xFF00+0x47] a
	ld [0xFF00+0x48] a

	; background offset
	ld a 0-0xA
	ld [0xFF00+0x42] a
	ld a 0-0x2C
	ld [0xFF00+0x43] a

	; window offset
	ld a 0x70
	ld [0xFF00+0x4A] a
	ld a 0x7
	ld [0xFF00+0x4B] a

    ret

InitFinalize:
	; enable display with sprites background and window
	ld a 0xF3; 0b11110011
	ld [0xFF00+0x40] a

	; setup interrupts
	ei
	ld a 0x1
	ld [0xFF00+0xFF] a

	ret
