//
//  Color+Hex.swift
//  
//
//  Created by Joseph Falcone on 5/20/22.
//

/// Tuple containing RGBA values 0.0-1.0
typealias RGBA = (r: Double, g: Double, b: Double, a: Double)

internal extension UInt {
    /// Returns an array containing each digit of this number.
    /// - Parameter radix: The base the result will be returned in, NOT the base of self.
    func digits(radix: Self = 10) -> [Self] {
        sequence(state: self) { quotient in
            guard quotient > 0
            else { return nil }
            
            let division = quotient.quotientAndRemainder(dividingBy: radix)
            quotient = division.quotient
            return division.remainder
        }
        .reversed()
    }
    
    func toRGBA() -> RGBA
    {
        let r, g, b, a : Double
        let digits = self.digits(radix: 16)
        switch(digits.count){
        case 3: // 0xRGB
            r = Double(((self & 0xF00) >> 8) / 15)
            g = Double(((self & 0x0F0) >> 4) / 15)
            b = Double(( self & 0x00F) / 15)
            a = 1.0
        case 4: // 0xRGBA
            r = Double(((self & 0xF000) >> 12) / 15)
            g = Double(((self & 0x0F00) >> 8) / 15)
            b = Double(((self & 0x00F0) >> 4) / 15)
            a = Double(( self & 0x000F) / 15)
        case 6: // 0xRRGGBB
            r = Double(((self & 0xFF0000) >> 16) / 255)
            g = Double(((self & 0x00FF00) >> 8) / 255)
            b = Double(( self & 0x0000FF) / 255)
            a = 1.0
        case 8: //0xRRGGBBAA
            r = Double(((self & 0xFF000000) >> 24) / 255)
            g = Double(((self & 0x00FF0000) >> 16) / 255)
            b = Double(((self & 0x0000FF00) >> 8) / 255)
            a = Double(( self & 0x000000FF) / 255)
        default:
            return (1,1,1,1)
        }
        return (r, g, b, a)
    }
}

public extension PColor {
    convenience init(hex: UInt) {
        let rgba = hex.toRGBA()
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
}

import SwiftUI
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension Color {
    init(hex: UInt){
        let rgba = hex.toRGBA()
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, opacity: rgba.a)
    }
}
