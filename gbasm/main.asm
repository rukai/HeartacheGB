Start:
    call WriteDMACodeToHRAM
    call Init
    call GGBASMAudioInit
    call InitJoypad
    call InitFireballs
    call InitBattle
    call InitFinalize
    call UpdateJoypad

Loop:
    call UpdateJoypad
    call UpdateBattleState
    call GGBASMAudioStep

    halt

    ; Quick, draw now
    call DrawEntities
    call DrawTextBox
    call DMARoutineHRAM

    jp Loop
