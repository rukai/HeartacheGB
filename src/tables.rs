use std::f32::consts::PI;

crate fn generate_sin() -> Vec<u8> {
    let mut table = vec!();
    for i in 0..0x100 {
        let angle = i as f32 * 2.0 * PI / 64.0 + PI / 2.0;
        let value = (angle.sin() * 7.0).round();
        // u8 correctly stores negative values as twos complement
        table.push(value as u8);
    }
    table
}
