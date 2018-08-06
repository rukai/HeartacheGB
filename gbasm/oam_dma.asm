; Taken from the red/blue decompilation project
; No need to reinvent the wheel :-)

WriteDMACodeToHRAM:
; Since no other memory is available during OAM DMA
; DMARoutine is copied to HRAM and executed there.
	ld c 0xFF80 % 0x100
	ld b DMARoutineEnd - DMARoutine
	ld hl DMARoutine
DMACopy:
	ldi a [hl]
	ld [0xff00+c] a
	inc c
	dec b
	jr nz DMACopy
	ret

DMARoutine:
	; initiate DMA
	ld a wOAMBuffer / 0x100
	ld [0xFF00 + 0x46] a

	; wait for DMA to finish
	ld a 0x28
DMAWait:
	dec a
	jr nz DMAWait
	ret
DMARoutineEnd:
