/// Each entry in the table has 8 bytes:
///
/// Byte 1 - Length and Duty: FF16
/// Byte 2 - Envelope :       FF17
/// Byte 3 - Frequency Low:   FF18
/// Byte 4 - Frequency High:  FF19
/// Byte 5 - frame delay until play next entry
/// Byte 6 - ?!?!?!?
/// Byte 7 - ?!?!?!?
/// Byte 8 - ?!?!?!?
pub fn generate_sound() -> Vec<u8> {
    vec!(
        0x00, // D#6
        0xF1,
        0x2D,
        0x87,
        0x09,
        0x00,
        0x00,
        0x00,

        0x00, // C7
        0xF1,
        0x83,
        0x87,
        0x09,
        0x00,
        0x00,
        0x00,

        0x00, // A#6
        0xF1,
        0x73,
        0x87,
        0x09,
        0x00,
        0x00,
        0x00,

        0x00, // G#6
        0xF1,
        0x62,
        0x87,
        0x09,
        0x00,
        0x00,
        0x00,

        0x00, // F#6
        0xF1,
        0x4F,
        0x87,
        0x09,
        0x00,
        0x00,
        0x00,

        0x00, // G#6
        0xF1,
        0x62,
        0x87,
        0x09,
        0x00,
        0x00,
        0x00,
    )
}
