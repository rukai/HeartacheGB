Start:
    call WriteDMACodeToHRAM
    call Init
    call InitSound
    call InitJoypad
    call InitFireballs
    call InitBattle
    call InitFinalize
    call UpdateJoypad

Loop:
    call UpdateJoypad
    call UpdateBattleState
    call StepSound

    halt

    ; Quick, draw now
    call DrawEntities
    call DrawTextBox
    call DMARoutineHRAM

    jp Loop
