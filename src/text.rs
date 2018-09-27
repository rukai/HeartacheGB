use ggbasm::ast::Instruction;

pub fn generate_text() -> Vec<Instruction> {
    let mut instructions = vec!();
    add_text(&mut instructions, "Encounter0",  "Toriel blocks the way!");
    add_text(&mut instructions, "Flavor0",     "Toriel looks through you.");
    add_text(&mut instructions, "Flavor1",     "Toriel prepares a magical attack.");
    add_text(&mut instructions, "Flavor2",     "Toriel takes a deep breath.");
    add_text(&mut instructions, "Flavor3",     "Toriel is acting aloof.");
    add_text(&mut instructions, "Spare0",      ".....");
    add_text(&mut instructions, "Spare1",      "..... .....");
    add_text(&mut instructions, "Spare2",      "..... ..... .....");
    add_text(&mut instructions, "Spare3",      "...?");
    add_text(&mut instructions, "Spare4",      "What are you doing?");
    add_text(&mut instructions, "Spare5",      "Attack or run away!");
    add_text(&mut instructions, "Spare6",      "What are you proving this way?");
    add_text(&mut instructions, "Spare7",      "Fight me or leave!");
    add_text(&mut instructions, "Spare8",      "Stop it.");
    add_text(&mut instructions, "Spare9",      "Stop looking at me that way.");
    add_text(&mut instructions, "Spare10",     "...");
    add_text(&mut instructions, "Spare11",     "... ...");
    add_text(&mut instructions, "Spare12",     "I know you want to go home, but...");
    add_text(&mut instructions, "Spare13",     "But please... Go upstairs now.");
    add_text(&mut instructions, "Spare14",     "I promise I will take good care of you here.");
    add_text(&mut instructions, "Spare15",     "I know we do not have much, but...");
    add_text(&mut instructions, "Spare16",     "We can have a good life here.");
    add_text(&mut instructions, "Spare17",     "Why are you making this so difficult?");
    add_text(&mut instructions, "Spare18",     "Please, go upstairs.");
    add_text(&mut instructions, "Spare19",     ".....");
    add_text(&mut instructions, "Spare20",     "Ha ha...");
    add_text(&mut instructions, "Spare21",     "Pathetic, is it not? I cannot save even a single child.");
    add_text(&mut instructions, "Spare22",     "...");
    add_text(&mut instructions, "Spare23",     "No, I understand.|You would just be unhappy trapped down there.|The RUINS are very small once you get used to them.|It would not be right for you to grow up in a place like this.|My expectations... My loneliness... My fear...|For you, my child... I will put them aside.");
    add_text(&mut instructions, "Kill0",       "Urgh... You are stronger than I thought... Listen to me, small one... If you go beyond this door, Keep walking as far as you can. Eventually, you will reach an exit. ... .... ASGORE... Do not let ASGORE take your soul. His plan cannot be allowed to succeed. ....... Be good, won't you? My child.");
    add_text(&mut instructions, "Vulnerable0", "You... ... at my most vulnerable moment... To think I was worried you wouldn't fit out in there... Eheheheh!!! You really are no different than them! Ha... Ha...");
    add_text(&mut instructions, "Genocide0",   "But nobody came.");
    instructions
}

fn add_text(instructions: &mut Vec<Instruction>, label: &str, text: &str) {
    let mut bytes = vec!();
    let text = text.to_lowercase(); // TODO: Delete when implement uppercase
    for chr in text.chars() {
        let byte = match chr {
            // alphabet
            'a' => 0,
            'b' => 1,
            'c' => 2,
            'd' => 3,
            'e' => 4,
            'f' => 5,
            'g' => 6,
            'h' => 7,
            'i' => 8,
            'j' => 9,
            'k' => 10,
            'l' => 11,
            'm' => 12,
            'n' => 13,
            'o' => 14,
            'p' => 15,
            'q' => 16,
            'r' => 17,
            's' => 18,
            't' => 19,
            'u' => 20,
            'v' => 21,
            'w' => 22,
            'x' => 23,
            'y' => 24,
            'z' => 25,
            '!' => 26,
            '?' => 27,
            '.' => 28,
            ',' => 29,
           '\'' => 30,
            ' ' => 31,
            // control characters
            '|' => 254, // next line
            '>' => 253, // large wobble
            '<' => 252, // small wobble
            '^' => 251, // slow down
            _   => panic!("Invalid character given to add_text(..)")
        };
        bytes.push(byte);
    }
    bytes.push(255); // end string
    instructions.push(Instruction::Label(format!("Text{}", label)));
    instructions.push(Instruction::Db(bytes));
}
