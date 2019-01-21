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
    let RowsOfGraphics = 64
    let ColsOfGraphics = 32
    let StackSize = 16
    let KeypadSize = 16
    
    /// Chip-8 has 35 opcodes
    var currentOpcode: CUnsignedInt
    
    /// Chip-8 has 4K memory in total.
    /// 0x000-0x1FF - Chip-8 interpreter (contains font set in emu)
    /// 0x050-0x0A0 - Used for the build in 4*5 pixel font set (0-F)
    /// 0x200-0xFFF - Program ROM and work RAM
    var memory: [CChar]
    
    /// Chip-8 has 16 8-bit general purpose registers named V0, V1 up to VF. The VF register doubles as a flag for some instructions, thus it should be avoided. In addition operation VF is for carry flag.
    var registers: [CChar]
    
    /// There is an 16-bit index register (For memory address)
    var registerI: CUnsignedInt
    
    /// A program counter have a value from 0x000 to OxFFF
    var programCounter: CUnsignedInt
    
    /// The graphics of Chip-8 are black and white and the screen has 2048 pixels (64*32)
    var graphicsMatrix: [[CInt]]
    
    /// Chip-8 has two timer registers that count at 60hz
    var delayTimer: CInt
    var soundTimer: CInt
    
    /// When Chip-8 instruction set has opcodes that allow the program to jump to a certain address or call a subroutine, you need to implement one as part of the interpreter yourself. The system has 16 levels of stack and in order to remember which level of the stack is used, implement a stack pointer
    var stack: [CInt]
    var stackPoint: CInt
    
    /// Chip-8 has a HEX based keypad (0x0-0xF)
    var keypad: [CInt]
    
    override init() {
        currentOpcode = 0
        memory = Array(repeatElement(0, count: MemorySize))
        registers = Array(repeatElement(0, count: RegistersSize))
        registerI = 0
        // The system expects the application to be loaded at memory location 0x200
        programCounter = 0x200
        graphicsMatrix = Array(repeatElement(Array(repeatElement(0, count: ColsOfGraphics)), count: RowsOfGraphics))
        delayTimer = 0
        soundTimer = 0
        stack = Array(repeatElement(0, count: StackSize))
        stackPoint = 0
        keypad = Array(repeatElement(0, count: KeypadSize))
    }
    
}
