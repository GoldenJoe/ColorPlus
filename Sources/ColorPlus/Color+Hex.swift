//
//  Color+Hex.swift
//  
//
//  Created by Joseph Falcone on 5/20/22.
//

/// Tuple containing RGBA values 0.0-1.0
typealias RGBA = (r: Double, g: Double, b: Double, a: Double)

internal func HEXtoRGBA(hex: UInt, bytes: UInt) -> RGBA
{
    let r, g, b, a : Double
    switch(bytes){
    case 3: // 0xRGB
        r = Double((hex & 0xF00) >> 8) / 15
        g = Double((hex & 0x0F0) >> 4) / 15
        b = Double( hex & 0x00F) / 15
        a = 1.0
    case 4: // 0xRGBA
        r = Double((hex & 0xF000) >> 12) / 15
        g = Double((hex & 0x0F00) >> 8) / 15
        b = Double((hex & 0x00F0) >> 4) / 15
        a = Double( hex & 0x000F) / 15
    case 6: // 0xRRGGBB
        r = Double((hex & 0xFF0000) >> 16) / 255
        g = Double((hex & 0x00FF00) >> 8) / 255
        b = Double( hex & 0x0000FF) / 255
        a = 1.0
    case 8: //0xRRGGBBAA
        r = Double((hex & 0xFF000000) >> 24) / 255
        g = Double((hex & 0x00FF0000) >> 16) / 255
        b = Double((hex & 0x0000FF00) >> 8) / 255
        a = Double( hex & 0x000000FF) / 255
    default:
        return (1,1,1,1)
    }
    return (r, g, b, a)
}

internal func stringToHexData(_ hex: String) -> (hex : UInt, bytes: UInt) {
    // Check to see if the 0x prefix is specified
    let prefix = hex.prefix(2) == "0x"
    let bytes = prefix ? UInt(hex.count-2) : UInt(hex.count)
    guard let hexVal = UInt((prefix ? String(hex.dropFirst(2)) : hex), radix: 16) else {
        precondition(false, "Error: Invalid hex value: \(hex)")
    }
    return (hexVal, bytes)
}

public extension PColor {
    convenience init(hex: String) {
        let (hexVal, bytes) = stringToHexData(hex)
        let (r,g,b,a) = HEXtoRGBA(hex: hexVal, bytes: bytes)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    /// 0xRGB
    convenience init(hex3: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex3, bytes: 3)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    /// 0xRGBA
    convenience init(hex4: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex4, bytes: 4)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    /// 0xRRGGBB
    convenience init(hex6: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex6, bytes: 6)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    /// 0xRRGGBBAA
    convenience init(hex8: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex8, bytes: 8)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

import SwiftUI
@available(iOS 13.0, macOS 10.15, *)
public extension Color {
    init(hex: String){
        let (hexVal, bytes) = stringToHexData(hex)
        let (r,g,b,a) = HEXtoRGBA(hex: hexVal, bytes: bytes)
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    /// 0xRGB
    init(hex3: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex3, bytes: 3)
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    /// 0xRGBA
    init(hex4: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex4, bytes: 4)
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    /// 0xRRGGBB
    init(hex6: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex6, bytes: 6)
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    /// 0xRRGGBBAA
    init(hex8: UInt) {
        let (r,g,b,a) = HEXtoRGBA(hex: hex8, bytes: 8)
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
