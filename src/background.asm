DrawBackground:
	; set background tile indexes
    ; TODO: Both the blanking code and the toriel code is missing tiles leaving 0 tiles everywhere o.0
	ld hl, $9800
	ld de, $400
repeatTile:
	ld [hl], TorielL0 ; BGB sees this called but it has no effect o.0
	inc hl
	dec de
	ld a, d
	and d
	jr nz, repeatTile
	ld a, e
	and e
	jr nz, repeatTile

    ; draw toriel
	ld hl, BackgroundL0
	ld [hl], TorielL0
	ld hl, BackgroundL0+1
	ld [hl], TorielL0+1
	ld hl, BackgroundL0+2
	ld [hl], TorielL0+2
	ld hl, BackgroundL0+3
	ld [hl], TorielL0+3
	ld hl, BackgroundL0+4
	ld [hl], TorielL0+4
	ld hl, BackgroundL0+5
	ld [hl], TorielL0+5
	ld hl, BackgroundL0+6
	ld [hl], TorielL0+6
	ld hl, BackgroundL0+7
	ld [hl], TorielL0+7
	ld hl, BackgroundL0+8
	ld [hl], TorielL0+8

	ld hl, BackgroundL1
	ld [hl], TorielL1
	ld hl, BackgroundL1+1
	ld [hl], TorielL1+1
	ld hl, BackgroundL1+2
	ld [hl], TorielL1+2
	ld hl, BackgroundL1+3
	ld [hl], TorielL1+3
	ld hl, BackgroundL1+4
	ld [hl], TorielL1+4
	ld hl, BackgroundL1+5
	ld [hl], TorielL1+5
	ld hl, BackgroundL1+6
	ld [hl], TorielL1+6
	ld hl, BackgroundL1+7
	ld [hl], TorielL1+7
	ld hl, BackgroundL1+8
	ld [hl], TorielL1+8

	ld hl, BackgroundL2
	ld [hl], TorielL2
	ld hl, BackgroundL2+1
	ld [hl], TorielL2+1
	ld hl, BackgroundL2+2
	ld [hl], TorielL2+2
	ld hl, BackgroundL2+3
	ld [hl], TorielL2+3
	ld hl, BackgroundL2+4
	ld [hl], TorielL2+4
	ld hl, BackgroundL2+5
	ld [hl], TorielL2+5
	ld hl, BackgroundL2+6
	ld [hl], TorielL2+6
	ld hl, BackgroundL2+7
	ld [hl], TorielL2+7
	ld hl, BackgroundL2+8
	ld [hl], TorielL2+8

	ld hl, BackgroundL3
	ld [hl], TorielL3
	ld hl, BackgroundL3+1
	ld [hl], TorielL3+1
	ld hl, BackgroundL3+2
	ld [hl], TorielL3+2
	ld hl, BackgroundL3+3
	ld [hl], TorielL3+3
	ld hl, BackgroundL3+4
	ld [hl], TorielL3+4
	ld hl, BackgroundL3+5
	ld [hl], TorielL3+5
	ld hl, BackgroundL3+6
	ld [hl], TorielL3+6
	ld hl, BackgroundL3+7
	ld [hl], TorielL3+7
	ld hl, BackgroundL3+8
	ld [hl], TorielL3+8

	ld hl, BackgroundL4
	ld [hl], TorielL4
	ld hl, BackgroundL4+1
	ld [hl], TorielL4+1
	ld hl, BackgroundL4+2
	ld [hl], TorielL4+2
	ld hl, BackgroundL4+3
	ld [hl], TorielL4+3
	ld hl, BackgroundL4+4
	ld [hl], TorielL4+4
	ld hl, BackgroundL4+5
	ld [hl], TorielL4+5
	ld hl, BackgroundL4+6
	ld [hl], TorielL4+6
	ld hl, BackgroundL4+7
	ld [hl], TorielL4+7
	ld hl, BackgroundL4+8
	ld [hl], TorielL4+8

	ld hl, BackgroundL5
	ld [hl], TorielL5
	ld hl, BackgroundL5+1
	ld [hl], TorielL5+1
	ld hl, BackgroundL5+2
	ld [hl], TorielL5+2
	ld hl, BackgroundL5+3
	ld [hl], TorielL5+3
	ld hl, BackgroundL5+4
	ld [hl], TorielL5+4
	ld hl, BackgroundL5+5
	ld [hl], TorielL5+5
	ld hl, BackgroundL5+6
	ld [hl], TorielL5+6
	ld hl, BackgroundL5+7
	ld [hl], TorielL5+7
	ld hl, BackgroundL5+8
	ld [hl], TorielL5+8

	ld hl, BackgroundL6
	ld [hl], TorielL6
	ld hl, BackgroundL6+1
	ld [hl], TorielL6+1
	ld hl, BackgroundL6+2
	ld [hl], TorielL6+2
	ld hl, BackgroundL6+3
	ld [hl], TorielL6+3
	ld hl, BackgroundL6+4
	ld [hl], TorielL6+4
	ld hl, BackgroundL6+5
	ld [hl], TorielL6+5
	ld hl, BackgroundL6+6
	ld [hl], TorielL6+6
	ld hl, BackgroundL6+7
	ld [hl], TorielL6+7
	ld hl, BackgroundL6+8
	ld [hl], TorielL6+8

	ld hl, BackgroundL7
	ld [hl], TorielL7
	ld hl, BackgroundL7+1
	ld [hl], TorielL7+1
	ld hl, BackgroundL7+2
	ld [hl], TorielL7+2
	ld hl, BackgroundL7+3
	ld [hl], TorielL7+3
	ld hl, BackgroundL7+4
	ld [hl], TorielL7+4
	ld hl, BackgroundL7+5
	ld [hl], TorielL7+5
	ld hl, BackgroundL7+6
	ld [hl], TorielL7+6
	ld hl, BackgroundL7+7
	ld [hl], TorielL7+7
	ld hl, BackgroundL7+8
	ld [hl], TorielL7+8

	ld hl, BackgroundL8
	ld [hl], TorielL8
	ld hl, BackgroundL8+1
	ld [hl], TorielL8+1
	ld hl, BackgroundL8+2
	ld [hl], TorielL8+2
	ld hl, BackgroundL8+3
	ld [hl], TorielL8+3
	ld hl, BackgroundL8+4
	ld [hl], TorielL8+4
	ld hl, BackgroundL8+5
	ld [hl], TorielL8+5
	ld hl, BackgroundL8+6
	ld [hl], TorielL8+6
	ld hl, BackgroundL8+7
	ld [hl], TorielL8+7
	ld hl, BackgroundL8+8
	ld [hl], TorielL8+8

	ld hl, BackgroundL9
	ld [hl], TorielL9
	ld hl, BackgroundL9+1
	ld [hl], TorielL9+1
	ld hl, BackgroundL9+2
	ld [hl], TorielL9+2
	ld hl, BackgroundL9+3
	ld [hl], TorielL9+3
	ld hl, BackgroundL9+4
	ld [hl], TorielL9+4
	ld hl, BackgroundL9+5
	ld [hl], TorielL9+5
	ld hl, BackgroundL9+6
	ld [hl], TorielL9+6
	ld hl, BackgroundL9+7
	ld [hl], TorielL9+7
	ld hl, BackgroundL9+8
	ld [hl], TorielL9+8

	ld hl, BackgroundL10
	ld [hl], TorielL10
	ld hl, BackgroundL10+1
	ld [hl], TorielL10+1
	ld hl, BackgroundL10+2
	ld [hl], TorielL10+2
	ld hl, BackgroundL10+3
	ld [hl], TorielL10+3
	ld hl, BackgroundL10+4
	ld [hl], TorielL10+4
	ld hl, BackgroundL10+5
	ld [hl], TorielL10+5
	ld hl, BackgroundL10+6
	ld [hl], TorielL10+6
	ld hl, BackgroundL10+7
	ld [hl], TorielL10+7
	ld hl, BackgroundL10+8
	ld [hl], TorielL10+8

	ld hl, BackgroundL11
	ld [hl], TorielL11
	ld hl, BackgroundL11+1
	ld [hl], TorielL11+1
	ld hl, BackgroundL11+2
	ld [hl], TorielL11+2
	ld hl, BackgroundL11+3
	ld [hl], TorielL11+3
	ld hl, BackgroundL11+4
	ld [hl], TorielL11+4
	ld hl, BackgroundL11+5
	ld [hl], TorielL11+5
	ld hl, BackgroundL11+6
	ld [hl], TorielL11+6
	ld hl, BackgroundL11+7
	ld [hl], TorielL11+7
	ld hl, BackgroundL11+8
	ld [hl], TorielL11+8

	ld hl, BackgroundL12
	ld [hl], TorielL12
	ld hl, BackgroundL12+1
	ld [hl], TorielL12+1
	ld hl, BackgroundL12+2
	ld [hl], TorielL12+2
	ld hl, BackgroundL12+3
	ld [hl], TorielL12+3
	ld hl, BackgroundL12+4
	ld [hl], TorielL12+4
	ld hl, BackgroundL12+5
	ld [hl], TorielL12+5
	ld hl, BackgroundL12+6
	ld [hl], TorielL12+6
	ld hl, BackgroundL12+7
	ld [hl], TorielL12+7
	ld hl, BackgroundL12+8
	ld [hl], TorielL12+8

	ld hl, BackgroundL13
	ld [hl], TorielL13
	ld hl, BackgroundL13+1
	ld [hl], TorielL13+1
	ld hl, BackgroundL13+2
	ld [hl], TorielL13+2
	ld hl, BackgroundL13+3
	ld [hl], TorielL13+3
	ld hl, BackgroundL13+4
	ld [hl], TorielL13+4
	ld hl, BackgroundL13+5
	ld [hl], TorielL13+5
	ld hl, BackgroundL13+6
	ld [hl], TorielL13+6
	ld hl, BackgroundL13+7
	ld [hl], TorielL13+7
	ld hl, BackgroundL13+8
	ld [hl], TorielL13+8

	ret

