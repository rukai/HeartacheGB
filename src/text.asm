InitTextBox:
    ; load current stage string into wTextString
    ld hl, wTextStringHi
    ld [hl], TextEncounter0 / $FF

    ld hl, wTextStringLo
    ld [hl], TextEncounter0 & $FF

endCheck:

; InitTextBox just runs into UpdateTextBox, no need to call it

UpdateTextBox:
    ; TODO: update wobbly sprites

DrawTextBox:
    ld de, wTextStringHi
    ld a, [de]
    ld h, a

    ld de, wTextStringLo
    ld a, [de]
    ld l, a

    ; TODO: Skip ' ' character, only displays correctly by luck atm
    ld de, WindowL0; character location Top
    ld bc, WindowL1; character location Middle
continueDraw:
    ld a, [hl] ; window tile
    cp $FF
    jp z, endDraw

    add $8
    ld [de], a

    add $23
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
