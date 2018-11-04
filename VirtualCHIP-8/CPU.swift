//
//  CPU.swift
//  VirtualCHIP-8
//
//  Created by Shvier on 2018/11/4.
//  Copyright © 2018 SuperEmulator. All rights reserved.
//

import Cocoa

class CPU: NSObject {

    let MemorySize = 4096
    let RegistersSize = 16
    
    /// Chip-8 has 35 opcodes
    var currentOpcode: CUnsignedInt
    
    /// Chip-8 has 4K memory in total.
    /// 0x000-0x1FF - Chip-8 interpreter (contains font set in emu)
    /// 0x050-0x0A0 - Used for the build in 4*5 pixel font set (0-F)
    /// 0x200-0xFFF - Program ROM and work RAM
    var memory: [CChar]
    
    /// Chip-8 has 15 8-bit general purpose registers named V0, V1 up to VE. The 16th register is used for the carry flag.
    var registers: [CChar]
    
    /// There is an Index register I and a program counter which can have a value from 0x000 to OxFFF
    var registerI: CUnsignedInt
    
    /// There is an Index register I and a program counter which can have a value from 0x000 to OxFFF
    var programCounter: CUnsignedInt
    
    override init() {
        
    }
    
}
