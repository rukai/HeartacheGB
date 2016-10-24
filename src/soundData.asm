; Each entry in the table has 8 bytes:

; Byte 1 - Length and Duty: FF16
; Byte 2 - Envelope :       FF17
; Byte 3 - Frequency Low:   FF18
; Byte 4 - Frequency High:  FF19
; Byte 5 - frame delay until play next entry
; Byte 6 - ?!?!?!?
; Byte 7 - ?!?!?!?
; Byte 8 - ?!?!?!?

SECTION "Sound",DATA[$5000],BANK[$1]
Channel2Table:
    db $00 ; D#6
    db $F1
    db $2D
    db $87
    db $09
    db $00
    db $00
    db $00

    db $00 ; C7
    db $F1
    db $83
    db $87
    db $09
    db $00
    db $00
    db $00

    db $00 ; A#6
    db $F1
    db $73
    db $87
    db $09
    db $00
    db $00
    db $00

    db $00 ; G#6
    db $F1
    db $62
    db $87
    db $09
    db $00
    db $00
    db $00

    db $00 ; F#6
    db $F1
    db $4F
    db $87
    db $09
    db $00
    db $00
    db $00

    db $00 ; G#6
    db $F1
    db $62
    db $87
    db $09
    db $00
    db $00
    db $00
Channel2TableEnd:
