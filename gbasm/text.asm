InitTextBox:
    ; load current stage string into wTextString
    ld hl, wTextStringHi
    ld [hl], TextEncounter0 / 0x100

    ld hl, wTextStringLo
    ld [hl], TextEncounter0 % 0x100

    ret

UpdateTextBox:
    ; TODO: update wobbly sprites
    ret

DrawTextBox:
    ld de, wTextStringHi
    ld a, [de]
    ld h, a

    ld de, wTextStringLo
    ld a, [de]
    ld l, a

    ; TODO: Skip ' ' character, only displays correctly by luck atm
    ld de, WindowL0 ; character location Top
    ld bc, WindowL1 ; character location Middle
continueDraw:
    ld a, [hl] ; window tile
    cp 0xFF
    jp z, endDraw

    add 0x8
    ld [de], a

    add 0x23
    ld [bc], a

    ; TODO: fix setup window characters

    inc de
    inc bc
    inc hl
    jp continueDraw
endDraw:
    ; TODO: setup wobbly sprites

    ; TODO: wTextString = next string
    ret