; takes a as parameter
DrawMenu:
	ret; TODO This should be moved to a window toggle, some sprites or other hack
	cp 0
	call z, DrawFight
	cp 1
	call z, DrawItem
	cp 2
	call z, DrawMercy

	ret

; takes a as parameter
DrawMenuSelect:
	ret; TODO This should be moved to a window toggle, some sprites or other hack
	cp 0
	call z, DrawFightSelect
	cp 1
	call z, DrawItemSelect
	cp 2
	call z, DrawMercySelect

	ret

DrawFight:
	ld hl, BackgroundL13
	ld [hl], SL2+2
	ld hl, BackgroundL13+1
	ld [hl], SL2+3

	ld hl, BackgroundL14
	ld [hl], SL3+2
	ld hl, BackgroundL14+1
	ld [hl], SL3+3

	ld hl, BackgroundL15
	ld [hl], SL4+2
	ld hl, BackgroundL15+1
	ld [hl], SL4+3

	ld hl, BackgroundL16
	ld [hl], SL5+2
	ld hl, BackgroundL16+1
	ld [hl], SL5+3

	ret

DrawFightSelect:
	ld hl, BackgroundL13
	ld [hl], SL2+6
	ld hl, BackgroundL13+1
	ld [hl], SL2+7

	ld hl, BackgroundL14
	ld [hl], SL3+6
	ld hl, BackgroundL14+1
	ld [hl], SL3+7

	ld hl, BackgroundL15
	ld [hl], SL4+6
	ld hl, BackgroundL15+1
	ld [hl], SL4+7

	ld hl, BackgroundL16
	ld [hl], SL5+6
	ld hl, BackgroundL16+1
	ld [hl], SL5+7

	ret


