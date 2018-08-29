InitBattle:
    ld hl wBattleStage
    ld [hl] 10

    ld hl wTorielHealth
    ld [hl] 10

    ld hl wPlayerHealth
    ld [hl] 10

    ld hl wTextType
    ld [hl] 0

    ; play heartache music
    ; TODO: Use `ldi [hl] 0xXX`
    ld hl wMusicEnable
    ld [hl] 0x01
    ld hl wMusicBank
    ld [hl] 0x00
    ld hl wMusicPointerHi
    ld [hl] MusicHeartacheStart / 0x100
    ld hl wMusicPointerLo
    ld [hl] MusicHeartacheStart % 0x100
    ld hl wMusicRest
    ld [hl] 0x20

    call DrawBackground
    call InitMessage

    ret

InitMessage:
    ld hl wBattleStateCounter
    ld [hl] 0

    ld hl wBattleState
    ld [hl] 0

    ; zero out entity data
    ld hl wEntityStates
    ld de wEntityStatesEnd - wEntityStates
contZero:
    ld [hl] 0
    inc hl
    dec de
    ld a e
    and a ; cp 0
    jr nz contZero

    call InitTextBox

    ret

InitAttack1:
    ld hl wBattleStateCounter
    ld [hl] 0

    ld hl wBattleState
    ld [hl] 1

    call InitPlayer

    ld hl wEntity1
    ld [hl] 80
    inc hl
    ld [hl] 0
    inc hl
    ld [hl] 2
    inc hl
    ld [hl] 0

    ld hl wEntity2
    ld [hl] 80
    inc hl
    ld [hl] 30
    inc hl
    ld [hl] 2
    inc hl
    ld [hl] 32

    ld hl wEntity3
    ld [hl] 80
    inc hl
    ld [hl] 60
    inc hl
    ld [hl] 2
    inc hl
    ld [hl] 0

    ld hl wEntity4
    ld [hl] 80
    inc hl
    ld [hl] 90
    inc hl
    ld [hl] 2
    inc hl
    ld [hl] 32

    ret

InitAttack2:
    ld hl wBattleState
    ld [hl] 2

    ld hl wBattleStateCounter
    ld [hl] 0

    ret

UpdateBattleState:
    call UpdateEntities

    ld a [wBattleState]
    cp 0
    call z UpdateMessage
    cp 1
    call z UpdateAttack1
    cp 2
    call z UpdateAttack2

    ld hl wBattleStateCounter
    inc [hl]
    ret

InitFight:
    ld hl wTorielHealth
    ld a [hl]
    sub 3
    ld [hl] a

    ret

InitItem:
    ret
    ld hl wPlayerHealth
    ld a [hl]
    add 3

    ld [hl] a

InitSpare:
    ld hl wBattleStage
    inc [hl]

    ret

UpdateMessage:
    ld hl wJoypadButPress
    bit 0 [hl]
    call z InitAttack1
    
    call UpdateTextBox

    ret

UpdateAttack1:
    ; TODO: draw all fireballs

    ; TODO: add some more fireballs at certain points in the counter

    ; end
    ld hl wBattleStateCounter
    ld a l
    cp 10
    call z InitMessage

    ret

UpdateAttack2:
    ret
