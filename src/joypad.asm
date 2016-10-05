UpdateJoypad:

    ld hl, $FF00

    ; get new hold
    set 5, [hl]
    res 4, [hl]
    ld b, [hl]

    ; get previous hold
    ld hl, wJoypadDirHold
    ld a, [hl]

    ; set new hold
    ld hl, wJoypadDirHold
    ld [hl], b

    ; set new press
    cpl
    or b
    inc hl ; set to wJoypadDirPress
    ld [hl], a

    ret
