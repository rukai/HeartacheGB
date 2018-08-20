use std::collections::HashMap;

use failure::Error;
use ggbasm::{RomBuilder, Color};
use ggbasm::header::{Header, ColorSupport, CartridgeType, RamType};

mod tables;
mod text;

fn main() {
    run().unwrap();
    println!("Compiled project to heartache.gb");
}

fn run() -> Result<(), Error> {
    let header = Header {
        title:          String::from("Heartache"),
        color_support:  ColorSupport::Unsupported,
        licence:        String::new(),
        sgb_support:    false,
        cartridge_type: CartridgeType::Mbc5Ram,
        ram_type:       RamType::Some32KB,
        japanese:       false,
        version_number: 0,
    };

    let mut colors = HashMap::new();
    colors.insert(Color::new(0x08, 0x18, 0x20), 0b00);
    colors.insert(Color::new(0x30, 0x68, 0x50), 0b01);
    colors.insert(Color::new(0x88, 0xc0, 0x70), 0b10);
    colors.insert(Color::new(0xe0, 0xf8, 0xd0), 0b11);

    RomBuilder::new()?
        .add_basic_interrupts_and_jumps()?
        .add_header(header)?
        .add_asm_file("main.asm")?
        .add_asm_file("oam_dma.asm")?
        .add_asm_file("init.asm")?
        .add_asm_file("entity.asm")?
        .add_asm_file("background.asm")?
        .add_asm_file("player.asm")?
        .add_asm_file("fireball.asm")?
        .add_asm_file("battleState.asm")?
        .add_asm_file("joypad.asm")?
        .add_asm_file("sound.asm")?
        .add_asm_file("text.asm")?
        .advance_address(1, 0)?
        .add_bytes(tables::generate_sin(), "SinTable")?
        .add_image("tiles.png", "GraphicsBinary", &colors)?
        .add_image("tiles2.png", "GraphicsTiles2", &colors)?
        .add_image("toriel.png", "GraphicsToriel", &colors)?
        .advance_address(1, 0x1000)?
        .add_audio("heartache.txt", "Channel2Table")?
        .add_instructions(text::generate_text())?
        .add_asm_file("ram.asm")?
        //.print_variables_by_identifier()?
        .write_to_disk("heartache.gb")?;
    Ok(())
}
