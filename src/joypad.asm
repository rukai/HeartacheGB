UpdateJoypad:
    ; ------ direction logic
    ld hl, $FF00

    ; get new hold
    set 5, [hl]
    res 4, [hl]
    ld b, [hl]

    ; get previous hold
    ld hl, wJoypadDirHold
    ld a, [hl]

    ; set new hold
    ld [hl], b

    ; set new press
    cpl
    or b
    inc hl ; ld hl, wJoypadDirPress
    ld [hl], a

    ; ------ button logic
    ld hl, $FF00

    ; get new hold
    set 4, [hl]
    res 5, [hl]
    ld b, [hl]

    ; get previous hold
    ld hl, wJoypadButHold
    ld a, [hl]

    ; set new hold
    ld [hl], b

    ; set new press
    cpl
    or b
    inc hl ; ld hl, wJoypadButPress
    ld [hl], a

    ret

InitJoypad:

    ld hl, wJoypadDirHold
    ld [hl], 0
    ret
