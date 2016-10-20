InitBattle
    ld hl, wBattleStage
    ld [hl], 10

    ld hl, wTorielHealth
    ld [hl], 10

    ld hl, wPlayerHealth
    ld [hl], 10

    call DrawBackground
    call InitMenu

    ret

InitMenu:
    ; zero out entity data
    ld hl, wEntityStates
    ld de, wEntityStatesEnd - wEntityStates
contInitMenu:
    ld [hl], 0
    inc hl
    dec de
    ld a, e
    and a
    jr nz, contInitMenu

    ; init battle variables
    ld hl, wBattleStateCounter
    ld [hl], 0

    ld hl, wBattleState
    ld [hl], 0

    ld hl, wMenuSelection
    ld [hl], 0

    ; TODO: these should probably be changed with the menu rendering rewrite
    call DrawFightSelect
    call DrawItem
    call DrawMercy

    ret

InitAttack1:
    ld hl, wBattleStateCounter
    ld [hl], 0

    ld hl, wBattleState
    ld [hl], 1

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

    ret

InitAttack2:
    ld hl, wBattleState
    ld [hl], 2

    ld hl, wBattleStateCounter
    ld [hl], 0

    ret

UpdateBattleState:
    call UpdateEntities

    ld a, [wBattleState]
    ; TODO: use wBattleState to choose correct battle state handler
    cp 0
    call z, UpdateMenu
    cp 1
    call z, UpdateAttack1
    cp 2
    call z, UpdateAttack2

    ld hl, wBattleStateCounter
    inc [hl]
    ret

UpdateMenu:
    ; get selection
    ld de, wMenuSelection
    ld a, [de]

    ; change selection
    ld hl, wJoypadDirPress
    bit 1, [hl]
    jr nz, noLeft

    call DrawMenu

    dec a
    cp -1
    jr nz, noWrapLeft
    ld a, 2
noWrapLeft:

    call DrawMenuSelect
noLeft:

    ld hl, wJoypadDirPress
    bit 0, [hl]
    jr nz, noRight

    call DrawMenu

    inc a
    cp 3
    jr c, noWrapRight
    ld a, 0
noWrapRight:

    call DrawMenuSelect
noRight:

    ; set selection
    ld [de], a

    ; make selection
    ld hl, $FF00
    set 4, [hl]
    res 5, [hl]
    bit 0, [hl]
    ret nz

    ld a, [wMenuSelection]
    cp 0
    call z, InitFight
    cp 1
    call z, InitItem
    cp 2
    call z, InitSpare

    ; TODO: Call random init attack
    call InitAttack1

    ret

InitFight:
    ld hl, wTorielHealth
    ld a, [hl]
    sub 3
    ld [hl], a

    ret

InitItem:
    ret
    ld hl, wPlayerHealth
    ld a, [hl]
    add 3

    ld [hl], a

InitSpare:
    ld hl, wBattleStage
    inc [hl]

    ret

UpdateAttack1:
    ; TODO: draw all fireballs

    ; TODO: add some more fireballs at certain points in the counter
    ; TODO: after x ticks call InitMenu
    ld hl, wBattleStateCounter
    ld a, l
    cp 10
    call z, InitMenu

    ret

UpdateAttack2:
    ret
