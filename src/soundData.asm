; Each entry in the table has 5 bytes:

; Byte 1 - Length and Duty: FF16
; Byte 2 - Envelope :       FF17
; Byte 3 - Frequency Low:   FF18
; Byte 4 - Frequency High:  FF19
; Byte 5:
; * 00-FE frame delay until play next entry
; * FF reset song

Channel2Table:
    db $00
    db $F1
    db $00
    db $81
    db $15

    db $00
    db $F1
    db $00
    db $81
    db $10
Channel2TableEnd:
