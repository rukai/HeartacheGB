InitPlayer:
    ; set x/y
    ld hl, wEntity0
    ld [hl], 0x30
    inc hl
    ld [hl], 0x20
    inc hl
    ld [hl], 1
    inc hl
    ld [hl], 0

    ; set render info
    ld hl, wSprite0+2
    ld [hl], SL0
    ld hl, wSprite0+3
    ld [hl], 0x0

    ld hl, wSprite1+2
    ld [hl], SL0+1
    ld hl, wSprite1+3
    ld [hl], 0x0

    ld hl, wSprite2+2
    ld [hl], SL1
    ld hl, wSprite2+3
    ld [hl], 0x0

    ld hl, wSprite3+2
    ld [hl], SL1+1
    ld hl, wSprite3+3
    ld [hl], 0x0

    ret

UpdatePlayer:
    ; set joypad to dir
    ld hl, wJoypadDirHold
    res 4, [hl]

    ; move player
    ld a, [hl]

    bit 0, a
    jp nz, SkipRight
    ld hl, wEntity0
    inc [hl]
    inc [hl]
SkipRight:

    bit 1, a
    jp nz, SkipLeft
    ld hl, wEntity0
    dec [hl]
    dec [hl]
SkipLeft:

    bit 2, a
    jp nz, SkipUp
    ld hl, wEntity0+1
    dec [hl]
    dec [hl]
SkipUp:

    bit 3, a
    jp nz, SkipDown
    ld hl, wEntity0+1
    inc [hl]
    inc [hl]
SkipDown:

    ret