DrawItem:
	ld hl, BackgroundL13+3
	ld [hl], SL5
	ld hl, BackgroundL13+4
	ld [hl], SL5+1

	ld hl, BackgroundL14+3
	ld [hl], SL6
	ld hl, BackgroundL14+4
	ld [hl], SL6+1

	ld hl, BackgroundL15+3
	ld [hl], SL7
	ld hl, BackgroundL15+4
	ld [hl], SL7+1

	ld hl, BackgroundL16+3
	ld [hl], SL8
	ld hl, BackgroundL16+4
	ld [hl], SL8+1

	ret

DrawItemSelect:
	ld hl, BackgroundL13+3
	ld [hl], SL5+4
	ld hl, BackgroundL13+4
	ld [hl], SL5+5

	ld hl, BackgroundL14+3
	ld [hl], SL6+4
	ld hl, BackgroundL14+4
	ld [hl], SL6+5

	ld hl, BackgroundL15+3
	ld [hl], SL7+4
	ld hl, BackgroundL15+4
	ld [hl], SL7+5

	ld hl, BackgroundL16+3
	ld [hl], SL8+4
	ld hl, BackgroundL16+4
	ld [hl], SL8+5

	ret

DrawMercy:
	ld hl, BackgroundL13+6
	ld [hl], SL2
	ld hl, BackgroundL13+7
	ld [hl], SL2+1

	ld hl, BackgroundL14+6
	ld [hl], SL3
	ld hl, BackgroundL14+7
	ld [hl], SL3+1

	ld hl, BackgroundL15+6
	ld [hl], SL4
	ld hl, BackgroundL15+7
	ld [hl], SL4+1

	ret

DrawMercySelect:
	ld hl, BackgroundL13+6
	ld [hl], SL2+4
	ld hl, BackgroundL13+7
	ld [hl], SL2+5

	ld hl, BackgroundL14+6
	ld [hl], SL3+4
	ld hl, BackgroundL14+7
	ld [hl], SL3+5

	ld hl, BackgroundL15+6
	ld [hl], SL4+4
	ld hl, BackgroundL15+7
	ld [hl], SL4+5

	ret

	; talking doesnt seem to have any effect
	;ld hl, BackgroundL13+3
	;ld [hl], SL6+2
	;ld hl, BackgroundL13+4
	;ld [hl], SL6+3

	;ld hl, BackgroundL14+3
	;ld [hl], SL7+2
	;ld hl, BackgroundL14+4
	;ld [hl], SL7+3

	;ld hl, BackgroundL15+3
	;ld [hl], SL8+2
	;ld hl, BackgroundL15+4
	;ld [hl], SL8+3
