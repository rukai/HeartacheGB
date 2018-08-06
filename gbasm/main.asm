Start:
    call WriteDMACodeToHRAM
    call Init
    call InitJoypad
    call InitFireballs
    call InitBattle
    call InitFinalize
    call InitSound
    call UpdateJoypad

Loop:
    call UpdateJoypad
    call UpdateBattleState
    call Sound

    halt

    ; Quick, draw now
    call DrawEntities
    call DrawTextBox
    call DMARoutineHRAM

    jp Loop
