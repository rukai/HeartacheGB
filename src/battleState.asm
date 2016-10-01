InitMenu:
    ld hl, wEntityStates
    ld de, wEntityStates - wEntityStatesEnd
contInitMenu:
    ld [hl], 0
    dec hl
    dec de
    jp nz, contInitMenu

    ; TODO after selection made, call a random InitAttack
    call InitAttack1

    ret

InitAttack1:
    call InitPlayer

    ld hl, wEntity1
    ld [hl], 80
    inc hl
    ld [hl], 0
    inc hl
    ld [hl], 2
    inc hl
    ld [hl], 0

    ld hl, wEntity2
    ld [hl], 80
    inc hl
    ld [hl], 30
    inc hl
    ld [hl], 2
    inc hl
    ld [hl], 32

    ld hl, wEntity3
    ld [hl], 80
    inc hl
    ld [hl], 60
    inc hl
    ld [hl], 2
    inc hl
    ld [hl], 0

    ld hl, wEntity4
    ld [hl], 80
    inc hl
    ld [hl], 90
    inc hl
    ld [hl], 2
    inc hl
    ld [hl], 32
    ; TODO: manually setup a bunch of fireballs
    ret

InitAttack2:
    ret

UpdateBattleState:
    call UpdateEntities

    ld a, [wBattleState]
    ; TODO: use wBattleState to choose correct battle state handler
    cp a, 1
    call z, UpdateAttack1
    cp a, 2
    call z, UpdateAttack2

    ld hl, wBattleCounter
    inc [hl]
    ret

UpdateMenu:
    ; TODO: Alter selection
    ; TODO: *   Change palette of selection, revealing box
    ; TODO: *   Move player inside box of selection
    ret

UpdateAttack1:
    ; TODO: draw all fireballs

    ; TODO: add some more fireballs at certain points in the counter
    ; TODO after x ticks call InitMenu
    ret

UpdateAttack2:
    ret
