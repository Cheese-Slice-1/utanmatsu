package oto

import "core:fmt"

OtoEntry :: struct {
    sample: []u8, // filename
    alias: []u8,
    offset, consonant, cutoff, preutternance, overlap: i32,
    
    // offset = start of actual sample in ms (everything before this gets ignored)
    // consonant = fixed part (usu. for consonant sounds, won't repeat/stretch)
    // cutoff = end of actual sample in ms (everything after this gets ignored)
    // preutternance = start of vowel
    // overlap = self-explanatory
}

OtoConf :: [dynamic]OtoEntry

test :: proc() {
    random := OtoEntry{
        transmute([]u8)string("hi"),
        transmute([]u8)string("ho"),
        0, 0, 0, 0, 0,
    }
    
    fmt.printfln("%v, %v, %v, %v, %v, %v, %v", random.sample, random.alias, random.offset, random.consonant, random.cutoff, random.preutternance, random.overlap)
}

