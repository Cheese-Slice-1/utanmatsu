package main

import "core:encoding/json"
import "core:fmt"
import "core:os"

main :: proc() {
    fmt.println("Hello, world!")
    
    test_file, read_err := os.read_entire_file("ideas/config_file_ideas.json5", context.allocator)
    if read_err != nil {
        fmt.eprintfln("Failed to open file: %v", read_err)
        return
    }
    defer delete(test_file)
    
    json_data, err := json.parse(test_file, spec = .JSON5)
    if err != .None {
        fmt.eprintln("Failed to parse JSON5 file")
        fmt.eprintln("Error:", err)
        return
    }
    defer json.destroy_value(json_data)
    
    root := json_data.(json.Object) // root level object; .(json.Object) == it's an Object, if not then panic
    switch v in root["default"].(json.Object)["tempo"] {
        case json.Float:
            fmt.println(v)
        
        case json.Integer:
            fmt.println(v)
        
        case json.Null:
            fmt.println("120")
        
        case json.Object, json.Array, json.Boolean, json.String:
            fmt.eprintln("wtf")
    }
}

