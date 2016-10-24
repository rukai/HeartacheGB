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
    db $00
    db $F1
    db $00
    db $81
    db $13
    db $00
    db $00
    db $00

    db $00
    db $F1
    db $F0
    db $81
    db $08
    db $00
    db $00
    db $00
Channel2TableEnd:
